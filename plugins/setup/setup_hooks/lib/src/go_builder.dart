import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

import 'build.dart';
import 'build_cache.dart';
import 'error.dart';
import 'fingerprint.dart';
import 'options.dart';
import 'target.dart';
import 'util.dart';

final _log = Logger('go_builder');

class GoBuilder {
  GoBuilder({
    required this.rootDir,
    required this.config,
    required this.cache,
    required this.notice,
    this.harnessInputs = const [],
    this.androidToolchain,
  });

  final String rootDir;
  final BuildConfig config;
  final BuildCache cache;
  final BuildNotice notice;
  final List<String> harnessInputs;
  final AndroidToolchain? androidToolchain;

  String get _corePath => p.join(rootDir, config.coreDir);
  String get _outputPath => p.join(rootDir, config.outputDir);

  String _resolveCc(Target target) {
    final toolchain = androidToolchain;
    if (toolchain == null) {
      throw BuildException('Android target $target needs an NDK toolchain');
    }
    final cc = toolchain.clangFor(target, windows: Platform.isWindows);
    if (!File(cc).existsSync()) {
      throw BuildException(
        'NDK compiler not found: $cc (API ${toolchain.apiLevel} from the '
        'app minSdk; the NDK Flutter selected may be too old)',
      );
    }
    return cc;
  }

  Future<BuildExecution> build(Target target) async {
    final outDir = target.isLib
        ? p.join(_outputPath, target.platformDir, target.abi!)
        : p.join(_outputPath, target.platformDir);
    ensureDir(outDir);

    final fileName = target.isLib
        ? '${config.libName}.so'
        : '${config.coreName}${target.executableExtension}';
    final outFile = p.join(outDir, fileName);

    return cache.run(
      key: '${target.platformDir}-${target.goarch}-core',
      fingerprint: () => _calculateFingerprint(target),
      primaryOutput: outFile,
      notice: notice,
      build: () async {
        final env = _buildEnvironment(target);
        final cronetDir = _cronetDirectory(target);
        final cronetHash = cronetDir == null || target.goos != 'windows'
            ? null
            : await calcSha256(p.join(cronetDir, 'libcronet.dll'));
        _log.info(
          'Building Go core: $target '
          '${target.isLib ? "(CGO, c-shared)" : "(standalone)"}',
        );

        // A failed build must not destroy the previous artifacts.
        final stagingDir = Directory(
          p.join(outDir, '.staging-${target.goarch}-$pid'),
        );
        final staged = p.join(stagingDir.path, fileName);
        try {
          await runCommandStream(
            'go',
            _buildArguments(target, outFile: staged, cronetHash: cronetHash),
            workingDirectory: _corePath,
            environment: env,
          );

          final outputs = <String>[outFile];
          if (target.isLib) {
            outputs.addAll(
              _installAndroidOutput(
                abi: target.abi!,
                platformDir: p.join(_outputPath, target.platformDir),
                stagingDir: stagingDir.path,
                libName: fileName,
                outFile: outFile,
              ),
            );
          } else {
            if (cronetDir != null) {
              for (final entry in {
                if (target.goos == 'windows') 'libcronet.dll': 'libcronet.dll',
                'LICENSE': 'LICENSE.cronet',
              }.entries) {
                final destination = p.join(outDir, entry.value);
                final stagedAsset = File(p.join(stagingDir.path, entry.value));
                stagedAsset.writeAsBytesSync(
                  File(p.join(cronetDir, entry.key)).readAsBytesSync(),
                );
                replaceFile(stagedAsset.path, destination);
                outputs.add(destination);
              }
            }
            replaceFile(staged, outFile);
          }

          _log.info('Built: $outFile');
          return outputs;
        } finally {
          if (stagingDir.existsSync()) {
            stagingDir.deleteSync(recursive: true);
          }
        }
      },
    );
  }

  Map<String, String> _buildEnvironment(Target target) {
    final env = <String, String>{'GOOS': target.goos, 'GOARCH': target.goarch};
    if (target.isLib) {
      env
        ..['CGO_ENABLED'] = '1'
        ..['CC'] = _resolveCc(target)
        ..['CFLAGS'] = '-O3 -Werror';
    } else if (target.goos == 'darwin') {
      if (!Platform.isMacOS) {
        throw BuildException('macOS Core with Naive requires macOS and Xcode');
      }
      final sdk =
          (runCommand('xcrun', ['--sdk', 'macosx', '--show-sdk-path']).stdout
                  as String)
              .trim();
      final cc =
          (runCommand('xcrun', ['--sdk', 'macosx', '--find', 'clang']).stdout
                  as String)
              .trim();
      env
        ..['CGO_ENABLED'] = '1'
        ..['CC'] = cc
        ..['SDKROOT'] = sdk
        ..['MACOSX_DEPLOYMENT_TARGET'] = '12.0';
    } else {
      env['CGO_ENABLED'] = '0';
    }
    return env;
  }

  // AGP strips the copy it packages into the APK, and Crashlytics reads the
  // unstripped one from the merged native libs, so Android keeps its symbols.
  String _ldflags(Target target) => target.isLib
      ? config.goLdflags
            .split(' ')
            .where((flag) => flag != '-s' && flag != '-w')
            .join(' ')
      : config.goLdflags;

  String _tags(Target target) => [
    config.tags,
    if (target.goos == 'windows' && config.windowsTags.isNotEmpty)
      config.windowsTags,
    if (target.goos == 'android' && config.androidTags.isNotEmpty)
      config.androidTags,
    if (target.goos == 'darwin' && config.macosTags.isNotEmpty)
      config.macosTags,
  ].join(',');

  String? _cronetDirectory(Target target) {
    if (!const {'windows', 'darwin'}.contains(target.goos) ||
        !_tags(target).split(',').contains('with_naive_outbound')) {
      return null;
    }
    final result = runCommand(
      'go',
      [
        'list',
        '-tags=${_tags(target)}',
        '-f',
        '{{.Dir}}',
        'github.com/sagernet/cronet-go/lib/${target.goos}_${target.goarch}',
      ],
      workingDirectory: _corePath,
      environment: _buildEnvironment(target),
    );
    return (result.stdout as String).trim();
  }

  List<String> _buildArguments(
    Target target, {
    String? outFile,
    String? cronetHash,
  }) => [
    'build',
    '-ldflags=${_ldflags(target)}${cronetHash == null ? '' : ' -X main.cronetSHA256=$cronetHash'}',
    '-tags=${_tags(target)}',
    if (target.isLib) '-buildmode=c-shared',
    if (outFile != null) ...['-o', outFile],
  ];

  Future<Fingerprint> _calculateFingerprint(Target target) async {
    final env = _buildEnvironment(target);
    final builder = FingerprintBuilder(rootDir: rootDir)
      ..addValue('cache_schema', BuildCache.schemaVersion)
      ..addValue('kind', 'go-core')
      ..addValue('target', {
        'goos': target.goos,
        'goarch': target.goarch,
        'abi': target.abi,
      })
      ..addValue('config', config.toFingerprintMap())
      ..addValue('environment', env)
      ..addValue('arguments', _buildArguments(target));

    final goEnvResult = runCommand(
      'go',
      [
        'env',
        '-json',
        'GOVERSION',
        'GOTOOLCHAIN',
        'GOFLAGS',
        'GOEXPERIMENT',
        'GOAMD64',
        'GOARM',
        'GO386',
        'GOMIPS',
        'GOMIPS64',
        'CGO_CFLAGS',
        'CGO_CPPFLAGS',
        'CGO_CXXFLAGS',
        'CGO_LDFLAGS',
        'GOWORK',
        'GOENV',
      ],
      workingDirectory: _corePath,
      environment: env,
    );
    final goEnv = jsonDecode((goEnvResult.stdout as String).trim());
    builder.addValue('go_env', goEnv);

    final inputs = _resolveGoInputs(target, env);
    final cronetDir = _cronetDirectory(target);
    if (cronetDir != null) {
      inputs.addAll([
        p.join(
          cronetDir,
          target.goos == 'windows' ? 'libcronet.dll' : 'libcronet.a',
        ),
        p.join(cronetDir, 'LICENSE'),
      ]);
    }
    final goWork = (goEnv as Map<String, dynamic>)['GOWORK'];
    if (goWork is String && goWork.isNotEmpty && goWork != 'off') {
      inputs.add(goWork);
      final goWorkSum = p.join(p.dirname(goWork), 'go.work.sum');
      if (File(goWorkSum).existsSync()) inputs.add(goWorkSum);
    }
    inputs.addAll(harnessInputs);

    if (target.isLib || target.goos == 'darwin') {
      final compilerVersion = runCommand(env['CC']!, ['--version']);
      builder.addValue(
        'native_compiler',
        '${(compilerVersion.stdout as String).trim()}\n'
            '${(compilerVersion.stderr as String).trim()}',
      );
    }

    if (target.goos == 'darwin') {
      final sdkVersion = runCommand('xcrun', [
        '--sdk',
        'macosx',
        '--show-sdk-version',
      ]);
      builder.addValue('macos_sdk', (sdkVersion.stdout as String).trim());
    }
    builder.addFiles(inputs);
    return builder.finishWithInputs();
  }

  Set<String> _resolveGoInputs(Target target, Map<String, String> environment) {
    const template =
        r'''{{.ImportPath}}{{"\n"}}{{range .GoFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .CgoFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .CFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .CXXFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .MFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .HFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .FFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .SFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .SwigFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .SwigCXXFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .SysoFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{range .EmbedFiles}}{{$.Dir}}/{{.}}{{"\n"}}{{end}}{{with .Module}}{{if .GoMod}}{{.GoMod}}{{"\n"}}{{end}}{{end}}''';
    final result = runCommand(
      'go',
      ['list', '-deps', '-tags=${_tags(target)}', '-f', template, '.'],
      workingDirectory: _corePath,
      environment: environment,
    );
    final corePath = p.normalize(p.absolute(_corePath));
    final inputs = <String>{};
    for (final line in (result.stdout as String).split('\n')) {
      final value = line.trim();
      if (value.isEmpty) continue;
      if (value == 'github.com/metacubex/mihomo' ||
          value.startsWith('github.com/metacubex/mihomo/')) {
        throw BuildException('FastAI releases must only link sing-box.');
      }
      final filePath = p.normalize(
        p.absolute(p.isAbsolute(value) ? value : p.join(_corePath, value)),
      );
      if (p.isWithin(p.join(corePath, 'Clash.Meta'), filePath)) {
        throw BuildException('FastAI releases must only link sing-box.');
      }
      if (!p.isWithin(corePath, filePath) && !p.equals(corePath, filePath)) {
        continue;
      }
      if (!File(filePath).existsSync()) continue;
      inputs.add(filePath);
      if (p.basename(filePath) == 'go.mod') {
        final goSum = p.join(p.dirname(filePath), 'go.sum');
        if (File(goSum).existsSync()) inputs.add(goSum);
      }
    }

    for (final name in const ['go.mod', 'go.sum']) {
      final filePath = p.join(_corePath, name);
      if (File(filePath).existsSync()) inputs.add(filePath);
    }
    return inputs;
  }

  List<String> _installAndroidOutput({
    required String abi,
    required String platformDir,
    required String stagingDir,
    required String libName,
    required String outFile,
  }) {
    final includesPath = p.join(platformDir, 'includes', abi);
    final androidCoreMainPath = p.join(
      rootDir,
      'android',
      'core',
      'src',
      'main',
    );
    final jniLibsPath = p.join(androidCoreMainPath, 'jniLibs', abi);
    final cppIncludesPath = p.join(androidCoreMainPath, 'cpp', 'includes', abi);
    final outputs = <String>[];

    ensureDir(includesPath);
    _clearDirectory(includesPath);
    ensureDir(cppIncludesPath);
    _clearDirectory(cppIncludesPath);

    replaceFile(p.join(stagingDir, libName), outFile);
    copyFile(outFile, p.join(jniLibsPath, libName));
    outputs.add(p.join(jniLibsPath, libName));

    final generatedHeaders = Directory(stagingDir).listSync();
    final staticHeaders = Directory(_corePath).listSync();
    for (final file in [...generatedHeaders, ...staticHeaders]) {
      if (!file.path.endsWith('.h')) continue;
      final headerName = p.basename(file.path);
      final includePath = p.join(includesPath, headerName);
      final cppIncludePath = p.join(cppIncludesPath, headerName);
      copyFile(file.path, includePath);
      copyFile(file.path, cppIncludePath);
      outputs
        ..add(includePath)
        ..add(cppIncludePath);
    }
    return outputs;
  }

  void _clearDirectory(String dirPath) {
    final dir = Directory(dirPath);
    if (!dir.existsSync()) return;

    for (final entity in dir.listSync()) {
      if (entity is File || entity is Link) {
        entity.deleteSync();
      } else if (entity is Directory) {
        entity.deleteSync(recursive: true);
      }
    }
  }
}

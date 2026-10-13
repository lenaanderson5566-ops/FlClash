import 'dart:convert';
import 'dart:io';

import 'proxy_command.dart';

typedef ProxyValues = Map<String, String>;

class ProxySettingsGroup {
  final String id;
  final Future<ProxyValues> Function() read;
  final Future<void> Function(ProxyValues values) write;
  final ProxyValues target;

  ProxySettingsGroup({
    required this.id,
    required this.read,
    required this.write,
    required this.target,
  });
}

class ProxyRecovery {
  final ProxyCommandRunner runner;
  final String backend;

  ProxyRecovery(this.runner, this.backend);

  Future<File> _file() async {
    final home = Platform.environment['HOME'];
    if (home == null || home.isEmpty) {
      throw StateError('Missing home directory');
    }
    final directory = Directory('$home/.fastai-proxy-recovery');
    if (await FileSystemEntity.isLink(directory.path)) {
      throw StateError('Invalid recovery directory');
    }
    await directory.create(recursive: true);
    final result = await runner.process('/bin/chmod', ['700', directory.path]);
    if (result.exitCode != 0) {
      throw StateError('Cannot protect recovery directory');
    }
    return File('${directory.path}/$backend.json');
  }

  Future<void> _save(File file, Map<String, dynamic> records) async {
    final temporary = File('${file.path}.tmp');
    if (await FileSystemEntity.isLink(temporary.path) ||
        await FileSystemEntity.isLink(file.path)) {
      throw StateError('Invalid recovery file');
    }
    final encoded = utf8.encode(jsonEncode(records));
    if (encoded.length > 1024 * 1024) {
      throw StateError('Recovery record too large');
    }
    await temporary.writeAsBytes(encoded, flush: true);
    final result = await runner.process('/bin/chmod', ['600', temporary.path]);
    if (result.exitCode != 0) throw StateError('Cannot protect recovery file');
    await temporary.rename(file.path);
  }

  bool _owned(ProxyValues current, ProxyValues original, ProxyValues applied) =>
      current.length == original.length &&
      original.length == applied.length &&
      original.keys.every(
        (key) => current[key] == original[key] || current[key] == applied[key],
      );

  Future<bool> restore(List<ProxySettingsGroup> groups) async {
    final file = await _file();
    if (!await file.exists()) return true;
    if (await FileSystemEntity.isLink(file.path) ||
        await file.length() > 1024 * 1024) {
      throw StateError('Invalid recovery file');
    }
    final records = Map<String, dynamic>.from(
      jsonDecode(await file.readAsString()) as Map,
    );
    for (final group in groups) {
      final record = records[group.id];
      if (record == null) continue;
      final original = Map<String, String>.from(record['original'] as Map);
      final applied = Map<String, String>.from(record['applied'] as Map);
      final current = await group.read();
      if (_owned(current, original, applied)) {
        if (!original.keys.every((key) => current[key] == original[key])) {
          await group.write(original);
        }
        final restored = await group.read();
        if (restored.length != original.length ||
            !original.keys.every((key) => restored[key] == original[key])) {
          return false;
        }
      }
      records.remove(group.id);
      await _save(file, records);
    }
    if (records.isNotEmpty) return false;
    await file.delete();
    return true;
  }

  Future<bool> apply(List<ProxySettingsGroup> groups) async {
    if (groups.isEmpty || !await restore(groups)) return false;
    final records = <String, dynamic>{};
    for (final group in groups) {
      records[group.id] = {
        'original': await group.read(),
        'applied': group.target,
      };
    }
    final file = await _file();
    await _save(file, records);
    try {
      for (final group in groups) {
        final before = await group.read();
        final original = records[group.id]['original'] as ProxyValues;
        if (before.length != original.length ||
            !original.keys.every((key) => before[key] == original[key])) {
          throw StateError(
            'System proxy changed while preparing configuration',
          );
        }
        await group.write(group.target);
        final current = await group.read();
        if (!group.target.keys.every(
          (key) => current[key] == group.target[key],
        )) {
          throw StateError('System proxy did not apply');
        }
      }
      return true;
    } catch (_) {
      await restore(groups);
      rethrow;
    }
  }
}

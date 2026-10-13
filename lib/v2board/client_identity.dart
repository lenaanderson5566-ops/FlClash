import 'dart:ffi';
import 'dart:io';

import 'config.dart';

String get fastaiArchitecture => switch (Abi.current()) {
  Abi.androidArm || Abi.linuxArm => 'arm',
  Abi.androidArm64 ||
  Abi.linuxArm64 ||
  Abi.macosArm64 ||
  Abi.windowsArm64 => 'arm64',
  Abi.androidIA32 || Abi.linuxIA32 || Abi.windowsIA32 => 'x86',
  _ => 'x64',
};

String fastaiUserAgent([String? version]) =>
    '${V2BoardConfig.appName}${version == null || version.isEmpty ? '' : '/$version'} '
    '(${Platform.operatingSystem}; $fastaiArchitecture)';

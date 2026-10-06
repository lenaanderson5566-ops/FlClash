import 'package:fastai/models/models.dart';
import 'config.dart';

PatchClashConfig managedPatchConfig(PatchClashConfig saved) {
  if (!V2BoardConfig.enabled) return saved;
  return const PatchClashConfig().copyWith(
    mode: saved.mode,
    logLevel: saved.logLevel,
    tun: defaultTun.copyWith(enable: saved.tun.enable),
  );
}

Config managedNetworkConfig(Config saved) {
  if (!V2BoardConfig.enabled) return saved;
  return saved.copyWith(
    patchClashConfig: managedPatchConfig(saved.patchClashConfig),
    networkProps: NetworkProps(
      systemProxy: !saved.patchClashConfig.tun.enable,
      routeMode: saved.networkProps.routeMode,
    ),
    vpnProps: VpnProps(accessControlProps: saved.vpnProps.accessControlProps),
    overrideDns: false,
    overrideNtp: false,
    appSettingProps: saved.appSettingProps.copyWith(checkCertificate: true),
  );
}

import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/state.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/v2board/network_policy.dart';
import 'package:fastai/views/config/connection_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import '../helpers/test_app.dart';

void main() {
  test(
    'loading old configuration retains supported preferences and resets advanced settings',
    () {
      final saved = Config.realFromJson(null).copyWith(
        excludeSSIDs: ['old-network'],
        appSettingProps: const AppSettingProps(
          developerMode: true,
          silentLaunch: true,
        ),
        overrideDns: true,
        overrideNtp: true,
        patchClashConfig: const PatchClashConfig(
          mixedPort: 9999,
          port: 8888,
          allowLan: true,
          ipv6: true,
          interfaceNameMode: InterfaceNameMode.custom,
          interfaceName: 'old-adapter',
          mode: Mode.global,
          tun: Tun(enable: true),
          externalController: ExternalControllerStatus.open,
        ),
        networkProps: const NetworkProps(
          systemProxy: true,
          appendSystemDns: true,
          routeMode: RouteMode.bypassPrivate,
          authentication: AuthenticationProps(
            enable: true,
            username: 'old',
            password: 'old',
          ),
        ),
      );
      final container = ProviderContainer(
        overrides: buildConfigOverrides(saved),
      );
      addTearDown(container.dispose);
      final patch = container.read(patchClashConfigProvider);
      final network = container.read(networkSettingProvider);
      expect(patch.mixedPort, defaultMixedPort);
      expect(patch.port, 0);
      expect(patch.allowLan, isFalse);
      expect(patch.ipv6, isFalse);
      expect(patch.interfaceNameMode, InterfaceNameMode.clear);
      expect(patch.externalController, ExternalControllerStatus.close);
      expect(patch.tun.enable, isTrue);
      expect(patch.mode, Mode.global);
      expect(network.systemProxy, isFalse);
      expect(network.appendSystemDns, isFalse);
      expect(network.authentication.credentials, isEmpty);
      expect(network.routeMode, RouteMode.bypassPrivate);
      expect(container.read(excludeSSIDsProvider), isEmpty);
      expect(container.read(appSettingProvider).developerMode, isFalse);
      expect(container.read(appSettingProvider).silentLaunch, isFalse);
      expect(container.read(overrideDnsProvider), isFalse);
      expect(container.read(overrideNtpProvider), isFalse);
      expect(container.read(vpnSettingProvider).enable, isTrue);
      expect(
        managedNetworkConfig(managedNetworkConfig(saved)),
        managedNetworkConfig(saved),
      );
    },
  );

  test(
    'connection state drives system proxy and TUN is mutually exclusive',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final subscription = container.listen(proxyStateProvider, (_, _) {});
      addTearDown(subscription.close);
      expect(container.read(proxyStateProvider).isStart, isFalse);
      container.read(networkSettingProvider.notifier).value =
          const NetworkProps(systemProxy: false);
      container.read(runTimeProvider.notifier).value = 1;
      expect(container.read(proxyStateProvider).systemProxy, isTrue);
      expect(container.read(proxyStateProvider).isStart, isTrue);
      container
          .read(patchClashConfigProvider.notifier)
          .update((state) => state.copyWith.tun(enable: true));
      expect(container.read(proxyStateProvider).systemProxy, isFalse);
      container.read(runTimeProvider.notifier).value = null;
      expect(container.read(proxyStateProvider).isStart, isFalse);
    },
  );

  testWidgets('desktop connection chooser switches to TUN', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    globalState.container = container;
    container
        .read(viewSizeProvider.notifier)
        .update((_) => const Size(800, 600));
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const TestApp(
          child: Scaffold(body: ConnectionSettings(isDesktop: true, segmented: true)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('TUN'));
    await tester.pumpAndSettle();
    expect(container.read(patchClashConfigProvider).tun.enable, isTrue);
    expect(container.read(proxyStateProvider).systemProxy, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Android exposes private-network bypass and keeps VPN enabled', (
    tester,
  ) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const TestApp(
          child: Scaffold(body: ConnectionSettings(isDesktop: false)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('System proxy'), findsNothing);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(
      container.read(networkSettingProvider).routeMode,
      RouteMode.bypassPrivate,
    );
    expect(container.read(vpnSettingProvider).enable, isTrue);
    expect(tester.takeException(), isNull);
  });
}

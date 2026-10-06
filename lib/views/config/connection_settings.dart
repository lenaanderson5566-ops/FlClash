import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class ConnectionSettings extends ConsumerWidget {
  const ConnectionSettings({super.key, this.isDesktop});
  final bool? isDesktop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isDesktop ?? system.isDesktop) {
      final denied =
          ref.watch(authorizedTunEnableProvider) ==
          TunAuthorizationState.unauthorized;
      return ConfigOptionsItem<bool>(
        title: (l) => l.connection,
        subtitle: denied ? (l) => l.tunDesc : null,
        options: const [false, true],
        textBuilder: (tun) => tun
            ? context.appLocalizations.tun
            : context.appLocalizations.systemProxy,
        selector: patchClashConfigProvider.select((state) => state.tun.enable),
        onChanged: (ref, tun) =>
            ref.read(setupActionProvider.notifier).changeConnectionMode(tun),
      );
    }
    return ConfigToggleItem(
      title: (l) => l.routeModeBypassPrivate,
      selector: networkSettingProvider.select(
        (state) => state.routeMode == RouteMode.bypassPrivate,
      ),
      onChanged: (ref, bypass) => ref
          .read(networkSettingProvider.notifier)
          .update(
            (state) => state.copyWith(
              routeMode: bypass ? RouteMode.bypassPrivate : RouteMode.config,
            ),
          ),
    );
  }
}

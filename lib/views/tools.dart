import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/views/access.dart';
import 'package:fastai/views/config/general.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fastai/v2board/config.dart';

import 'disclaimer.dart';

class ToolsView extends ConsumerStatefulWidget {
  const ToolsView({super.key});

  @override
  ConsumerState<ToolsView> createState() => _ToolViewState();
}

class _ToolViewState extends ConsumerState<ToolsView> {
  List<Widget> _getOtherList() {
    return generateSection(
      title: context.appLocalizations.other,
      items: [if (!V2BoardConfig.enabled) const _DisclaimerItem()],
    );
  }

  List<Widget> _getSettingList() {
    return generateSection(
      title: null,
      items: [
        const _LocaleItem(),
        if (system.isDesktop) const ProxyAddressItem(),
        if (system.isAndroid) const _AccessItem(),
        if (system.isAndroid) const GeneralSettings(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [..._getSettingList(), ..._getOtherList()];
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Text(
              context.appLocalizations.settings,
              style: context.textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: ListView.builder(
              key: toolsStoreKey,
              itemCount: items.length,
              itemBuilder: (_, index) => items[index],
              padding: EdgeInsets.fromLTRB(
                8,
                0,
                8,
                24 + BottomInsetScope.of(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocaleItem extends ConsumerWidget {
  const _LocaleItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(
      appSettingProvider.select((state) => state.locale),
    );
    final currentLocale =
        getLocaleForString(locale) ?? Localizations.localeOf(context);
    return ListItem<Locale>.options(
      leading: const GlyphIcon(AppGlyphs.language),
      title: Text(context.appLocalizations.language),
      subtitle: Text(currentLocale.label),
      dialogTitle: context.appLocalizations.language,
      options: AppLocalizations.delegate.supportedLocales,
      onChanged: (Locale? locale) {
        if (locale == null) return;
        ref
            .read(appSettingProvider.notifier)
            .update((state) => state.copyWith(locale: locale.toString()));
      },
      textBuilder: (locale) => locale.label,
      value: currentLocale,
    );
  }
}

class _AccessItem extends StatelessWidget {
  const _AccessItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const GlyphIcon(AppGlyphs.appsList),
      title: Text(context.appLocalizations.accessControl),
      subtitle: Text(context.appLocalizations.accessControlDesc),
      widget: const AccessView(),
    );
  }
}

class _DisclaimerItem extends StatelessWidget {
  const _DisclaimerItem();

  @override
  Widget build(BuildContext context) {
    return ListItem.open(
      leading: const GlyphIcon(AppGlyphs.gavel),
      title: Text(context.appLocalizations.disclaimer),
      widget: const DisclaimerView(),
    );
  }
}

class ProxyAddressItem extends ConsumerWidget {
  const ProxyAddressItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.appLocalizations;
    final port = ref.watch(
      patchClashConfigProvider.select((state) => state.mixedPort),
    );
    return ListTile(
      leading: const GlyphIcon(AppGlyphs.proxies),
      title: Text(l.fdLocalProxy),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SelectableText('127.0.0.1:$port'), Text(l.fdLocalProxyHint)],
      ),
    );
  }
}

import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/providers/config.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProxiesSetting extends ConsumerWidget {
  const ProxiesSetting({super.key});

  Glyph _getIconWithProxiesSortType(ProxiesSortType type) {
    return switch (type) {
      ProxiesSortType.none => AppGlyphs.sort,
      ProxiesSortType.delay => AppGlyphs.bolt,
      ProxiesSortType.name => AppGlyphs.sortAlpha,
    };
  }

  String _getStringProxiesSortType(BuildContext context, ProxiesSortType type) {
    final appLocalizations = context.appLocalizations;
    return switch (type) {
      ProxiesSortType.none => appLocalizations.defaultText,
      ProxiesSortType.delay => appLocalizations.delay,
      ProxiesSortType.name => appLocalizations.name,
    };
  }

  List<Widget> _buildSortSetting(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    return generateSection(
      title: appLocalizations.sort,
      items: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          child: Consumer(
            builder: (_, ref, _) {
              final sortType = ref.watch(
                proxiesStyleSettingProvider.select((state) => state.sortType),
              );
              return Wrap(
                spacing: 16,
                children: [
                  for (final item in ProxiesSortType.values)
                    SettingInfoCard(
                      Info(
                        label: _getStringProxiesSortType(context, item),
                        glyph: _getIconWithProxiesSortType(item),
                      ),
                      isSelected: sortType == item,
                      onPressed: () {
                        ref.read(proxiesStyleSettingProvider.notifier).update((
                          state,
                        ) {
                          return state.copyWith(sortType: item);
                        });
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFilterSetting(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    return generateSection(
      title: appLocalizations.filter,
      items: [
        ConfigToggleItem(
          title: (l) => l.hideTimeoutProxies,
          subtitle: (l) => l.hideTimeoutProxiesDesc,
          selector: proxiesStyleSettingProvider.select(
            (state) => state.hideTimeoutProxies,
          ),
          onChanged: (ref, value) {
            ref
                .read(proxiesStyleSettingProvider.notifier)
                .update((state) => state.copyWith(hideTimeoutProxies: value));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: ref.sheetHeight(context, 0.7)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: context.contentTopPadding, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildSortSetting(context),
            ..._buildFilterSetting(context),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:fastai/widgets/list.dart';
import 'package:fastai/widgets/config_item.dart';
import 'package:fastai/widgets/scaffold.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fastai/v2board/config.dart';
import 'package:fastai/v2board/update.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends ConsumerWidget {
  const AboutView({super.key});

  Future<void> _checkUpdate(BuildContext context, WidgetRef ref) async {
    if (V2BoardConfig.enabled) {
      await checkFastaiUpdate(context, ref);
      return;
    }
    if (ref.read(loadingProvider(LoadingTag.checkUpdate))) return;
    final commonAction = ref.read(commonActionProvider.notifier);
    final data = await globalState.loadingRun<Map<String, dynamic>?>(
      request.checkForUpdate,
      title: context.appLocalizations.checkUpdate,
      tag: LoadingTag.checkUpdate,
    );
    unawaited(commonAction.checkUpdateResultHandle(data: data, isUser: true));
  }

  Widget _buildLinkItem({
    required Glyph glyph,
    required String title,
    required String url,
    required String label,
    VoidCallback? onTap,
  }) {
    return ListItem(
      leading: _LinkBadge(glyph: glyph),
      title: Text(title),
      subtitle: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const GlyphIcon(AppGlyphs.openExternal),
      onTap:
          onTap ??
          () {
            dialogs.openUrl(url);
          },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final isLoading = ref.watch(loadingProvider(LoadingTag.checkUpdate));
    return CommonScaffold(
      isLoading: isLoading,
      title: appLocalizations.about,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(top: context.contentTopPadding, bottom: 32),
        children: [
          _AboutHero(
            isCheckingUpdate: isLoading,
            onCheckUpdate: () {
              _checkUpdate(context, ref);
            },
          ),
          const SizedBox(height: 16),
          ConfigToggleItem(
            title: (l) => l.autoCheckUpdate,
            subtitle: (l) => l.fdAutoCheckUpdateDesc,
            selector: appSettingProvider.select((s) => s.autoCheckUpdate),
            onChanged: (ref, enabled) => ref
                .read(appSettingProvider.notifier)
                .update((s) => s.copyWith(autoCheckUpdate: enabled)),
          ),
          const SizedBox(height: 8),
          generateSectionV3(
            title: appLocalizations.more,
            items: [
              _buildLinkItem(
                glyph: AppGlyphs.send,
                title: appLocalizations.fdOfficialWebsite,
                url: V2BoardConfig.websiteUrl,
                label:
                    Uri.tryParse(V2BoardConfig.websiteUrl)?.host ??
                    V2BoardConfig.websiteUrl,
                onTap: () async {
                  try {
                    final url = Uri.parse(V2BoardConfig.websiteUrl);
                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw StateError('Website launch failed');
                    }
                  } catch (_) {
                    if (context.mounted) {
                      context.showNotifier(appLocalizations.fdRequestFailed);
                    }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  final bool isCheckingUpdate;
  final VoidCallback onCheckUpdate;

  const _AboutHero({
    required this.isCheckingUpdate,
    required this.onCheckUpdate,
  });

  static const _logoSize = 96.0;
  static const _logoInset = 14.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final appLocalizations = context.appLocalizations;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Column(
        children: [
          DecoratedBox(
            decoration: ShapeDecoration(
              color: colorScheme.surfaceContainerHigh,
              shape: AppShape.all(AppCorner.fit(_logoSize)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(_logoInset),
              child: SvgPicture.asset(
                'assets/images/fastai-mark.svg',
                width: _logoSize - _logoInset * 2,
                height: _logoSize - _logoInset * 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            appName,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _Pill(
                label: 'v${globalState.packageInfo.version}',
                color: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
              _Pill(
                label: 'GPL-3.0',
                color: colorScheme.surfaceContainerHighest,
                foregroundColor: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Text(
              appLocalizations.desc,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: isCheckingUpdate ? null : onCheckUpdate,
            icon: const GlyphIcon(AppGlyphs.sync, fill: 1),
            label: Text(appLocalizations.checkUpdate),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  final Color foregroundColor;

  const _Pill({
    required this.label,
    required this.color,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(color: color, shape: AppShape.full),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: foregroundColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _LinkBadge extends StatelessWidget {
  final Glyph glyph;

  const _LinkBadge({required this.glyph});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: colorScheme.secondaryContainer,
        shape: AppShape.md,
      ),
      child: SizedBox.square(
        dimension: 40,
        child: Center(
          child: GlyphIcon(
            glyph,
            size: 20,
            color: colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

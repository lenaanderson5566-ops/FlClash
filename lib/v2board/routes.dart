import 'node_metadata.dart';
import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Group? primaryRouteGroup(List<Group> groups) => groups
    .where(
      (g) =>
          g.name != 'GLOBAL' &&
          g.type == GroupType.Selector &&
          g.hidden != true,
    )
    .firstOrNull;

List<Proxy> selectableRoutes(Group group, List<Group> groups) {
  final groupNames = groups.map((g) => g.name).toSet();
  return group.all
      .where(
        (p) =>
            !groupNames.contains(p.name) &&
            !const {
              'DIRECT',
              'REJECT',
              'REJECT-DROP',
              'PASS',
              'COMPATIBLE',
            }.contains(p.name.toUpperCase()) &&
            !const {
              'direct',
              'reject',
              'rejectdrop',
              'pass',
            }.contains(p.type.toLowerCase()),
      )
      .toList();
}

class FastaiRoutesView extends ConsumerStatefulWidget {
  const FastaiRoutesView({super.key, required this.onSync});
  final Future<void> Function() onSync;
  @override
  ConsumerState<FastaiRoutesView> createState() => _FastaiRoutesViewState();
}

class _FastaiRoutesViewState extends ConsumerState<FastaiRoutesView> {
  bool _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } catch (_) {
      if (mounted) {
        context.showNotifier(context.appLocalizations.fdRequestFailed);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    final metadata = ref.watch(fastaiNodeMetadataProvider).asData?.value ?? {};
    final locale = Localizations.localeOf(context);
    final groups = ref.watch(groupsProvider);
    final group = primaryRouteGroup(groups);
    final nodes = group == null ? <Proxy>[] : selectableRoutes(group, groups);
    final auto = group?.all
        .where(
          (p) => groups.any(
            (g) => g.name == p.name && g.type == GroupType.URLTest,
          ),
        )
        .firstOrNull;
    final selected = group == null
        ? null
        : ref.watch(selectedProxyNameProvider(group.name));
    Future<void> choose(String name) async {
      if (group == null) {
        return;
      }
      final action = ref.read(proxiesActionProvider.notifier);
      await action.changeProxy(groupName: group.name, proxyName: name);
      if (!mounted ||
          ref.read(currentProfileProvider)?.selectedMap[group.name] != name) {
        return;
      }
      if (groups.any(
        (g) => g.name == 'GLOBAL' && g.all.any((p) => p.name == group.name),
      )) {
        await action.changeProxy(groupName: 'GLOBAL', proxyName: group.name);
      }
      if (mounted && context.mounted) {
        action.updateGroupsDebounce();
      }
    }

    Widget row(Proxy proxy, String title) {
      final delay = ref.watch(
        delayProvider(proxyName: proxy.name, testUrl: group?.testUrl),
      );
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Material(
          color: selected == proxy.name
              ? context.colorScheme.primaryContainer
              : context.colorScheme.surface,
          shape: AppShape.lg.copyWith(
            side: BorderSide(
              color: selected == proxy.name
                  ? context.colorScheme.primary.withValues(alpha: 0.28)
                  : context.colorScheme.outlineVariant,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            minTileHeight: 56,
            minVerticalPadding: 8,
            horizontalTitleGap: 12,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            leading: NodeRegionFlag(
              regionCode: metadata[proxy.name]?['regionCode'] as String?,
              fallback: const GlyphIcon(AppGlyphs.proxies),
            ),
            title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle:
                (metadata[proxy.name]?['tags'] as List?)
                        ?.whereType<String>()
                        .isNotEmpty ==
                    true
                ? Text(
                    (metadata[proxy.name]!['tags'] as List)
                        .whereType<String>()
                        .join(' · '),
                  )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (delay != null) Text(delay > 0 ? '$delay ms' : l.timeout),
                if (selected == proxy.name) ...[
                  const SizedBox(width: 8),
                  const GlyphIcon(AppGlyphs.check, size: 18),
                ],
              ],
            ),
            selected: selected == proxy.name,
            onTap: _busy ? null : () => _run(() => choose(proxy.name)),
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l.fdChooseRoute,
                  style: context.textTheme.headlineSmall,
                ),
              ),
              IconButton(
                tooltip: l.delayTest,
                onPressed: _busy || nodes.isEmpty
                    ? null
                    : () => _run(
                        () => ref
                            .read(proxiesActionProvider.notifier)
                            .delayTest(nodes, group?.testUrl),
                      ),
                icon: const GlyphIcon(AppGlyphs.bolt),
              ),
              IconButton(
                tooltip: l.fdSync,
                onPressed: _busy ? null : () => _run(widget.onSync),
                icon: const GlyphIcon(AppGlyphs.refresh),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
          child: _busy ? const LinearProgressIndicator() : null,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            itemCount:
                (auto == null ? 0 : 1) + nodes.length + (nodes.isEmpty ? 1 : 0),
            itemBuilder: (_, index) {
              if (auto != null && index == 0) return row(auto, l.fdAutoRoute);
              final nodeIndex = index - (auto == null ? 0 : 1);
              if (nodeIndex >= nodes.length) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(l.fdNodesUnavailable),
                );
              }
              final node = nodes[nodeIndex];
              return row(
                node,
                nodeDisplayName(metadata[node.name], node.name, locale),
              );
            },
          ),
        ),
      ],
    );
  }
}

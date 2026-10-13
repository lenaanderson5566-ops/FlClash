import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:material_ui/material_ui.dart';

import 'api.dart';
import 'node_metadata.dart';

class FastaiRoutePreview extends StatefulWidget {
  const FastaiRoutePreview({
    super.key,
    required this.api,
    required this.notice,
    required this.onRefresh,
    this.busy = false,
  });

  final V2BoardApi api;
  final Widget notice;
  final Future<void> Function() onRefresh;
  final bool busy;

  @override
  State<FastaiRoutePreview> createState() => _FastaiRoutePreviewState();
}

class _FastaiRoutePreviewState extends State<FastaiRoutePreview> {
  late Future<Map<String, Map<String, dynamic>>> _nodes = _load();
  bool _refreshing = false;
  bool _refreshFailed = false;

  Future<Map<String, Map<String, dynamic>>> _load() async =>
      decodeNodeMetadata(await widget.api.list('/me/node-previews'));

  @override
  void didUpdateWidget(covariant FastaiRoutePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.api, widget.api)) {
      _refreshFailed = false;
      _nodes = _load();
    }
  }

  Future<void> _refresh() async {
    if (_refreshing || widget.busy) return;
    setState(() {
      _refreshing = true;
      _refreshFailed = false;
    });
    final api = widget.api;
    try {
      await widget.onRefresh();
      if (mounted && identical(api, widget.api)) {
        setState(() {
          _nodes = _load();
        });
      }
    } catch (_) {
      if (mounted) setState(() => _refreshFailed = true);
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    return FutureBuilder(
      future: _nodes,
      builder: (context, snapshot) {
        final nodes = snapshot.data?.entries.toList() ?? [];
        final loading = snapshot.connectionState == ConnectionState.waiting;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l.fdRoutePreview,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                  IconButton(
                    tooltip: l.fdSync,
                    onPressed: widget.busy || _refreshing || loading
                        ? null
                        : _refresh,
                    icon: const GlyphIcon(AppGlyphs.refresh),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                children: [
                  widget.notice,
                  const SizedBox(height: 16),
                  Text(
                    l.fdRoutePreviewHint,
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  if (loading)
                    const LinearProgressIndicator()
                  else if (_refreshFailed || snapshot.hasError)
                    Text(l.fdSyncFailed)
                  else if (nodes.isEmpty)
                    Text(l.fdRoutesEmpty)
                  else
                    for (final node in nodes)
                      ListTile(
                        enabled: false,
                        leading: NodeRegionFlag(
                          regionCode: node.value['regionCode'] as String?,
                          fallback: const GlyphIcon(AppGlyphs.proxies),
                        ),
                        title: Text(
                          nodeDisplayName(
                            node.value,
                            node.key,
                            Localizations.localeOf(context),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

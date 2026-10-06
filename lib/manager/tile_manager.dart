import 'dart:async';

import 'package:fastai/common/app_localizations.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/plugins/app.dart';
import 'package:fastai/plugins/tile.dart';
import 'package:fastai/providers/providers.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileManager extends ConsumerStatefulWidget {
  final Widget child;

  const TileManager({super.key, required this.child});

  @override
  ConsumerState<TileManager> createState() => _TileContainerState();
}

class _TileContainerState extends ConsumerState<TileManager> with TileListener {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  bool get isStart => ref.read(isStartProvider);

  @override
  Future<void> onStart() async {
    if (isStart && ref.read(coreStatusProvider) == CoreStatus.connected) {
      return;
    }
    unawaited(ref.read(setupActionProvider.notifier).setRunning(true));
    unawaited(app?.tip(currentAppLocalizations.startVpn));
    super.onStart();
  }

  @override
  Future<void> onStop() async {
    if (!isStart) {
      return;
    }
    unawaited(ref.read(setupActionProvider.notifier).setRunning(false));
    unawaited(app?.tip(currentAppLocalizations.stopVpn));
    super.onStop();
  }

  @override
  void initState() {
    super.initState();
    tile?.addListener(this);
  }

  @override
  void dispose() {
    tile?.removeListener(this);
    super.dispose();
  }
}

import 'package:fastai/common/common.dart';
import 'package:fastai/core/core.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'widget_metrics.dart';
import 'widget_registry.dart';
import 'widgets/core_status_button.dart';
import 'widgets/start_button.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasProfile = ref.watch(
      profilesProvider.select((state) => state.isNotEmpty),
    );
    return CommonScaffold(
      title: context.appLocalizations.dashboard,
      actions: [if (coreLib == null) const CoreStatusButton()],
      floatingActionButton: hasProfile ? const StartButton() : null,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16).copyWith(
              top: context.contentTopPadding,
              bottom: 16 + BottomInsetScope.of(context),
            ),
            sliver: SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: dashboardMaxGridWidth),
                  child: LayoutBuilder(
                    builder: (_, constraints) => DashboardWidgetMetrics(
                      unitHeight: dashboardUnitHeight(constraints.maxWidth),
                      child: MotionGrid(
                        crossAxisCount: DashboardGridBand.of(
                          constraints.maxWidth,
                        ).columns,
                        crossAxisSpacing: cardSpacing,
                        mainAxisSpacing: cardSpacing,
                        children: [
                          for (final item in defaultDashboardWidgets)
                            if (item.platforms.contains(
                              SupportPlatform.currentPlatform,
                            ))
                              item.widget,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/views/config/dns.dart';
import 'package:fastai/views/config/network.dart';
import 'package:fastai/views/config/ntp.dart';
import 'package:fastai/widgets/list.dart';
import 'package:fastai/widgets/scaffold.dart';
import 'package:material_ui/material_ui.dart';

class AdvancedConfigView extends StatelessWidget {
  const AdvancedConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final List<Widget> items = [
      ListItem.open(
        title: Text(appLocalizations.network),
        leading: const GlyphIcon(AppGlyphs.key),
        widget: BaseScaffold(
          title: appLocalizations.network,
          body: const NetworkListView(),
        ),
      ),
      ListItem.open(
        title: const Text('DNS'),
        leading: const GlyphIcon(AppGlyphs.dns),
        widget: const DnsView(),
      ),
      ListItem.open(
        title: const Text('NTP'),
        leading: const GlyphIcon(AppGlyphs.clock),
        widget: const NtpView(),
      ),
    ];
    return BaseScaffold(
      title: appLocalizations.advancedConfig,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(top: context.contentTopPadding, bottom: 16),
        children: [generateSectionV3(items: items)],
      ),
    );
  }
}

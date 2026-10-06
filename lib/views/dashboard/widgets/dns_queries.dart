import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/providers/app.dart';
import 'package:fastai/views/dns_queries.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:material_ui/material_ui.dart';

import 'feed_card.dart';

class DnsQueriesCard extends StatelessWidget {
  const DnsQueriesCard({super.key});

  void _openDnsQueries(BuildContext context) {
    showSnapSheet(
      context,
      initialScrollOffset: double.maxFinite,
      builder: (_, controller) => DnsQueriesView(scrollController: controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FeedCard(
      label: PageLabel.dns.label,
      glyph: AppGlyphs.dns,
      onPressed: () => _openDnsQueries(context),
      child: ThrottledFeedCount(provider: dnsQueryCountProvider),
    );
  }
}

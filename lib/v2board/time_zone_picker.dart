import 'package:fastai/common/context.dart';
import 'package:material_ui/material_ui.dart';

const _common = [
  'Asia/Shanghai',
  'Asia/Hong_Kong',
  'Asia/Tokyo',
  'Asia/Singapore',
  'Europe/London',
  'America/New_York',
  'America/Los_Angeles',
  'Australia/Sydney',
  'UTC',
];

String timeZoneTitle(BuildContext context, String zone) {
  final l = context.appLocalizations;
  return switch (zone) {
    'Asia/Shanghai' => l.fdZoneBeijing,
    'Asia/Hong_Kong' => l.fdZoneHongKong,
    'Asia/Tokyo' => l.fdZoneTokyo,
    'Asia/Singapore' => l.fdZoneSingapore,
    'Europe/London' => l.fdZoneLondon,
    'America/New_York' => l.fdZoneNewYork,
    'America/Los_Angeles' => l.fdZoneLosAngeles,
    'Australia/Sydney' => l.fdZoneSydney,
    _ => zone.split('/').last.replaceAll('_', ' '),
  };
}

class TimeZonePicker extends StatefulWidget {
  final List<String> zones;
  final List<Map> choices;
  final String initial;

  const TimeZonePicker({
    super.key,
    required this.zones,
    required this.choices,
    required this.initial,
  });

  @override
  State<TimeZonePicker> createState() => _TimeZonePickerState();
}

class _TimeZonePickerState extends State<TimeZonePicker> {
  late String _selected = widget.initial;
  bool _more = false;
  String _search = '';

  Map? _choice(String zone) {
    for (final choice in widget.choices) {
      if (choice['id'] == zone) return choice;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    final all = {
      ...widget.zones,
      if (widget.initial.isNotEmpty) widget.initial,
    }.toList();
    final visible =
        (_more
                ? all
                : {
                    ..._common.where(all.contains),
                    if (widget.initial.isNotEmpty) widget.initial,
                  })
            .where(
              (zone) =>
                  '${timeZoneTitle(context, zone)} $zone ${zone.replaceAll('_', ' ')}'
                      .toLowerCase()
                      .contains(_search.trim().toLowerCase()),
            )
            .toList();
    final choice = _choice(_selected);
    final local = DateTime.now();
    final minutes = local.timeZoneOffset.inMinutes;
    final deviceOffset =
        'UTC${minutes < 0 ? '-' : '+'}${(minutes.abs() ~/ 60).toString().padLeft(2, '0')}:${(minutes.abs() % 60).toString().padLeft(2, '0')}';
    return AlertDialog(
      title: Text(l.fdTimeZone),
      content: SizedBox(
        width: 420,
        height: MediaQuery.sizeOf(context).height * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.fdTimeZoneHint),
            const SizedBox(height: 12),
            if (_more)
              TextField(
                decoration: InputDecoration(labelText: l.fdSearchTimeZones),
                onChanged: (value) => setState(() => _search = value),
              ),
            Expanded(
              child: ListView(
                children: [
                  if (_search.isEmpty)
                    ListTile(
                      selected: _selected.isEmpty,
                      title: Text(l.fdDeviceTimeZone),
                      subtitle: Text('${local.timeZoneName} $deviceOffset'),
                      onTap: () => setState(() => _selected = ''),
                    ),
                  for (final zone in visible)
                    ListTile(
                      selected: _selected == zone,
                      title: Text(
                        '${timeZoneTitle(context, zone)} ${_choice(zone)?['offset'] ?? ''}',
                      ),
                      subtitle: Text(zone),
                      onTap: () => setState(() => _selected = zone),
                    ),
                  if (visible.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(l.noData),
                    ),
                  if (!_more)
                    TextButton(
                      onPressed: () => setState(() => _more = true),
                      child: Text(l.fdMoreTimeZones),
                    ),
                ],
              ),
            ),
            const Divider(),
            Text(
              _selected.isEmpty
                  ? l.fdDeviceTimeZone
                  : timeZoneTitle(context, _selected),
            ),
            if (choice != null)
              Text(
                '${l.fdTimeZonePreview}: ${choice['preview']} ${choice['offset']}',
              ),
            if (_selected.isEmpty)
              Text(
                '${local.toString().split('.').first} ${local.timeZoneName}',
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_selected),
          child: Text(l.confirm),
        ),
      ],
    );
  }
}

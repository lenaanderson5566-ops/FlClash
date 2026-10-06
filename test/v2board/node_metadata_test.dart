import 'package:fastai/v2board/node_metadata.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';

void main() {
  final node = <String, dynamic>{
    'nodeId': 'v2node_123',
    'proxyName': 'node_v2node_123',
    'name': 'Japan-A',
    'regionCode': 'JP',
    'tags': ['premium'],
    'displayNames': {'zh-CN': '日本 · 东京 · A', 'en-US': 'Japan · Tokyo · A'},
  };
  test('Metadata links stable kernel names without translating identity', () {
    final nodes = decodeNodeMetadata([node]);
    expect(nodes.keys, ['node_v2node_123']);
    expect(
      nodeDisplayName(
        nodes.values.single,
        'node_v2node_123',
        const Locale('zh', 'CN'),
      ),
      '日本 · 东京 · A',
    );
    expect(
      nodeDisplayName(
        nodes.values.single,
        'node_v2node_123',
        const Locale('en'),
      ),
      'Japan · Tokyo · A',
    );
  });
  test('Missing translation falls back to English, then original name', () {
    expect(
      nodeDisplayName(node, 'node_v2node_123', const Locale('ja')),
      'Japan · Tokyo · A',
    );
    expect(
      nodeDisplayName(
        {...node, 'displayNames': {}},
        'node_v2node_123',
        const Locale('ja'),
      ),
      'Japan-A',
    );
    expect(nodeDisplayName(null, 'Legacy', const Locale('en')), 'Legacy');
  });
  test('Rejects duplicate and malformed metadata', () {
    expect(() => decodeNodeMetadata([node, node]), throwsFormatException);
    expect(
      () => decodeNodeMetadata([
        {'proxyName': 'x'},
      ]),
      throwsFormatException,
    );
  });
  test('Old selections migrate only to one valid member', () {
    final metadata = decodeNodeMetadata([node]);
    expect(
      migrateNodeChoice('Japan-A', metadata, ['node_v2node_123']),
      'node_v2node_123',
    );
    expect(migrateNodeChoice('Auto', metadata, ['Auto']), 'Auto');
    expect(migrateNodeChoice('Japan-A', metadata, ['Other']), isNull);
    expect(
      migrateNodeChoice(
        'Japan-A',
        {...metadata, 'node_v2node_124': node},
        ['node_v2node_123', 'node_v2node_124'],
      ),
      isNull,
    );
  });
}

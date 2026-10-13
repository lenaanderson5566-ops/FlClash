import 'package:fastai/common/constant.dart';
import 'package:fastai/common/system.dart';
import 'package:proxy/proxy.dart';

final proxy = system.isDesktop && !safeModeBuild ? ManagedProxy() : null;

class ManagedProxy extends Proxy {
  Future<void> _pending = Future.value();
  Future<bool>? _shutdownOperation;
  bool _closing = false;

  Future<bool> _serialize(Future<bool> Function() operation) {
    final result = _pending.then((_) => operation());
    _pending = result.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return result;
  }

  @override
  Future<bool> startProxy(int port, [List<String> bypassDomain = const []]) {
    final domains = List<String>.of(bypassDomain);
    return _serialize(() async {
      if (_closing) return false;
      return super.startProxy(port, domains);
    });
  }

  @override
  Future<bool> stopProxy() => _serialize(super.stopProxy);

  Future<bool> shutdown() {
    _closing = true;
    return _shutdownOperation ??= _serialize(() async {
      // A failed platform call can still have changed part of the proxy settings.
      try {
        if (await super.stopProxy()) return true;
      } catch (_) {
        // Retry once before allowing the exit coordinator to continue.
      }
      return super.stopProxy();
    });
  }
}

String proxyEnvCommand(int port, {required bool isWindows}) {
  final url = 'http://127.0.0.1:$port';
  return isWindows ? 'set \$env:all_proxy=$url' : 'export all_proxy=$url';
}

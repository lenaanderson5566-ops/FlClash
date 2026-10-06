import 'dart:async';

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:fastai/views/views.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account.dart';
import 'api.dart';
import 'access.dart';
import 'config.dart';
import 'profile.dart';
import 'session.dart';
import 'update.dart';

class V2BoardShell extends StatelessWidget {
  const V2BoardShell({super.key, this.session = const V2BoardSession()});

  final V2BoardSession session;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE77732),
          brightness: theme.brightness,
        ),
      ),
      child: _V2BoardContent(session: session),
    );
  }
}

class _V2BoardContent extends ConsumerStatefulWidget {
  const _V2BoardContent({required this.session});

  final V2BoardSession session;

  @override
  ConsumerState<_V2BoardContent> createState() => _V2BoardShellState();
}

class _V2BoardShellState extends ConsumerState<_V2BoardContent> {
  V2BoardSession get _session => widget.session;
  final _origin = TextEditingController(text: V2BoardConfig.panelUrl);
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _form = GlobalKey<FormState>();
  V2BoardApi? _api;
  V2BoardAccount? _account;
  bool _busy = true;
  String? _error;
  int _tab = 0;
  Future<void>? _forgetting;
  Timer? _accountTimer;

  V2BoardProfile get _profile => V2BoardProfile(ref);

  @override
  void initState() {
    super.initState();
    unawaited(
      _run(() async {
        _api = await _session.restore();
        if (_api != null) {
          _bindSession(_api!);
          _origin.text = _api!.panel.origin;
          await _refresh();
          await _syncAvailable();
        } else if (mounted) {
          await _profile.clear();
        }
      }),
    );
    unawaited(_checkRelease());
    _accountTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted && _api != null && !_busy && ref.read(appVisibleProvider)) {
        unawaited(_run(_refresh));
        unawaited(_checkRelease());
      }
    });
  }

  @override
  void dispose() {
    _origin.dispose();
    _email.dispose();
    _password.dispose();
    _accountTimer?.cancel();
    _api?.close();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    if (mounted) {
      setState(() {
        _busy = true;
        _error = null;
      });
    }
    try {
      await action();
    } on V2BoardProblem catch (error) {
      if (!mounted) return;
      final hadSession = _api != null;
      if (_api != null && error.sessionRejected) {
        await _forget();
      }
      if (!mounted) return;
      final l = context.appLocalizations;
      if (error.code == 'CLIENT_VERSION_TOO_LOW') {
        ref.read(v2BoardAccessProvider.notifier).rejectVersion();
        await ref.read(setupActionProvider.notifier).setRunning(false);
        if (!mounted) return;
        unawaited(_checkRelease(force: true));
      }
      setState(
        () => _error = error.code == 'CLIENT_VERSION_TOO_LOW'
            ? l.fdUpdateRequired
            : switch (error.status) {
                401 => hadSession ? l.fdSessionExpired : l.fdInvalidCredentials,
                403 =>
                  error.code == 'SUBSCRIPTION_UNAVAILABLE'
                      ? l.fdNodesUnavailable
                      : error.code == 'CLIENT_DISABLED'
                      ? l.fdSyncFailed
                      : l.fdBanned,
                422 => l.fdValidationError,
                429 => l.fdRateLimited,
                _ =>
                  error.code == 'subscription_failed'
                      ? l.fdSyncFailed
                      : error.code == 'network_error'
                      ? l.fdNetworkError
                      : l.fdRequestFailed,
              },
      );
    } on FormatException {
      if (mounted) {
        setState(() => _error = context.appLocalizations.fdInvalidUrl);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = context.appLocalizations.fdRequestFailed);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _checkRelease({bool force = false}) async {
    try {
      await ref.read(fastaiReleaseProvider.notifier).check(force: force);
    } catch (_) {
      // Configuration requests still enforce minimum versions when metadata is unreachable.
    }
  }

  Future<void> _refresh() async {
    final api = _api!;
    api.language = Localizations.localeOf(context).toLanguageTag();
    final data = await Future.wait([
      api.object('GET', '/me'),
      api.object('GET', '/me/subscription'),
    ]);
    if (!mounted) return;
    _account = V2BoardAccount(data[0], data[1]);
    ref
        .read(v2BoardAccessProvider.notifier)
        .setAvailable(
          _account!.active && ref.read(fastaiReleaseProvider)?.required != true,
        );
    if ((!_account!.active ||
            ref.read(fastaiReleaseProvider)?.required == true) &&
        ref.read(isStartProvider)) {
      await ref.read(setupActionProvider.notifier).setRunning(false);
    }
  }

  Future<void> _login() async {
    if (!_form.currentState!.validate()) return;
    await _run(() async {
      final api = V2BoardApi(_origin.text)
        ..version = globalState.packageInfo.version;
      api.language = Localizations.localeOf(context).toLanguageTag();
      try {
        await api.login(_email.text, _password.text);
        if (!mounted) {
          api.close();
          return;
        }
        _api?.close();
        _api = api;
        _bindSession(api);
        _password.clear();
        await _refresh();
        if (!mounted) return;
        await _session.save(api);
        await _syncAvailable();
      } catch (_) {
        if (_api != api) api.close();
        rethrow;
      }
    });
  }

  void _bindSession(V2BoardApi api) {
    api.version = globalState.packageInfo.version;
    api.onSessionRejected = () async {
      if (!mounted || _api != api) return;
      Navigator.of(context).popUntil((route) => route.isFirst);
      await _forget();
      if (mounted) setState(() {});
    };
  }

  Future<void> _forget() {
    return _forgetting ??= _forgetSession().whenComplete(
      () => _forgetting = null,
    );
  }

  Future<void> _forgetSession() async {
    if (!mounted) return;
    ref.read(v2BoardAccessProvider.notifier).setAvailable(false);
    _api?.close();
    _api = null;
    _account = null;
    _tab = 0;
    try {
      await _profile.clear();
    } finally {
      await _session.clear();
    }
  }

  Future<void> _logout() async {
    await _run(() async {
      try {
        await _api!.request('DELETE', '/me/session');
      } finally {
        if (mounted) await _forget();
      }
    });
  }

  Future<void> _sync({bool connect = false}) async {
    await _run(() async {
      await _refresh();
      if (!mounted || _account?.active != true) return;
      if (ref.read(fastaiReleaseProvider)?.required == true) {
        await checkFastaiUpdate(context, ref);
        return;
      }
      if (connect) {
        await _profile.connect(_api!);
      } else {
        await _profile.sync(_api!);
      }
    });
  }

  Future<void> _syncAvailable() async {
    if (_account?.active == true &&
        ref.read(fastaiReleaseProvider)?.required != true) {
      await _profile.sync(_api!);
    }
  }

  Future<void> _portal() async {
    final destination = await _session.websiteLink(
      api: _api,
      version: globalState.packageInfo.version,
    );
    if (!await launchUrl(destination, mode: LaunchMode.externalApplication)) {
      throw const V2BoardProblem('request_failed');
    }
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    bool password = false,
    bool origin = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        enabled: !_busy && !(origin && V2BoardConfig.panelUrl.isNotEmpty),
        obscureText: password,
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: password
            ? TextInputType.visiblePassword
            : origin
            ? TextInputType.url
            : TextInputType.emailAddress,
        decoration: InputDecoration(labelText: label),
        validator: (value) => (value ?? '').trim().isEmpty
            ? context.appLocalizations.fdRequired
            : null,
        onFieldSubmitted: (_) {
          if (!_busy) unawaited(_login());
        },
      ),
    );
  }

  Widget _loginView() {
    final l = context.appLocalizations;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: AutofillGroup(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _brandHeader(V2BoardConfig.appName, l.fdWelcome),
                  const SizedBox(height: 24),
                  if (V2BoardConfig.panelUrl.isEmpty)
                    _field(_origin, l.fdPanelUrl, origin: true),
                  _field(_email, l.fdEmail),
                  _field(_password, l.password, password: true),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _busy ? null : _login,
                    child: Text(l.fdLogin),
                  ),
                  TextButton(
                    onPressed: _busy ? null : () => _run(_portal),
                    child: Text(l.fdRegisterHelp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _metric(String label, String value) {
    return ListTile(
      title: Text(label, style: context.textTheme.bodyMedium),
      trailing: Text(value, style: context.textTheme.titleSmall),
    );
  }

  Widget _brandHeader(String title, String subtitle) {
    final colors = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: [colors.primaryContainer, colors.surfaceContainerLow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: AppShape.xxl,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(subtitle, style: context.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(width: 16),
          GlyphIcon(AppGlyphs.fastDog, size: 80, color: colors.primary),
        ],
      ),
    );
  }

  String _bytes(int value) => '${(value / 1073741824).toStringAsFixed(2)} GB';

  Widget _overview() {
    final l = context.appLocalizations;
    final account = _account;
    if (account == null) {
      return Center(
        child: FilledButton(
          onPressed: _busy ? null : () => _run(_refresh),
          child: Text(l.fdRefresh),
        ),
      );
    }
    final status = switch (account.status) {
      'active' => l.fdActive,
      'banned' => l.fdBanned,
      'noPlan' => l.fdNoPlan,
      'exhausted' => l.fdExhausted,
      _ => l.fdExpired,
    };
    final canConnect =
        account.active && ref.watch(fastaiReleaseProvider)?.required != true;
    final running = ref.watch(isStartProvider);
    final mode = ref.watch(patchClashConfigProvider.select((s) => s.mode));
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _brandHeader(l.fdConnection, l.fdHeroSubtitle),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: context.colorScheme.surfaceContainerLowest,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: ShapeDecoration(
                        color: running
                            ? context.colorScheme.primary
                            : context.colorScheme.outline,
                        shape: AppShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        running ? l.fdConnected : l.fdDisconnected,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(status, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: _busy || !canConnect
                      ? null
                      : () => setState(() => _tab = 1),
                  icon: const GlyphIcon(AppGlyphs.proxies),
                  label: Text(l.fdChooseRoute),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _busy
                      ? null
                      : running
                      ? () => _run(() async {
                          await ref
                              .read(setupActionProvider.notifier)
                              .setRunning(false);
                        })
                      : canConnect
                      ? () => _sync(connect: true)
                      : null,
                  icon: const GlyphIcon(AppGlyphs.proxies, fill: 1),
                  label: Text(running ? l.fdDisconnect : l.fdConnect),
                ),
                TextButton(
                  onPressed: _busy || !canConnect ? null : () => _sync(),
                  child: Text(l.fdSync),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: context.colorScheme.surfaceContainerLowest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const GlyphIcon(AppGlyphs.proxies),
                    const SizedBox(width: 10),
                    Text(l.outboundMode, style: context.textTheme.titleSmall),
                  ],
                ),
                const SizedBox(height: 12),
                SegmentedButton<Mode>(
                  segments: [
                    for (final value in Mode.values)
                      ButtonSegment(value: value, label: Text(value.label)),
                  ],
                  selected: {mode},
                  onSelectionChanged: _busy
                      ? null
                      : (values) {
                          ref
                              .read(setupActionProvider.notifier)
                              .changeMode(values.single);
                        },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: context.colorScheme.surfaceContainerLowest,
          child: Column(
            children: [
              _metric(l.fdRemaining, _bytes(account.remainingBytes)),
              _metric(l.fdCreditBalance, _bytes(account.creditBytes)),
              _metric(
                l.fdExpiry,
                account.expiresAt?.toLocal().toString().split(' ').first ??
                    l.fdNoExpiry,
              ),
              _metric(
                l.fdDevices,
                '${account.subscription['onlineDevices'] ?? 0} / ${account.subscription['deviceLimit'] ?? '—'}',
              ),
            ],
          ),
        ),
        if (!account.active)
          TextButton(
            onPressed: _busy ? null : () => _run(_portal),
            child: Text(l.fdWebAccount),
          ),
      ],
    );
  }

  Widget _myAccount() {
    final l = context.appLocalizations;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _brandHeader(l.account, l.fdAccountSubtitle),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: context.colorScheme.surfaceContainerLowest,
          child: Column(
            children: [
              _metric(l.fdEmail, _account?.email ?? ''),
              _metric(l.fdShop, _account?.planName ?? ''),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const GlyphIcon(AppGlyphs.openExternal),
          title: Text(l.fdWebAccount),
          subtitle: Text(l.fdWebAccountHint),
          trailing: const GlyphIcon(AppGlyphs.openExternal),
          onTap: _busy ? null : () => _run(_portal),
        ),
        ListTile(
          leading: const GlyphIcon(AppGlyphs.proxies),
          title: Text(l.fdSupport),
          onTap: _busy ? null : () => _run(_portal),
        ),
        ListTile(
          leading: const GlyphIcon(AppGlyphs.settings),
          title: Text(l.settings),
          onTap: _busy
              ? null
              : () => Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (_) => const KeyboardInsetHold(child: ToolsView()),
                  ),
                ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: _busy ? null : _logout,
          child: Text(l.fdLogout),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    final signedIn = _api != null;
    final release = ref.watch(fastaiReleaseProvider);
    ref.listen(fastaiReleaseProvider, (previous, next) {
      if (next?.required == true) {
        ref.read(v2BoardAccessProvider.notifier).setAvailable(false);
        unawaited(ref.read(setupActionProvider.notifier).setRunning(false));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlyphIcon(AppGlyphs.fastDog),
            SizedBox(width: 10),
            Text(V2BoardConfig.appName),
          ],
        ),
        actions: [
          if (signedIn)
            IconButton(
              tooltip: l.fdRefresh,
              onPressed: _busy ? null : () => _run(_refresh),
              icon: const GlyphIcon(AppGlyphs.refresh),
            ),
        ],
      ),
      body: Column(
        children: [
          if (_busy) const LinearProgressIndicator(),
          if (release != null &&
              (release.required ||
                  release.availableFor(
                    globalState.packageInfo.version,
                    int.tryParse(globalState.packageInfo.buildNumber) ?? 0,
                  )))
            ListTile(
              title: Text(
                release.required ? l.fdUpdateRequired : l.discoverNewVersion,
              ),
              subtitle: Text(release.latestVersion),
              trailing: TextButton(
                onPressed: () => checkFastaiUpdate(context, ref),
                child: Text(l.goDownload),
              ),
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  color: context.colorScheme.errorContainer,
                  shape: AppShape.md,
                ),
                child: Text(
                  _error!,
                  style: TextStyle(color: context.colorScheme.onErrorContainer),
                ),
              ),
            ),
          Expanded(
            child: !signedIn
                ? _loginView()
                : switch (_tab) {
                    0 => _overview(),
                    1 =>
                      _account?.active == true
                          ? const ProxiesView()
                          : Center(child: Text(l.fdNodesUnavailable)),
                    _ => _myAccount(),
                  },
          ),
        ],
      ),
      bottomNavigationBar: signedIn
          ? NavigationBar(
              selectedIndex: _tab,
              onDestinationSelected: _busy
                  ? null
                  : (index) => setState(() => _tab = index),
              destinations: [
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.dashboard),
                  label: l.fdConnection,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.proxies),
                  label: l.proxies,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.account),
                  label: l.account,
                ),
              ],
            )
          : null,
    );
  }
}

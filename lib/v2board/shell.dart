import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:fastai/views/views.dart';
import 'package:fastai/views/config/connection_settings.dart';
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
import 'theme.dart';

class V2BoardShell extends StatelessWidget {
  const V2BoardShell({
    super.key,
    this.session = const V2BoardSession(),
    this.desktopLayout,
  });

  final V2BoardSession session;
  final bool? desktopLayout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        brightness: Brightness.light,
        colorScheme: fastaiColorScheme(),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: const Color(0xFF153B70),
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      child: _V2BoardContent(
        session: session,
        desktopLayout:
            desktopLayout ??
            (defaultTargetPlatform == TargetPlatform.windows ||
                defaultTargetPlatform == TargetPlatform.macOS),
      ),
    );
  }
}

class _V2BoardContent extends ConsumerStatefulWidget {
  const _V2BoardContent({required this.session, required this.desktopLayout});

  final V2BoardSession session;
  final bool desktopLayout;

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
  bool _showLogin = false;
  bool _sidebarExpanded = true;
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
          if (mounted &&
              ref.read(appSettingProvider).autoRun &&
              _account?.active == true &&
              ref.read(fastaiReleaseProvider)?.required != true) {
            await _profile.connect(_api!);
          }
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
    if (!force && !ref.read(appSettingProvider).autoCheckUpdate) return;
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
        if (mounted) setState(() => _showLogin = false);
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
    _showLogin = false;
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
    if (_api == null) {
      _requestLogin();
      return;
    }
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
          colors: [colors.primaryContainer, colors.surface],
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
        ],
      ),
    );
  }

  String _bytes(int value) => '${(value / 1073741824).toStringAsFixed(2)} GB';

  Widget _overview() {
    if (widget.desktopLayout) return _desktopHome();
    final l = context.appLocalizations;
    final account = _account;
    final status = switch (account?.status) {
      null => l.fdWelcome,
      'active' => l.fdActive,
      'banned' => l.fdBanned,
      'noPlan' => l.fdNoPlan,
      'exhausted' => l.fdExhausted,
      _ => l.fdExpired,
    };
    final canConnect =
        account?.active == true &&
        ref.watch(fastaiReleaseProvider)?.required != true;
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
                  onPressed: _busy ? null : () => setState(() => _tab = 1),
                  icon: const GlyphIcon(AppGlyphs.proxies),
                  label: Text(l.fdChooseRoute),
                ),
                const SizedBox(height: 12),
                Center(
                  child: SizedBox(
                    width: 168,
                    height: 168,
                    child: FilledButton(
                      style: FilledButton.styleFrom(shape: AppShape.circle),
                      onPressed: _busy
                          ? null
                          : _api == null
                          ? _requestLogin
                          : running
                          ? () => _run(() async {
                              await ref
                                  .read(setupActionProvider.notifier)
                                  .setRunning(false);
                            })
                          : canConnect
                          ? () => _sync(connect: true)
                          : null,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const GlyphIcon(AppGlyphs.bolt, size: 48, fill: 1),
                          const SizedBox(height: 12),
                          Text(running ? l.fdDisconnect : l.fdConnect),
                        ],
                      ),
                    ),
                  ),
                ),
                const ConnectionSettings(isDesktop: false),
                TextButton(
                  onPressed: _busy || (_api != null && !canConnect)
                      ? null
                      : () => _sync(),
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
                    Expanded(
                      child: Text(
                        l.outboundMode,
                        style: context.textTheme.titleSmall,
                      ),
                    ),
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
                          if (_api == null) {
                            _requestLogin();
                            return;
                          }
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
        if (account != null)
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
        if (account != null && !account.active)
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
              if (_account != null)
                _metric(l.fdRemaining, _bytes(_account!.remainingBytes)),
              if (_account != null)
                _metric(
                  l.fdExpiry,
                  _account!.expiresAt?.toLocal().toString().split(' ').first ??
                      l.fdNoExpiry,
                ),
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
        TextButton.icon(
          onPressed: _busy ? null : () => _run(_refresh),
          icon: const GlyphIcon(AppGlyphs.refresh),
          label: Text(l.fdRefresh),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: _busy ? null : _logout,
          child: Text(l.fdLogout),
        ),
      ],
    );
  }

  void _requestLogin() => setState(() => _showLogin = true);

  Widget _desktopHome() {
    final l = context.appLocalizations;
    final running = ref.watch(isStartProvider);
    final mode = ref.watch(patchClashConfigProvider.select((s) => s.mode));
    final allowed =
        _api == null ||
        (_account?.active == true &&
            ref.watch(fastaiReleaseProvider)?.required != true);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32),
          children: [
            Center(
              child: SizedBox(
                width: 144,
                height: 144,
                child: GlyphIcon(
                  AppGlyphs.cloudConnection(running),
                  size: 132,
                  color: running
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              running ? l.fdConnected : l.fdDisconnected,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l.fdHeroSubtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 28),
            Center(
              child: FilledButton(
                onPressed: _busy || (!running && !allowed)
                    ? null
                    : () {
                        if (_api == null) {
                          _requestLogin();
                        } else if (running) {
                          unawaited(
                            _run(() async {
                              await ref
                                  .read(setupActionProvider.notifier)
                                  .setRunning(false);
                            }),
                          );
                        } else {
                          unawaited(_sync(connect: true));
                        }
                      },
                style: FilledButton.styleFrom(minimumSize: const Size(160, 52)),
                child: Text(running ? l.fdDisconnect : l.fdConnect),
              ),
            ),
            const SizedBox(height: 28),
            const ConnectionSettings(isDesktop: true),
            const SizedBox(height: 16),
            DropdownButtonFormField<Mode>(
              key: ValueKey(mode),
              initialValue: mode,
              decoration: InputDecoration(labelText: l.outboundMode),
              items: [
                for (final value in Mode.values)
                  DropdownMenuItem(value: value, child: Text(value.label)),
              ],
              onChanged: _busy
                  ? null
                  : (value) {
                      if (_api == null) {
                        _requestLogin();
                        return;
                      }
                      if (value != null) {
                        ref
                            .read(setupActionProvider.notifier)
                            .changeMode(value);
                      }
                    },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _busy ? null : () => _selectPage(1),
              child: Text(l.fdChooseRoute),
            ),
            if (_api != null)
              TextButton(
                onPressed: _busy || !allowed ? null : () => _sync(),
                child: Text(l.fdSync),
              ),
          ],
        ),
      ),
    );
  }

  void _selectPage(int index) => setState(() {
    _tab = index;
    _showLogin = false;
    _error = null;
  });

  Widget _page() {
    if (_showLogin) return _loginView();
    return switch (_tab) {
      0 => _overview(),
      1 =>
        _api == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const GlyphIcon(AppGlyphs.proxies, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      context.appLocalizations.fdChooseRoute,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _busy ? null : _requestLogin,
                      child: Text(context.appLocalizations.fdLogin),
                    ),
                  ],
                ),
              )
            : _account?.active == true
            ? const ProxiesView()
            : Center(child: Text(context.appLocalizations.fdNodesUnavailable)),
      2 => const ToolsView(),
      3 => _api == null ? _loginView() : _myAccount(),
      _ => const AboutView(),
    };
  }

  Widget _desktopBody() {
    final l = context.appLocalizations;
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          NavigationRail(
            extended: _sidebarExpanded && constraints.maxWidth >= 520,
            minExtendedWidth: 180,
            backgroundColor: const Color(0xFFF7F8FA),
            leading: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    V2BoardConfig.appName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  tooltip: _sidebarExpanded ? l.shrink : l.expand,
                  onPressed: () =>
                      setState(() => _sidebarExpanded = !_sidebarExpanded),
                  icon: GlyphIcon(AppGlyphs.sidebar(_sidebarExpanded ? 1 : 0)),
                  key: const ValueKey('sidebar-toggle'),
                ),
              ],
            ),
            selectedIndex: _tab,
            onDestinationSelected: _busy ? null : _selectPage,
            destinations: [
              NavigationRailDestination(
                icon: const GlyphIcon(AppGlyphs.language),
                label: Text(l.fdHome),
              ),
              NavigationRailDestination(
                icon: const GlyphIcon(AppGlyphs.proxies),
                label: Text(l.fdConnection),
              ),
              NavigationRailDestination(
                icon: const GlyphIcon(AppGlyphs.settings),
                label: Text(l.settings),
              ),
              NavigationRailDestination(
                icon: const GlyphIcon(AppGlyphs.account),
                label: Text(l.account),
              ),
              NavigationRailDestination(
                icon: const GlyphIcon(AppGlyphs.info),
                label: Text(l.about),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child: _page(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    final release = ref.watch(fastaiReleaseProvider);
    ref.listen(fastaiReleaseProvider, (previous, next) {
      if (next?.required == true) {
        ref.read(v2BoardAccessProvider.notifier).setAvailable(false);
        unawaited(ref.read(setupActionProvider.notifier).setRunning(false));
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    style: TextStyle(
                      color: context.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
            Expanded(child: widget.desktopLayout ? _desktopBody() : _page()),
          ],
        ),
      ),
      bottomNavigationBar: !widget.desktopLayout
          ? NavigationBar(
              selectedIndex: _tab,
              onDestinationSelected: _busy ? null : _selectPage,
              destinations: [
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.language),
                  label: l.fdHome,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.proxies),
                  label: l.fdConnection,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.settings),
                  label: l.settings,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.account),
                  label: l.account,
                ),
                NavigationDestination(
                  icon: const GlyphIcon(AppGlyphs.info),
                  label: l.about,
                ),
              ],
            )
          : null,
    );
  }
}

import 'package:flutter_svg/flutter_svg.dart';
import 'node_metadata.dart';
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
import 'usage_reset.dart';
import 'package:intl/intl.dart';
import 'diagnostics.dart';
import 'problem_message.dart';
import 'api.dart';
import 'access.dart';
import 'config.dart';
import 'profile.dart';
import 'session.dart';
import 'update.dart';
import 'theme.dart';
import 'routes.dart';

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
      data: fastaiTheme(theme),
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
  UsageResetSummary? _resets;
  UsageResetOperation _resetOperation = UsageResetOperation();
  bool _resetSummaryStale = false;
  bool _busy = true;
  String? _error;
  String? _errorCode;
  String? _activity;
  bool _connectAfterLogin = false;
  bool _retryConnect = false;
  int _tab = 0;
  bool _showLogin = false;
  bool _sidebarExpanded = true;
  Future<void>? _forgetting;
  Timer? _accountTimer;
  Future<void>? _refreshing;
  V2BoardApi? _refreshClient;
  bool _accountStale = false;

  late final V2BoardProfile _profile = V2BoardProfile(ref);

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
    ref.listenManual(appVisibleProvider, (previous, visible) {
      if (visible && previous == false && _api != null && !_busy) {
        unawaited(_refreshInBackground());
        unawaited(_checkRelease());
      }
    });
    _accountTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted && _api != null && !_busy && ref.read(appVisibleProvider)) {
        unawaited(_refreshInBackground());
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

  Future<void> _run(Future<void> Function() action, {String? activity}) async {
    if (mounted) {
      setState(() {
        _busy = true;
        _error = null;
        _errorCode = null;
        _activity = activity;
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
      if (error.code == 'CLIENT_DISABLED' ||
          error.code == 'SUBSCRIPTION_UNAVAILABLE') {
        ref.read(v2BoardAccessProvider.notifier).setAvailable(false);
        await ref.read(setupActionProvider.notifier).setRunning(false);
        if (!mounted) return;
      }
      final diagnostic = ClientRequestDiagnostic(
        method: '',
        path: '',
        code: error.code,
        requestId: error.requestId,
        status: error.status,
        duration: Duration.zero,
      );
      setState(() {
        _errorCode = error.code;
        _error = [
          clientProblemMessage(error, l, hadSession: hadSession),
          if (diagnostic.requestId.isNotEmpty)
            '${l.fdReferenceId}: ${diagnostic.requestId}',
        ].join('\n');
      });
    } on FormatException {
      if (mounted) {
        setState(() => _error = context.appLocalizations.fdInvalidUrl);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = context.appLocalizations.fdRequestFailed);
      }
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _activity = null;
        });
      }
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

  Future<void> _refresh() {
    if (_refreshing != null && identical(_refreshClient, _api)) {
      return _refreshing!;
    }
    _refreshClient = _api;
    late final Future<void> task;
    task = _refreshAccount().whenComplete(() {
      if (identical(_refreshing, task)) {
        _refreshing = null;
        _refreshClient = null;
      }
    });
    return _refreshing = task;
  }

  Future<void> _refreshInBackground() async {
    final client = _api;
    try {
      await _refresh();
      if (mounted) setState(() {});
    } catch (_) {
      if (mounted && client != null && _api == client) {
        setState(() => _accountStale = true);
      }
    }
  }

  Future<void> _refreshAccount() async {
    final api = _api!;
    api.language = Localizations.localeOf(context).toLanguageTag();
    final data = await Future.wait([
      api.object('GET', '/me'),
      api.object('GET', '/me/subscription'),
    ]);
    if (!mounted || _api != api) return;
    await _refreshResets(api);
    if (!mounted || _api != api) return;
    _accountStale = false;
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

  Future<void> _refreshResets(V2BoardApi api) async {
    try {
      final data = await api.object('GET', '/me/usage-resets');
      if (!mounted || _api != api) return;
      _resets = UsageResetSummary(data);
      _resetSummaryStale = false;
    } on V2BoardProblem catch (error) {
      if (error.sessionRejected) rethrow;
      if (mounted && _api == api) _resetSummaryStale = true;
    }
  }

  Future<void> _consumeReset() async {
    if (_busy ||
        _api == null ||
        (!_resetOperation.hasPendingRequest &&
            (_resetSummaryStale || _resets?.canReset != true))) {
      return;
    }
    final api = _api!;
    final l = context.appLocalizations;
    if (!_resetOperation.hasPendingRequest) {
      final accepted = await dialogs.showMessage(
        title: l.fdResetTraffic,
        message: TextSpan(text: l.fdResetConfirm),
        confirmText: l.fdUseReset,
      );
      if (accepted != true || !mounted || _busy || _api != api) return;
    }
    await _run(() async {
      if (_refreshing != null) await _refresh();
      if (!mounted || _api != api) return;
      try {
        await _resetOperation.consume(api);
      } on V2BoardProblem {
        await _refreshResets(api);
        rethrow;
      }
      if (!mounted || _api != api) return;
      await _refresh();
      if (mounted) context.showNotifier(l.fdResetSuccess);
    });
  }

  String _resetDisabledReason() => switch (_resets?.disabledReason) {
    'reset_inactive' => context.appLocalizations.fdResetInactive,
    'reset_empty' => context.appLocalizations.fdResetEmpty,
    'reset_no_credit' => context.appLocalizations.fdResetNoCredit,
    _ => context.appLocalizations.fdResetHelp,
  };

  Widget _trafficCard(V2BoardAccount account) {
    final l = context.appLocalizations;
    final reset = account.resetAt;
    final colors = context.colorScheme;
    return Card(
      elevation: 0,
      color: colors.surfaceContainerLowest,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.fdRemaining, style: context.textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(
              _bytes(account.remainingBytes),
              style: context.textTheme.headlineSmall,
            ),
            if (account.periodActive && account.totalBytes > 0) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: (account.remainingBytes / account.totalBytes).clamp(
                  0,
                  1,
                ),
                semanticsLabel: l.fdRemaining,
              ),
              const SizedBox(height: 8),
              Text(
                '${l.fdPeriodUsed} ${_bytes(account.usedBytes)} / ${_bytes(account.totalBytes)}',
                style: context.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
            if (account.periodActive && reset != null) ...[
              const SizedBox(height: 8),
              Text(
                '${l.fdNextReset} · ${DateFormat.yMd(Localizations.localeOf(context).toString()).format(reset.toLocal())}',
                style: context.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1),
            ),
            Tooltip(
              message: l.fdCreditHelp,
              child: Text(
                l.fdCreditBalance,
                style: context.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _bytes(account.creditBytes),
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _resetCard(),
          ],
        ),
      ),
    );
  }

  Widget _resetCard() {
    final l = context.appLocalizations;
    final pending = _resetOperation.hasPendingRequest;
    final enabled =
        pending || (!_resetSummaryStale && _resets?.canReset == true);
    final count = _resetSummaryStale || _resets == null
        ? '—'
        : '${_resets!.available}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '${l.fdResetCredits} · $count',
              style: context.textTheme.bodySmall,
            ),
            OutlinedButton(
              onPressed: _busy || _api == null || !enabled
                  ? null
                  : _consumeReset,
              child: Text(pending ? l.fdRetryReset : l.fdUseReset),
            ),
          ],
        ),
        if (_resetSummaryStale || (!enabled && _resets?.disabledReason != null))
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _resetSummaryStale
                  ? l.fdResetUnavailable
                  : _resetDisabledReason(),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _login() async {
    if (!_form.currentState!.validate()) return;
    await _run(() async {
      final api = V2BoardApi(_origin.text)
        ..version = globalState.packageInfo.version;
      api.language = Localizations.localeOf(context).toLanguageTag();
      try {
        _observeRequests(api);
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
        if (!mounted) return;
        if (mounted) setState(() => _showLogin = false);
        if (_connectAfterLogin &&
            _account?.active == true &&
            ref.read(fastaiReleaseProvider)?.required != true) {
          _connectAfterLogin = false;
          _retryConnect = true;
          _setActivity(context.appLocalizations.fdSyncingRoutes);
          await _profile.connect(api, onConnecting: _connecting);
        } else {
          _connectAfterLogin = false;
          await _syncAvailable();
        }
      } catch (_) {
        if (_api != api) api.close();
        rethrow;
      }
    });
  }

  void _observeRequests(V2BoardApi api) {
    api.onDiagnostic = (event) {
      if (!mounted) return;
      ref.read(clientDiagnosticsProvider.notifier).record(event);
      commonPrint.log(
        'Client request: ${event.summary} · ${event.code}'
        '${event.requestId.isEmpty ? '' : ' · ${event.requestId}'}',
        logLevel: event.code == 'ok' ? LogLevel.info : LogLevel.warning,
      );
    };
  }

  void _bindSession(V2BoardApi api) {
    _observeRequests(api);
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
    _resets = null;
    _resetSummaryStale = false;
    _resetOperation = UsageResetOperation();
    _accountStale = false;
    ref.read(clientDiagnosticsProvider.notifier).clear();
    _tab = 0;
    _showLogin = false;
    _connectAfterLogin = false;
    _retryConnect = false;
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
    _retryConnect = connect;
    if (_api == null) {
      _requestLogin(connect: connect);
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
        await _profile.connect(_api!, onConnecting: _connecting);
      } else {
        await _profile.sync(_api!);
      }
    }, activity: context.appLocalizations.fdSyncingRoutes);
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
        autofillHints: origin
            ? null
            : [password ? AutofillHints.password : AutofillHints.username],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: context.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  String _bytes(int value) => '${(value / 1073741824).toStringAsFixed(2)} GB';

  Widget _overview() => _desktopHome();

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
              if (_account != null &&
                  (_account!.periodActive || _account!.expiresAt != null))
                _metric(
                  l.fdExpiry,
                  _account!.expiresAt?.toLocal().toString().split(' ').first ??
                      l.fdNoExpiry,
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (_account != null) _trafficCard(_account!),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const GlyphIcon(AppGlyphs.openExternal),
            title: Text(l.fdWebAccount),
            subtitle: Text(l.fdWebAccountHint),
            trailing: const GlyphIcon(AppGlyphs.openExternal),
            onTap: _busy ? null : () => _run(_portal),
          ),
        ),
        if (_accountStale)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(l.fdAccountStale),
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

  void _setActivity(String value) {
    if (mounted) setState(() => _activity = value);
  }

  void _connecting() => _setActivity(context.appLocalizations.connecting);

  Future<void> _disconnect() async {
    _retryConnect = false;
    await _run(() async {
      await ref.read(setupActionProvider.notifier).setRunning(false);
    }, activity: context.appLocalizations.fdDisconnecting);
  }

  void _requestLogin({bool connect = false}) => setState(() {
    _connectAfterLogin = connect;
    _retryConnect = connect;
    _showLogin = true;
  });

  Widget _desktopHome() {
    final l = context.appLocalizations;
    final running = ref.watch(isStartProvider);
    final mode = ref.watch(patchClashConfigProvider.select((s) => s.mode));
    final groupName = mode == Mode.global
        ? GroupName.GLOBAL.name
        : ref.watch(currentProfileProvider.select((s) => s?.currentGroupName));
    final selected = groupName == null
        ? null
        : ref.watch(selectedProxyNameProvider(groupName));
    final route = selected == null
        ? null
        : ref.watch(realSelectedProxyStateProvider(selected)).proxyName;
    final delay = route == null || route.isEmpty
        ? null
        : ref.watch(delayProvider(proxyName: route));
    final allowed =
        _api == null ||
        (_account?.active == true &&
            ref.watch(fastaiReleaseProvider)?.required != true);
    final metadata = ref.watch(fastaiNodeMetadataProvider).asData?.value[route];
    Widget panel(Widget child) => Material(
      color: Colors.white,
      shape: AppShape.lg.copyWith(
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          children: [
            Text(
              _activity ?? (running ? l.fdConnected : l.fdDisconnected),
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              switch (_account?.status) {
                'noPlan' => l.fdNoPlan,
                'expired' => l.fdExpired,
                'exhausted' => l.fdExhausted,
                'banned' => l.fdBanned,
                _ => l.fdHeroSubtitle,
              },
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),
            SvgPicture.asset(
              'assets/images/fastai-network.svg',
              height: 180,
              excludeFromSemantics: true,
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 240,
                child: FilledButton(
                  key: const ValueKey('home-connect'),
                  onPressed: _busy || (!running && !allowed)
                      ? null
                      : () {
                          if (_api == null) {
                            _requestLogin(connect: true);
                          } else if (running) {
                            unawaited(_disconnect());
                          } else {
                            unawaited(_sync(connect: true));
                          }
                        },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: AppShape.full,
                  ),
                  child: Text(running ? l.fdDisconnect : l.fdConnect),
                ),
              ),
            ),
            const SizedBox(height: 32),
            panel(
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: NodeRegionFlag(
                  regionCode: metadata?['regionCode'] as String?,
                  fallback: const GlyphIcon(AppGlyphs.proxies),
                ),
                title: Text(
                  _api == null || route == null || route.isEmpty
                      ? l.fdChooseRoute
                      : nodeDisplayName(
                          metadata,
                          route,
                          Localizations.localeOf(context),
                        ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  delay == null
                      ? l.fdCurrentRoute
                      : delay > 0
                      ? '$delay ms'
                      : l.timeout,
                ),
                trailing: const GlyphIcon(AppGlyphs.chevronForward),
                onTap: _busy ? null : () => _selectPage(1),
              ),
            ),
            const SizedBox(height: 12),
            panel(
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(l.connection, style: context.textTheme.labelLarge),
                    const SizedBox(height: 8),
                    ConnectionSettings(
                      isDesktop: widget.desktopLayout,
                      segmented: true,
                      enabled: !_busy,
                    ),
                    const SizedBox(height: 16),
                    Text(l.mode, style: context.textTheme.labelLarge),
                    const SizedBox(height: 8),
                    SegmentedButton<Mode>(
                      showSelectedIcon: false,
                      segments: [
                        for (final value in [Mode.rule, Mode.global])
                          ButtonSegment(
                            value: value,
                            label: Text(
                              value == Mode.rule
                                  ? l.fdSmartMode
                                  : l.fdGlobalMode,
                            ),
                          ),
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
          ],
        ),
      ),
    );
  }

  void _selectPage(int index) => setState(() {
    _tab = index;
    _showLogin = false;
    _connectAfterLogin = false;
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
            ? FastaiRoutesView(onSync: () => _sync())
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
            minExtendedWidth: 200,
            minWidth: 80,
            groupAlignment: -1,
            backgroundColor: context.colorScheme.surfaceContainerLow,
            leading: SizedBox(
              width: _sidebarExpanded && constraints.maxWidth >= 520 ? 200 : 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: _sidebarExpanded && constraints.maxWidth >= 520
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/fastai-mark.svg',
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              V2BoardConfig.appName,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            tooltip: l.shrink,
                            key: const ValueKey('sidebar-toggle'),
                            onPressed: () =>
                                setState(() => _sidebarExpanded = false),
                            icon: GlyphIcon(AppGlyphs.sidebar(1)),
                          ),
                        ],
                      )
                    : IconButton(
                        tooltip: l.expand,
                        key: const ValueKey('sidebar-toggle'),
                        onPressed: () =>
                            setState(() => _sidebarExpanded = true),
                        icon: SvgPicture.asset(
                          'assets/images/fastai-mark.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),
              ),
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
                constraints: BoxConstraints(maxWidth: _tab == 1 ? 880 : 680),
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
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        _error!,
                        style: TextStyle(
                          color: context.colorScheme.onErrorContainer,
                        ),
                      ),
                      if (const {
                        'invalid_config',
                        'invalid_response',
                        'CLIENT_DISABLED',
                        'SUBSCRIPTION_UNAVAILABLE',
                        'certificate_error',
                      }.contains(_errorCode))
                        TextButton(
                          onPressed: _busy ? null : () => _run(_portal),
                          child: Text(l.fdWebAccount),
                        ),
                      TextButton(
                        onPressed: _busy
                            ? null
                            : () {
                                if (_api == null) {
                                  _requestLogin(connect: _retryConnect);
                                } else {
                                  unawaited(_sync(connect: _retryConnect));
                                }
                              },
                        child: Text(l.retry),
                      ),
                      if (_api != null && _errorCode == 'connection_failed')
                        TextButton(
                          onPressed: _busy ? null : () => _selectPage(1),
                          child: Text(l.fdChooseRoute),
                        ),
                    ],
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

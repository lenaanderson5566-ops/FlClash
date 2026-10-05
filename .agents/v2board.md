# fastai client

## Product and ownership

The client lives in `v3/FlClash`, alongside the customized backend in `v3/v2board`.
The old Desktop client is reference material; do not reuse its legacy transports.
The brand is `fastai`, and the default panel and website are `https://fastdog.ws`.
Its FastDog visual identity uses a native dog glyph, warm orange accent and tonal
surfaces that follow the existing light/dark preference. Do not add simulated AI
chat, connection checks or activity feeds: only render actual provider state.
Keep Core, Helper, channel and package identifiers stable. Windows executable and
window title are fastai; this also gives Windows a distinct app data directory.

## User flow

Login accepts email and password. The panel origin is fixed by build configuration.
The three tabs are Connection, Nodes and Account. Connection shows availability,
period allowance, independent credit balance, expiry and device counts. It exposes
connect/disconnect, subscription refresh and rule/global/direct mode selection.
Nodes use the existing proxy groups, selection and latency testing. Account exposes
website account services, support, settings and logout. Purchases, renewals and
orders belong on the website; there is no native payment or commerce screen.

Restore the encrypted session and refresh server state before enabling connection.
Account availability is checked on refresh and before connecting. Refresh visible
sessions every minute. Logout or unavailable entitlement requests disconnection.
Delegate lifecycle work to setupActionProvider and the existing Core/service owner.
Do not create another VPN or process lifecycle owner.

The managed profile label is `fastai · managed`. The start action requires both
server-approved access and the managed profile. Synchronization checks entitlement,
downloads and validates configuration, and selects the managed profile. Generic
profile refresh is disabled for this snapshot. Do not persist its subscription URL
in the profile database. Logout clears the managed profile and secure credentials,
and revokes the remote session when reachable. Credentials must never be logged.

## Import and activation policy

Consumer builds skip the inherited first-launch disclaimer and hide its settings entry.
Consumer builds disable manual file, URL and QR profile import, backup restoration,
and generic profile refresh at their action boundaries as well as in navigation.
They do not subscribe to AppLinks and do not register URL protocols. Android has no
VIEW/BROWSABLE import filter, macOS has no CFBundleURLTypes, and Linux packages
advertise no scheme handlers. Windows and Linux reject URL-shaped startup arguments
before forwarding them to an existing application. These checks also prevent stale
OS registrations from activating the new executable with import URLs.

V2BOARD_ENABLED=false is a developer compatibility build restoring upstream flows;
it is not a user-facing setting. Defaults and consumer builds keep it enabled.

## Backend contracts

Use `../v2board/docs/api-v10/openapi.json`, contracts and backend actions as truth.
Business calls use `/api/v10`, Bearer authentication and Accept-Language. Successful
JSON uses data; logout may return 204. Preserve problem details internally. Never
log passwords, tokens, full subscription URLs or configuration bodies. Do not retry
mutating requests automatically. Verify TLS certificates and reject redirects.

Connection availability comes from accountStatus.available, not the presence of a
subscription URL. Subscription active indicates period entitlement, while traffic
credits are independent. creditBytes is already a remaining balance. Remaining
period traffic is max(0, quotaBytes - upload - download). The server authorizes the
actual configuration via GET /api/v10/me/client-config using the existing Bearer
session, clientVersion, platform and Accept-Language. Receive native application/yaml,
validate it in Core, then save the managed snapshot. Never use subscriptionUrl as
a download fallback. User-Agent identifies fastai truthfully; version policy uses
the validated query version. Entitlement denials preserve the login session.
Deploy the backend endpoint before distributing this client.

## Build and verification

Use `fastai.env.example.json` and Flutter 3.47.4 / Dart 3.13.3 at
`../tools/flutter-3.47.4/flutter`. Native hooks remain enabled. Launch development
builds only with --dart-define=SAFE_MODE=true as required by repository instructions.

Verified on Windows:
- Dependency resolution, official localization and provider generation succeed.
- Whole-project flutter analyze reports no issues.
- 32 focused API, account, client-policy, widget and localization tests pass.
- 552 upstream widget/action/link regressions pass with V2BOARD_ENABLED=false.
- Windows safe-mode Debug build produces build/windows/x64/runner/Debug/fastai.exe.
- Actual executable exits successfully for clash, clashmeta, flclash and fastai URI
  startup arguments without opening the import path.
- Live V10 login, account and subscription resources classify the provided paid
  account as available and the corrected unpaid account as unavailable. Test
  sessions were revoked; no credentials or tokens are stored in repository files.

Brand previews are ../fastdog-style-login.png, ../fastdog-style-connection.png,
../fastdog-style-account.png and ../fastdog-style-login-dark.png. Actual paid login
and account refresh were verified before this API change. The production endpoint
must be deployed before live configuration download can be verified. Proxy traffic
is not verified in safe mode. Android SDK is absent;
Android, macOS and Linux native builds and release signing remain unverified.
Five pre-existing lint tests have Windows path separator allowlist failures; do
not confuse these with the focused client tests or clean static analysis.

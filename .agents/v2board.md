# fastai client

## Product and ownership

The client lives in `v3/FlClash`, alongside the customized backend in `v3/v2board`.
The old Desktop client is reference material; do not reuse its legacy transports.
The brand is `FastAI`, and the default panel and website are `https://fastdog.ws`.
Use the blue-and-white client theme and the website's shared mark. The desktop
sidebar contains Home, Connection, Settings and About, with Account pinned at
the bottom using the same email-initial avatar as the website. Do not add
simulated AI chat, connection checks or activity feeds: render real state.
Keep Core, Helper, channel and package identifiers stable. Windows executable and
window title are fastai; this also gives Windows a distinct app data directory.

## User flow

Login accepts email and password. The panel origin is fixed by build configuration.
Home focuses on connecting and the selected route. Connection lists available
routes. Account shows period traffic, independent traffic and reset entitlements.
Settings contains client preferences and network troubleshooting. About owns
version information, update preferences and the public website link. Purchases, renewals and
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

The inherited disclaimer and developer test screens have been removed.
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

Run `flutter analyze`, `flutter test test/v2board test/l10n` and the relevant
regression suites after changes. Legacy configuration/link tests require
`--dart-define=V2BOARD_ENABLED=false`. Localization catalogs must cover all eight
backend languages and preserve message placeholders; use intl_utils to regenerate.

Safe-mode builds do not verify live proxy traffic. Do not remove a build directory
while an executable inside it is running. Android, macOS and Linux native builds
and release signing require separate platform validation.

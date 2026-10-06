# FastAI identity, updates and website sign-in

FastAI uses Dart package `fastai`, application identity `ws.fastdog.fastai`, and
version `1.0.0+1`. Increment the build number for every published package; increment
the semantic version for a new release. The build counter is shared by Android,
Windows and macOS, whose native version fields have different limits.

The launcher, tray, notification channel, native Core/Helper names, installer ID,
local IPC paths/port and product links belong to FastAI. The source repository
remains `lenaanderson5566-ops/FlClash`. Upstream licenses, copyright notices, core
repository references and pinned dependency tags retain their original identities.
The `flclash` subscription format and historical changelog markers are protocol
compatibility identifiers, not the application's name or UA.

The former lowercase `fastai · managed` profile is renamed on the next successful
configuration sync. A different application identifier isolates the new app from
upstream FlClash; Android treats it as a separate installation. This is not an
in-place upgrade of an upstream signed APK. All future FastAI APKs must use the
same release signing key. Configure an owned macOS signing identity before release.
Android Firebase is disabled by default. An intentional opt-in requires
`-PfastaiFirebase=true` and a new `google-services.json` for this application ID.

## Release contract

`GET /api/v10/public/fastai/releases/latest?platform=windows&architecture=x64`
is public and returns the normal V10 `data` envelope. Platforms: `windows`,
`android`, `macos`, `linux`. Architectures: `x64`, `arm64`, `arm`, `x86`.

The backend's System configuration / Client downloads section exposes:

- `fastai_enabled`: independent FastAI configuration access switch.
- `fastai_releases`: an array containing one stable release per platform/architecture.

Each entry requires `platform`, `architecture`, `channel: "stable"`,
`latestVersion`, integer `latestBuild`, `minimumVersion`, HTTPS `downloadUrl`,
lowercase 64-character `sha256`, and UTC `publishedAt` (`2026-10-06T00:00:00Z`).
`releaseNotes` is optional. Versions are stable three-component semantic versions.
Minimum version must not exceed latest version. Duplicate targets are rejected.
An empty array means no release has been published; unmatched targets return
`404 RELEASE_UNAVAILABLE`. Do not publish fake URLs or placeholder digests.

The app checks on startup and, while visible, at most once per six hours. About /
Check for updates always requests fresh metadata. It compares semantic versions
first and build numbers only for the same semantic version. Optional updates show
a banner. Mandatory updates disable connection while leaving login, logout,
website management and downloading available. The authenticated configuration
endpoint independently rejects unsupported versions with `CLIENT_VERSION_TOO_LOW`.
Metadata/network failures do not revoke a session or erase a known update policy.
There is no fallback to upstream FlClash's release feed or version policy.

Downloads open the OS browser over HTTPS. The SHA-256 is displayed for verification;
the app does **not** download, hash, execute or silently install packages itself.
OS installer signing and publisher verification remain essential. A future
integrated installer must verify the complete file and publisher signature before
installation, use temporary files/atomic moves, and require user confirmation.

## Website sign-in

When signed in, clicking a website/account-management link issues
`POST /api/v10/me/login-links` with `redirect: "dashboard"` and the app's Bearer
session. The server creates a cryptographically random one-time code valid for
60 seconds. The app only opens an HTTPS URL with the configured website's exact
origin, a fragment-based code, and no query credentials.

The website reads `/#/login?verify=...&redirect=dashboard` (the landing page forwards
it to `/app`), removes the code from the browser address bar, and sends it in the
JSON body of `POST /api/v10/auth/session-exchanges`. A cache lock atomically consumes
the code; the server checks the user still exists and is not banned, then issues
an independent browser session. The app's original session stays valid. The
browser loads that account and navigates to the dashboard. Expired/reused codes
fall back to the normal login form with an error. Unauthenticated app users open
the public website normally. No URL scheme or app-import handler is involved.

## Deployment order

1. Deploy backend actions, V10 generated routes/contracts and the rebuilt
   `public/console` frontend together. Refresh Laravel configuration cache and
   restart long-lived application workers according to the existing deployment.
2. Set `app_url` and the app's `V2BOARD_WEBSITE` to the same HTTPS website origin.
3. Build and sign FastAI packages, publish actual downloads, and calculate their
   SHA-256. Fill `fastai_releases` only after download links are reachable.
4. Keep `minimumVersion` at the oldest supported FastAI version until a tested
   replacement is available for the target; raise it deliberately afterwards.
5. Verify optional and mandatory updates, browser sign-in and configuration
   request result logs in staging, then roll out the matching client.

Pushing source does not deploy fastdog.ws or publish installation packages.

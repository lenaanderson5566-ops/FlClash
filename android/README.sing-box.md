# FastAI Android sing-box

Android and Windows use only the bundled sing-box 1.14.3. Android links the pinned official Cronet static library into libclash.so with with_naive_outbound. It supports Naive without a separate downloaded library. Reduced custom builds still filter unsupported Naive nodes locally and reject an unusable subscription without replacing its saved configuration.

Android keeps the existing ServiceState / VpnService ownership model. VpnService establishes the interface, routes, DNS and per-app access policy. The Go bridge retains the detached descriptor until native stop and lends each sing-box instance its own duplicate. Reloads close the old duplicate before starting its replacement. Desktop-style TUN creation is omitted from the client-generated Android configuration.

The platform adapter protects outbound sockets through VpnService.protect and fails closed if protection is refused. System DNS uses the existing Android network observer and protected system resolver. DNS updates clear sing-box caches and reset connections. Notification traffic sampling is independent of the Flutter UI sampler. Core replacement uses a separate acknowledged stop request; ordinary start/stop requests retain their optimistic behavior and ServiceState remains authoritative.

Checks: run the Flutter singbox, shell, service channel, core protocol and provider tests; Go tests; Android NDK vet/build with the production tags in build_config.yaml; and Kotlin module compilation. Device validation must additionally cover VPN permission denial, reconnects, Wi-Fi/mobile transitions, IPv6, per-app routing, rapid reconnects, always-on VPN, system revoke and background notification traffic. A successful cross-compile does not establish that these device flows passed.

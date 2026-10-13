FastAI default sing-box rule sets

geosite-cn.srs: SagerNet/sing-geosite, derived by upstream from
v2fly/domain-list-community.
geoip-cn.srs: SagerNet/sing-geoip, derived by upstream from
Dreamacro/maxmind-geoip (MaxMind GeoLite2 data).

https://github.com/SagerNet/sing-geosite
https://github.com/SagerNet/sing-geoip
https://github.com/v2fly/domain-list-community
https://www.maxmind.com/

manifest.json pins the source commit, URL and SHA256 of each bundled snapshot.
LICENSE.sing-geosite and LICENSE.sing-geoip preserve the upstream project notices.

The Go core embeds only the two .srs files. At runtime it verifies and installs
these snapshots below the application's home/sing-box/rules directory. They
provide initial_path content when the native remote rule cache is absent or
unreadable. Remote downloads use HTTPS through the selected proxy and a five-day
update interval. sing-box validates downloaded binary rules before replacing
the active rules and saves accepted content in home/sing-box/rules.db.

The default policy is applied to managed profiles without existing rule sets.
Explicit backend rule sets retain their own routing and DNS policy. Mode rules
precede regional routing. China domains, China IPs and private destinations go
direct in rule mode, with corresponding domain DNS routing. Other destinations
use the configured final outbound. No advertising rule set is enabled.

Native cache persists rule sets and selector state, not connection history;
DNS-response, FakeIP and RDRC persistence are not enabled. The original instance
closes before a replacement opens the cache, preserving lifecycle ownership.

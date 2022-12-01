# Cisco ASA Loopback

In version 9.18(2) a Loopback Interface feature was added to better support BGP and management traffic (SSH, RADIUS/TACACS, etc).

See the [ASA 9.18(x) Release Notes][asa918rn] for more detail.

Related feature announcement: Cisco Secure Firewall [ASA New Features by Release][2]

**Loopback isn't supported on some older hardware models including:**
* ASA 5512 supports only up to version 9.12.x
* ASA 5525 supports only up to version 9.14.x
* ASA 5506,5508,5516 support only up to version 9.16.x

[asa918rn]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa918/release/notes/asarn918.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/roadmap/asa_new_features.html

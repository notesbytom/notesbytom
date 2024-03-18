# Cisco ASA Loopback

In version 9.18(2) a Loopback Interface feature was added to better support BGP and management traffic (SSH, RADIUS/TACACS, etc).

See the [ASA 9.18(x) Release Notes][asa918rn] for more detail.

Related feature announcement: Cisco Secure Firewall [ASA New Features by Release][2]

**Loopback isn't supported on some older hardware models including:**
* ASA 5512 supports only up to version 9.12.x
* ASA 5525 supports only up to version 9.14.x
* ASA 5506,5508,5516 support only up to version 9.16.x

## Loopback Features in 9.20(1)

9.20(1) added some Loopback Interface Features including:
* DNS - Name Lookup Source Address
* HTTP - ASDM Management using the Loopback Address
* ICMP - Ping and Traceroute. Likely for source, destination, and hop.

## Loopback Features in 9.19(1)

9.19(1) added some Loopback Interface Features including:
* ASDM Configuration of BGP Neighborship Loopback Interface
  * This was available in the CLI in 9.18(2)
* The ASDM GUI Can Add and Manage Loopback Interfaces
* VTI Source Interface can be a Loopback.
  * Related command: `ip unnumbered ...`

## Loopback Features in 9.18(2)

9.18(2) added some Loopback Interface Features including:
* AAA - Source Interface for communication with Authentication, Authorization, and Audit servers.
* SNMP - Source and Destination Interface
* SSH - Secure Shell Management using the Loopback IP Address
* Syslog - Source Interface for Syslog Messages
* BGP - Loopback can be a BGP Neigborship Interface. CLI Only in 9.18(2)
  * [`neighbor update-source ...`][3] command
  * See 9.19(1) for ASDM GUI support

[asa918rn]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa918/release/notes/asarn918.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/roadmap/asa_new_features.html
[3]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa-cli-reference/I-R/asa-command-ref-I-R/n-commands.html

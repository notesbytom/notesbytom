# Cisco ASA Virtual Tunnel Interfaces (VTI)

Route-Based VPN is available on Cisco ASA devices with the VTI feature in recent software versions. 

## VTI IPv6 Support

In [ASA version 9.16, support for static-routed IPv6 was added to the VTI feature][asa916rn] set.

Unfortunately as of version 9.18 [IPv6 BGP is still not supported for VTI][asa918vpn-vti] on ASA.

## Dynamic VPN with BGP

In combination with eBGP routing, a dynamic VPN can be created.

Beware that asynchronous routing can be introduced by BGP due to multiple equal-length AS Paths for a destination prefix.

To avoid asynchronous routing, I recommend suppressing "backup" paths using AS-Path Prepending (with route-map on neighbor config line).

[asa916rn]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa916/release/notes/asarn916.html
[asa918vpn-vti]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa918/configuration/vpn/asa-918-vpn-config/vpn-vti.html

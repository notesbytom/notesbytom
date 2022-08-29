# Cisco ASA Virtual Tunnel Interfaces (VTI)

Route-Based VPN is available on Cisco ASA devices with the VTI feature in recent software versions. 

## VTI IPv6 Support

In [ASA version 9.16, support for static-routed IPv6 was added to the VTI feature][asa916rn] set.

Unfortunately as of version 9.18 [IPv6 BGP is still not supported for VTI][asa918vpn-vti] on ASA.

This is also listed on [the ASA New Features][asa-new-feat] documentation page.

It sounds like a single VTI can use only one of either IPv4 or IPv6 for transport (source/dest for IPsec), and only one of either IPv4 or IPv6 for tunnel-data (tunnel mode).
In order to support both IPv4 and IPv6 between two nodes, it appears that two VTI's would need to be created.
Good news is that the maximum number of VTI interfaces was increased when IPv6 tunnel mode was added.

## Dynamic VPN with BGP

In combination with eBGP routing, a dynamic VPN can be created.

Beware that asynchronous routing can be introduced by BGP due to multiple equal-length AS Paths for a destination prefix.

To avoid asynchronous routing, I recommend suppressing "backup" paths using AS-Path Prepending (with route-map on neighbor config line).

[asa916rn]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa916/release/notes/asarn916.html
[asa918vpn-vti]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa918/configuration/vpn/asa-918-vpn-config/vpn-vti.html
[asa-new-feat]: https://www.cisco.com/c/en/us/td/docs/security/asa/roadmap/asa_new_features.html
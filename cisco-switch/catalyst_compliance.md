# Catalyst Switch Compliance Notes

A place to put tech notes related to switch compliance research.

## Dynamic ARP Inspection (DAI)

This appears to be a BREAKING change with IMPORTANT DHCP Snooping prerequisites/dependencies. Read more using the linked references.

* [CISC-L2-000150 - Dynamic ARP Inspection (DAI)][1] ... on user VLANs.
* [Operate and Troubleshoot DHCP Snooping on Catalyst 9000 Switches][2] (a Dependency of DAI)
* Security Configuration Guide - Catalyst Switches [Configuring Dynamic ARP Inspection][3]

[1]: https://www.tenable.com/audits/items/DISA_STIG_Cisco_IOS_XE_Switch_L2S_v3r1.audit:7a70877c979276b792ecba468e404c78
[2]: https://www.cisco.com/c/en/us/support/docs/ip/dynamic-host-configuration-protocol-dhcp-dhcpv6/217055-operate-and-troubleshoot-dhcp-snooping.html
[3]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-9/configuration_guide/sec/b_179_sec_9300_cg/configuring_dynamic_arp_inspection.html

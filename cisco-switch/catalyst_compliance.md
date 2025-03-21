# Catalyst Switch Compliance Notes

A place to put tech notes related to switch compliance research.

## Dynamic ARP Inspection (DAI)

This appears to be a BREAKING change with IMPORTANT DHCP Snooping prerequisites/dependencies. Read more using the linked references.

* [CISC-L2-000150 - Dynamic ARP Inspection (DAI)][1] ... on user VLANs.
* **DHCP Snooping is a Dependency** for DAI. See DHCP Snooping section below.
* Security Configuration Guide - Catalyst Switches [Configuring Dynamic ARP Inspection][3]
* Interface Commands:
  * `ip arp inspection trust`
  * The DEFAULT is UNTRUSTED - intended for end-user access ports.
* Global Commands:
  * `ip arp inspection vlan VLAN_NUMBER`
  * `arp access-list ACL_NAME`
    * `permit ip host 1.2.3.4 mac host 1234.abcd.5678`
    * This is for STATIC IP-to-MAC mappings only!
  * `ip arp inspection filter ACL_NAME vlan VLAN_NUMBER`
* Show Commands:
  * `show ip arp inspection ...` (interfaces|statistics|vlan)

## DHCP Snooping

DHCP Snooping is a Dependency for Dynamic ARP Inspection (DAI).
* [Operate and Troubleshoot DHCP Snooping on Catalyst 9000 Switches][2]
* Interface Commands:
  * `ip dhcp snooping trust`
  * The DEFAULT is UNTRUSTED - intended for end-user access ports.
* Global Commands:
  * `ip dhcp snooping`
  * `ip dhcp snooping vlan VLAN_NUMBER`
* Show Commands:
  * `show ip dhcp snooping`
  * `show ip dhcp snooping ...` [binding|database|statistics]

## Type 6 Password Encryption

Passwords the switch must be able to decrypt can be stored using "Type 6" encryption 
which requires a symmetric encryption passphrase/key to be pre-configured. This helps protect the
password/secret values stored in the switch configuration from being decrypted without having the passphrase/key.

* CiscoDevNet [Type-6-Password-Encode][4] (details and code examples for the algorithm used)

[1]: https://www.tenable.com/audits/items/DISA_STIG_Cisco_IOS_XE_Switch_L2S_v3r1.audit:7a70877c979276b792ecba468e404c78
[2]: https://www.cisco.com/c/en/us/support/docs/ip/dynamic-host-configuration-protocol-dhcp-dhcpv6/217055-operate-and-troubleshoot-dhcp-snooping.html
[3]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-9/configuration_guide/sec/b_179_sec_9300_cg/configuring_dynamic_arp_inspection.html
[4]: https://github.com/CiscoDevNet/Type-6-Password-Encode/

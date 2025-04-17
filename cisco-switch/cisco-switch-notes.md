# Cisco Network Switch Notes

Tech Notes for Cisco Catalyst switches.

## Clock Time

Examples for configuring and managing time settings.

* `clock timezone EST -5`
* `clock summer-time EDT recurring`
* `show clock`
* `clock set HH:MM:SS Month DD YYYY`

## Management Console

Examples for configuring serial-console and ssh access "lines".

* `line con 0`
  * `logging synchronous`
* `line vty 0 15`
  * `logging synchronous`
  * `transport input ssh`
* `show run part line`

To see the Client IP Address for active SSH Connections, use the `show users` command. This is useful if you have a Zscaler deployment and users are randomly assigned to Zscaler on-premise connector addresses based on a combination of zscaler policy and magic of best-connector selection.

## VLAN Trunk Protocol (VTP)

* Use VTP Version 3 to support vlans 1 through 4094 (extended range).
  * VTP Versions 1 and 2 only support vlans 1-1000 (others would be local-config only).
  * `vtp domain YOUR-VTP-DOMAIN`
  * `vtp version 3`
* Exec mode command `vtp primary` or `do vtp primary` (from config mode) to add or edit vlan information (assign name to number).
  * All devices by default are secondary servers (can't add or edit layer-two vlans).
* Disable VTP with `vtp mode transparent`

## Port-Channel LACP

Examples for LACP channel-group (etherchannel)

* `int gig 1/0/47`
  * `channel-group 1 mode active`
  * `description port-channel 1 member g1/0/47`
* `int gig 1/0/48`
  * `channel-group 1 mode active`
  * `description port-channel 1 member g1/0/48`
* `int port-channel 1`
  * `switchport mode trunk`
  * `switchport nonegotiate`
  * `description Po 1 LACP to firewall NO-dtp`
* `int gig 1/0/45`
  * `channel-group 2 mode active`
  * `description port-channel 2 member g1/0/45`
* `int gig 1/0/46`
  * `channel-group 2 mode active`
  * `description port-channel 2 member g1/0/46`
* `int port-channel 2`
  * `switchport mode trunk`
  * `description Po 2 LACP to OtherSwitch DTP`
* `show etherchannel`

## Native Vlan Tagging

* Global command: `vlan dot1q tag native`
* Interface-specific command: `switchport trunk native vlan tag`
  * This interface-specific command might not work if global is off, YMMV

## StackWise Switch Group/Cluster

Some Catalyst switch families/models can be combined into one logical switch using special "Stacking" / stackwise cables.

* `show switch`
* `switch current-stack-member-number renumber new-stack-member-number`
* `switch stack-member-number priority new-priority-value`
  * The default priority is 1 (higher numbers are preferred during active switch election)
  * Number from 1 to 15

Documentation for Catalyst 9300 Series:
* Chapter: [Managing Switch Stacks][manage_stack]
 
[manage_stack]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-3/configuration_guide/stck_mgr_ha/b_173_stck_mgr_ha_9300_cg/managing_switch_stacks.html

## Version Upgrades (Stack Version-Mismatch)

An upgrade of version-mismatch (V-Mismatch) stack members might be as easy as `install autoupgrade`.

Reference: [Upgrade Guide for Cisco IOS XE Catalyst 9000 Switches][upgrade]

To see if a switch is in `INSTALL` mode, use the `show version` commmand. Each stack member will be listed along with the Mode Column (INSTALL or BUNDLE).
As long as the Active switch or supervisor is in INSTALL mode, we should be able to auto-upgrade / autoupgrade all stack members.

## Object Groups for Access-Lists

Extended Access-Lists (ACLs) can now use named object groups - this greatly helps with self-documenting configurations.
* [Chapter: Object Groups for ACLs][obj-acl]
* Feature added in Release: Cisco IOS XE Gibraltar 16.12.1

[obj-acl]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/16-12/configuration_guide/sec/b_1612_sec_9300_cg/object_group_acls.html
[upgrade]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-9300-series-switches/216231-upgrade-guide-for-cisco-catalyst-9000-sw.html

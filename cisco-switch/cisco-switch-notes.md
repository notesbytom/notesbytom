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

## VLAN Trunk Protocol (VTP)

* Use VTP Version 3 to support vlans 1 through 4094 (extended range).
  * VTP Versions 1 and 2 only support vlans 1-1000 (others would be local-config only).
  * `vtp domain YOUR-VTP-DOMAIN`
  * `vtp version 3`
* Exec mode command `vtp primary` or `do vtp primary` (from config mode) to add or edit vlan information (assign name to number).
  * All devices by default are secondary servers (can't add or edit layer-two vlans).

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

## Native Vlan Tagging

* Global command: `vlan dot1q tag native`
* Interface-specific command: `switchport trunk native vlan tag`
  * This interface-specific command might not work if global is off, YMMV


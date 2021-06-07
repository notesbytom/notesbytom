# Cisco Network Switch Notes

Tech Notes for Cisco Catalyst switches.

## VLAN Trunk Protocol (VTP)

* Use VTP Version 3 to support vlans 1 through 4094 (extended range).
  * VTP Versions 1 and 2 only support vlans 1-1000 (others would be local-config only).
* Exec mode command `vtp primary` or `do vtp primary` (from config mode) to add or edit vlan information (assign name to number).
  * All devices by default are secondary servers (can't add or edit layer-two vlans).

## Native Vlan Tagging

* Global command: `vlan dot1q tag native`
* Interface-specific command: `switchport trunk native vlan tag`
  * This interface-specific command might not work if global is off, YMMV


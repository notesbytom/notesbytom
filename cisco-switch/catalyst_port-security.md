# Catalyst Switch Port-Security

Port Security is a feature on Catalyst switches to restrict the quantity and identity of allowable MAC Addresses on a Switch Port.

## Sticky MAC Addresses

Use `switchport port-security mac-address sticky` to lock-in MAC addresses leared on the port.

These will show in the running-config. 

You can save the config with `write mem` to preserve the MAC address port association when the switch power cycles / reboots.

## Maximum Mac Addresses

You can configure a global maximum mac addresses allowed for the port and then you can specify specifically how many are allowed on the access vlan or the voice vlan.[^1]
* Example from "Configuring Maximum MAC Addresses for Voice and Data VLANs" in the Cisco documentation.

```
Switch(config)# interface fa5/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security maximum 1 vlan voice
Switch(config-if)# switchport port-security maximum 1 vlan access
Switch(config-if)# end
```

## Voice Access Ports

Voice Access ports are configured with `switchport voice vlan #` and `switchport access vlan #` to use both a phone and computer on the same port with different vlans.

*Prior to Cisco IOS Release 12.2(31)SG, you required three MAC addresses as the maximum parameter to support an IP phone and a PC.
With Cisco IOS Release 12.2(31)SG and later releases, the maximum parameter must be configured to two, one for the phone and one for the PC.* [^1]

[^1]: [Cat. 4500 Config. Guide IOS 15.2 - Configuring Port Security][1]

## 802.1x MAC Authentication Bypass

A more advanced method of requiring valid MAC Addresses on switchports is to use the 802.1x MAC Authentication Bypass (MAB) feature. This has the advantage of allowing a device to move between different switch ports or even different switches without requiring a change to the port setttings - assuming that 802.1x + MAB is already enabled for the new switchport the device is moving to.

* [MAC Authentication Bypass Deployment Guide][2]

An advantage to using 802.1x or MAB is that a Dynamic VLAN can be assigned from the RADIUS server. In the case of Microsoft IAS/NPS, the vlan members can be selected based on something like Group Membership.

* [Security Configuration Guide, Cisco IOS XE ... (Catalyst ... Switches)][3]
  * [64] Tunnel-Type = VLAN
  * [65] Tunnel-Medium-Type = 802
  * [81] Tunnel-Private-Group-ID = VLAN name or VLAN ID
* [How to use 802.1x/mac-auth and dynamic VLAN assignment][4] (Network Guys)
  * NPS/IAS Tunnel-Type = Virtual LANs (VLAN)
  * NPS/IAS Tunnel-Pvt-Group-ID == Tunnel-Private-Group-ID field

[1]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst4500/XE3-9-0E/15-25E/configuration/guide/xe-390-configuration/port_sec.html
[2]: https://www.cisco.com/c/en/us/td/docs/solutions/Enterprise/Security/TrustSec_1-99/MAB/MAB_Dep_Guide.html
[3]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9500/software/release/17-6/configuration_guide/sec/b_176_sec_9500_cg/ieee_802_1x_vlan_assignment.html
[4]: https://networkguy.de/how-to-use-802-1xmac-auth-and-dynamic-vlan-assignment/

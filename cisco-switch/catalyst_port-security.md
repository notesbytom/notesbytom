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

[1]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst4500/XE3-9-0E/15-25E/configuration/guide/xe-390-configuration/port_sec.html

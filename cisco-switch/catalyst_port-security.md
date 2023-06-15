# Catalyst Switch Port-Security

Port Security is a feature on Catalyst switches to restrict the quantity and identity of allowable MAC Addresses on a Switch Port.

## Voice Access Ports

Voice Access ports are configured with `switchport voice vlan #` and `switchport access vlan #` to use both a phone and computer on the same port with different vlans.

*Prior to Cisco IOS Release 12.2(31)SG, you required three MAC addresses as the maximum parameter to support an IP phone and a PC.
With Cisco IOS Release 12.2(31)SG and later releases, the maximum parameter must be configured to two, one for the phone and one for the PC.* [^1]

[^1]: [Cat. 4500 Config. Guide IOS 15.2 - Configuring Port Security][1]

[1]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst4500/XE3-9-0E/15-25E/configuration/guide/xe-390-configuration/port_sec.html

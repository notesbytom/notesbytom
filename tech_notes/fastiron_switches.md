# FastIron Network Switches

Foundry / Brocade / Ruckus FastIron Switch notes.

## Voice Vlan Support

To use the Voice Vlan feature, you need to: 

* enable cdp globally, `cdp run` 
* enable lldp globally, `lldp run`
* configure all vlans on the port as `tagged`
* designate one tagged-vlan as `dual-mode` (untagged) using interface config
* designame one tagged-vlan as `voice-vlan`

## Untagged Vlan Multi-Vlan Port

To have one untagged vlan combined with one-or-more tagged vlan(s) on a port, you must:

* configure all vlans on the port as `tagged`
* designate one tagged-vlan as `dual-mode` (untagged) using interface config


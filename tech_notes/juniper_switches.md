# Juniper Switches

## Spanning-Tree Cisco Interoperability

Juniper provides the "Virtual Spanning-Tree Protocol" (VSTP) which is designed for interoperability with Cisco Per-VLAN Spanning Tree features.

* Reference: [Junos: Configuring VSTP Protocol][1]
  * *"You can use Juniper Networks switches with VSTP and Cisco switches with PVST+ and Rapid-PVST+ in the same network."*
  * *"If your device interoperates with a Cisco device running Rapid per VLAN Spanning Tree (Rapid PVST+), we recommend that you enable both VSTP and RSTP on the EX Series or QFX Series interface."*
* Reference: [(EX) VSTP and RPVST+ convergence on native-vlan 1][2]
  * I'm not sure how to interpret this - maybe just emphasis to have a matching native (untagged) vlan for compatibility? Maybe preferably vlan-1?

[1]: https://www.juniper.net/documentation/us/en/software/junos/stp-l2/topics/topic-map/spanning-tree-configuring-vstp.html
[2]: https://supportportal.juniper.net/s/article/EX-VSTP-and-RPVST-convergence-on-native-vlan-1?language=en_US

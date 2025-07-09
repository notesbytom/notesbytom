# Wake On LAN

Remotely managing user devices on a network might require waking up the hardware if it is sleeping.

## Cisco IOS Commands

* `access-session control-direction in`
  * Allow magic packet on port when 802.1x or MAB port authentication are in use.
* `ip directed-broadcast ACCESS-LIST`
  * Configure on Layer Three Switch Vlan Interface (SVI) of sleeping device.
  * Use an Access-List to restrict magic packet source IP to authorized server(s).
* `ip helper-address DIRECTED-BROADCAST-IP`
  * Configure on SVI where Server sends Non-Directed-Broadcast
* `ip forward-protocol udp PORT-NUMBER`
  * Likely UDP port 7 or 9, depends on WoL sender

## Related Reading

* [Wake-on-LAN][5] (Wikipedia)
* [Configure Layer 3 Switch for Wake-On-LAN Support across VLANs][1]
* [IEEE 802.1X Wake on LAN Support][2]
* [WoL and dynamic VLAN assignment][3] (reddit discussion)
* [wake on lan with dynamic vlan assignment][4] (cisco community discussion)
* IP Addressing Configuration Guide, Cisco IOS XE - [Configuring IPv4 Broadcast Packet Handling][6]
* IOS IP Application Services [Command Reference][7] *ip directed-broadcast; ip forward-protocol; ip helper-address*
* [HP Device Manager 5.0 Administrator’s Guide][8] - search for "Wake" or "WoL"

[1]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-series-switches/91672-catl3-wol-vlans.html
[2]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/sec_usr_8021x/configuration/15-mt/sec-user-8021x-15-mt-book/sec-ieee-wake-lan-supp.html
[3]: https://www.reddit.com/r/networking/comments/etquo9/wol_and_dynamic_vlan_assignment/
[4]: https://community.cisco.com/t5/routing/wake-on-lan-with-dynamic-vlan-assignment/td-p/1862864
[5]: https://en.wikipedia.org/wiki/Wake-on-LAN
[6]: https://www.cisco.com/c/en/us/td/docs/routers/ios/config/17-x/ip-addressing/b-ip-addressing/m_iap-bph-0.html
[7]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ipapp/command/iap-cr-book/iap-i1.html
[8]: https://ftp.hp.com/pub/hpdm/Documentation/AdminGuide/5.0/HP_Device_Manager_5.0.4_Administrator_Guide_en_US.pdf

# Cisco ASA LACP

Cisco ASA LACP is associated with keywords: EtherChannel, Port-Channel, Channel-Group

## Configuring LACP with Cisco ASA

* CLI Book 1: [Cisco ASA Series General Operations CLI Configuration Guide, Chapter: EtherChannel ...][1]
* In Interface Configuration: `channel-group # mode active`
* Configure the new Port-Channel interface: `interface port-channel #`
* For ASA with Firepower hardware use `connect fxos` to enter fxos cli, then 
  * `scope eth-uplink`
  * `scope fabric`
  * `show port-channel`
  * `scope port-channel #`
  * `show member-port detail`

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa94/config-guides/cli/general/asa-94-general-config/interface-echannel.html

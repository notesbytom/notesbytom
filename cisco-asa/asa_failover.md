# Cisco ASA Failover

Failover High-Availability notes for Cisco Secure Firewall ASA.

## Configuration Recommendations

Some quotes from the Cisco documentation along with reference links and my notes.

* *"We recommend that you **configure standby IP addresses for all interfaces** except for the failover and state links."*
  * [Configure Active/Standby or Active/Active Failover][1]
* *"All information sent over the failover and state links is sent in clear text unless you secure the communication
  with an IPsec tunnel or a failover key ... We **recommend securing the failover communication** with an
  IPsec tunnel or a failover key ..."*
  * [Failover and Stateful Failover Links][1]
  * The documentation lists ipsec failover link protection as "preferred" vs the
    classic failover key configuration being "legacy" and "proprietary".
    * Note that ipsec failover link encryption has an IKE policy dependency.
  * See my [ASA Broken Defaults][2] note page for failover ipsec dependency info.

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa917/configuration/general/asa-917-general-config/ha-failover.html
[2]: ./asa-broken-defaults.md

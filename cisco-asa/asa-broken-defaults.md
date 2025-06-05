# ASA Broken Defaults

The Cisco ASA is an excellent network security device, but several factory defaults can break some typical network traffic. 
These settings might be good to change on standard deployments.

* Turn On `inspect icmp` to allow ping responses through
* Turn On `inspect icmp error` to connection-track non-ping ICMP responses
  * Enable incoming icmp `time-exceed` and `unreachable` traffic on outside incoming access-list
  * These items allow return messages for path mtu detection (PMTUD) and traceroute among other
    important things used by the TCP/IP stack to deal with end-to-end MTU limits and other common routing errors.
* Turn OFF ~~`inspect esmtp`~~ under policy-map global_policy inspection_default
  * This setting often breaks communication between mail servers like email gateways and Exchange servers.
    It also breaks the ability to test SMTP with telnet or other common troubleshooting tools.
* Edit the `policy-map global_policy` for `class class-default` to add `set connection decrement-ttl`
  * This should make the ASA try to appear as a "hop" during traceroute testing.
  * The factory-default setting is for the ASA to appear "invisible" (not-a-hop) to traceroute.


There are many settings out-of-box that a deployment might want to change. 
These are some common items that I usually want to change right away on a new ASA device.
This was originally posted on my old blog - copying here so I can find it easier.

## Traffic TO The ASA

The ASA has a long-standing tradition of allowing you to talk ONLY to the ASA IP Address "facing" you.
This is for management and monitoring traffic like ssh, https, snmp, ping.

You canNOT traverse "through" the ASA and talk to its IP Address which is away from you.

There are **a couple exceptions** to this rule:
* **IF** you are connecting to the ASA **across a VPN tunnel** (ipsec or other vpn)
  * **AND** the IP you are connecting to is designated as `management-access`
  * THEN you might be able to talk to it (ping,ssh,https)
  * There are *often bugs with this feature* - especially with SNMP in recent versions
* On newer Firepower hardware and latest software release(s) - there is a "**loopback**" interface feature
  * The loopback interface is not directly associated with a physical interface.
  * The loopback interface should be reachable from any direction - if routing and access rules allow.
  * There might be special configuration commands/options for protocols to work with a loopback interface.

## DHCP Issues

For ASA DHCPd Server IP Reservations there is a glitch/bug where address reservation fails to same client due to differing client-id's.
* First Client ID form gets the IP, other form doesn't. Only difference being a 01 prefix or not.
* Common for HP Windows Thin Clients PXE booting from remote SCCM/MECM.
* Workaround 1: Remove the ASA DHCPd Server IP Reservation for the trouble client during the PXE boot process.
* Workaround 2 (preferred): Migrate to Windows Server DHCP Services and use DHCP Relay on the ASA (or IP Helper on an IOS network device).

The High Availability Failover feature does not replicate the ASA DHCPd server lease state. This is another motivation to use Windows Server DHCP Services.
* The documentation states that DHCPd lease state is not necessary because the server will ping addresses to see if they are in-use before offering them.

## Failover Link IPsec IKEv2 Dependency

If you already have IKEv2 Policies configured on the ASA, there is a good chance that enabling an ipsec key on the failover link will cause the failover communications to fail due to a Missing IKEv2 policy.
* To Troubleshoot (IKEv2 and failover feature outage required):
  * Disable failover
  * Backup and Clear the IKEv2 configuration
  * Re-enable failover with an ipsec key configured
  * If the failover communication/link functions correctly, verify the IKEv2 settings needed
    * `show crypto ikev2 sa detail` and `show vpn-sessiondb failover` commands
    * Example: aes-gcm-256 + group 20 + prf_sha
    * The actual IKE settings used may vary with hardware platform, software version, and encryption license.
  * Explicitly add the discovered magic failover ipsec ikev2 policy
  * THEN re-add your other ikev2 policies you cleared out for troubleshooting.
* By adding the missing failover IKEv2 policy, the issue should be resolved and failover ipsec link protection should work correctly.

## Software Updates

Uploading Software Updates to the ASA using SCP initiated from a remote PC or Server is painfully slow. 
This appears to be a similar issue to sending update files to IOS switches.
There is likely a Control Plane Policing type of feature limiting the SCP bandwidth.
As a workaround, uploads initiated from a remote PC using ASDM are relatively fast.
This is similar to using the webgui on an IOS switch. 
For automation, HTTPS transfers can be attempted from a remote PC or Server using `curl`.
ASA `curl` HTTPS examples: [Cisco Secure Firewall ASA HTTP Interface for Automation][1].

## Further Reading and References

* [Secure Firewall ASA - CLI Configuration Guide - Inspection of Basic Internet Protocols][2]

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/misc/http-interface/asa-http-interface.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa923/configuration/firewall/asa-923-firewall-config/inspect-basic.html

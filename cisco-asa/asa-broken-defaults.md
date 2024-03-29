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

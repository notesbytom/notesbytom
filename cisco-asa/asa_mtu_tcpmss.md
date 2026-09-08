# Cisco ASA MTU and TCP Maximum Segment Size

The Cisco ASA has some features to work around issues with Maximum Transmission Unit (MTU) sizes and TCP Maximum Segment Size (TCPMSS).
When using IPsec tunnels, or sending traffic through multiple layers of tunnels, 
the end-to-end MTU for the ASA and/or endpoint systems will be lower than the ethernet default of 1500 bytes.

## TCP Maximum Segment Size Clamping

To workaround path MTU issues for TCP traffic, the ASA has a TCP Maximum Segment Size clamping feature enabled by default.
[The `sysopt connection tcpmss ...` command][1] can be used to change the TCPMSS clamping size (ASA default TCPMSS = 1380 bytes).
* ASA General Operations CLI Configuration Guide - Interfaces - [Advanced Interface Configuration][5]
  * Sections: *Configure the MTU and TCP MSS, About the MTU, About the TCP MSS*
* [Resolve IPv4 Fragmentation, MTU, MSS, and PMTUD Issues][6] (Related Documentation focused on Cisco Routers)

## Conservative TCP MSS Calculation

If a MTU test has been completed, then subtract maximum combined header size from the MTU to determine conservative TCP Maximum Segment Size.
* [IPv4 Header][5] = 20 Bytes (without options)
* [TCP Header][6] = 64 Bytes (Including max SACK and Timestamp Options padded to 4-byte increment)
  * 20 Byte TCP Header Without Options
  * 34 Bytes Maximum Selective Acknowledgement Option
    * 2 + 8*4 = 34 Bytes Maximum
  * 10 Bytes TCP Timestamp Option
  * Pad Sum of Option Lengths to a 4-Byte Increment (44 is compliant)
* Total Headers (IPv4+TCP) = 84 Bytes
  * This is a conservative estimate accounting for common tcp performance options (timestamp and selective acknowledgement)
* If IPsec tunnels are being used, do the MTU testing from Inside the tunnel.
  * If the tunneling protocol has a variable header size, subtract more to allow for the maximum

### TCP MSS Bug

Cisco Bug: CSCwi49884, TCP MSS is changed back to the default value when a VTI or loopback interface is created.
* [Quick View of Cisco Bug: CSCwi49884][2] - Public View
* [Bug Details for CSCwi49884][3] - Login Required
* [Cisco Bug Search Tool][4] - Search for `tcpmss`

My Notes: This has also been observed after reboot when applying a new software release or patch. ASSUME ALL SOFTWARE RELEASES ARE IMPACTED.
If MTU issues are suspected, reapply the `sysopt connection tcpmss ...` setting! 
Reapply after any configuration of VTI or Loopback interfaces!
Reapply after any software updates!

## IPsec Security-Association PMTU-Aging

For IPsec Security-Associations (SA's), the ASA has a default setting of `crypto ipsec security-association pmtu-aging infinite`.

If the MTU between your IPsec endpoints changes periodically, you can tune this setting to re-evaluate the IPsec Path MTU.
* `pmtu-aging` can be set between 15 and 30 minutes in recent ASA software versions.
* It can also be set back to the default of `infinite` if desired.

The Cisco ASA Command Reference gives some incorrect information on this command, so I am not providing that link here.

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa-cli-reference/S/asa-command-ref-S/su-sz-commands.html
[2]: https://bst.cisco.com/quickview/bug/CSCwi49884
[3]: https://bst.cloudapps.cisco.com/bugsearch/bug/CSCwi49884
[4]: https://bst.cloudapps.cisco.com/bugsearch
[5]: https://en.wikipedia.org/wiki/IPv4#Header
[6]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_segment_structure

[5]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa920/configuration/general/asa-920-general-config/interface-mtu.html
[6]: https://www.cisco.com/c/en/us/support/docs/ip/generic-routing-encapsulation-gre/25885-pmtud-ipfrag.html

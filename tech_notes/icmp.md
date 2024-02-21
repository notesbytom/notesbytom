# ICMP Notes

ICMP us an essential IP Protocol which supports features such as: `ping`, `traceroute`, and Path MTU Detection. 

ICMP runs on top of IP - this would normally put ICMP in Layer 4 "Transport" of the [OSI Model][3], but ICMP is so essential to the functioning of IP that it is listed under Layer 3 "Network" along with IP itself. 
Because ICMP runs on top of IP, I like to think of it as a higher level protocol - maybe layer 3.5 of the OSI Model (between 3 and 4). ICMP packets have an ICMP header that is separate from the IP header. ICMP is [IP Protocol # 1][4] in the IP Header.

## Path MTU Discovery

Starting with PowerShell 7.2, there is a `-MtuSize` parameter (alias `-MtuSizeDetect`) for the `Test-Connection` cmdlet.
* https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-connection?view=powershell-7.2

Wikipedia has a good overview of Path MTU Discovery (PMTUD).
* https://en.wikipedia.org/wiki/Path_MTU_Discovery

Fortinet has a good community knowledge base post on TCP Maximum Segment Size (TCPMSS) testing using ping.
* https://community.fortinet.com/t5/FortiGate/Technical-Tip-Setting-TCP-MSS-value/ta-p/194518

## References

* [Internet Control Message Protocol][1] (wikipedia.org)
* [Understand the Ping and Traceroute Commands][2] (cisco.com) Technology Support - IP Routing - Troubleshooting TechNotes

[1]: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[2]: https://www.cisco.com/c/en/us/support/docs/ios-nx-os-software/ios-software-releases-121-mainline/12778-ping-traceroute.html
[3]: https://en.wikipedia.org/wiki/OSI_model
[4]: https://en.wikipedia.org/wiki/List_of_IP_protocol_numbers

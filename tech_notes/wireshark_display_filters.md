# Wireshark Display Filters

Show traffic matching a tcp port (Remote Desktop / RDP Example):
* `tcp.port == 3389`
  * Alternative syntax: `tcp.port eq 3389`

Match IP Address in Subnet - either in source or destination:
* `(ip.src >= 1.2.0.0 and ip.src <= 1.3.0.0) or (ip.dst >= 1.2.0.0 and ip.dst <= 1.3.0.0)`
  * Match source or destination ip of 1.2.x.x

## Time Display Format

You can customize the Time Display Format
* Menu: View - Time Display Format - ...
  * Example: Date and Time of Day
* Maybe add another Column to display the RelativeTime (seconds since beginning of capture)

## Export Specified Packets

You can export packets to new smaller capture file based on criteria like the following: 
* Captured
* Displayed (via display filter)
* Selected
* Marked

This is useful to avoid saving and sharing packets unrelated to your traffic of interest.

Related Documentation: [Wireshark User’s Guide - Exporting Data - Export Specified Packets][3]

## IP Redirects Troubleshooting

Troubleshooting ICMP IP Redirect Errors in Wireshark.

Custom Column Hints:
* Title=Destination Address, Type=Custom, Fields=ip.dst, Occurrence=0
* Title=Gateway Address, Type=Custom, Fields=icmp.redir_gw, Occurrence=0

## MAC Address OUI Manufacturers

Web-based Wireshark [OUI Lookup Tool][4] - uses the same data source as the Wireshark program.
The file `manuf-data.c` (~4MB in 2025) is used by the Wireshark Enhanced Packet ANalyzer (EPAN).
There is a Python script [make-manuf.py][5] which creates the Manufacturer Data file from IEEE sources.
Search the python script for string "manuf-data" for details of the IEEE sources used.

## TCPDump Notes

* https://www.tcpdump.org/manpages/tcpdump.1.html
* Use `-nn` for numeric addresses and ports in the output.
* Use `-r` to read and display a pcap file
* Use `-v` for more verbose detail in the output including TTL values.

## References

* [Wireshark Wiki - Display Filters][1]
* [Wireshark User’s Guide - Building Display Filter Expressions][2]

[1]: https://wiki.wireshark.org/DisplayFilters
[2]: https://www.wireshark.org/docs/wsug_html_chunked/ChWorkBuildDisplayFilterSection.html
[3]: https://www.wireshark.org/docs/wsug_html_chunked/ChIOExportSection.html
[4]: https://www.wireshark.org/tools/oui-lookup.html
[5]: https://gitlab.com/wireshark/wireshark/-/blob/master/tools/make-manuf.py

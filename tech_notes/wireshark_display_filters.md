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

## References

* [Wireshark Wiki - Display Filters][1]
* [Wireshark User’s Guide - Building Display Filter Expressions][2]

[1]: https://wiki.wireshark.org/DisplayFilters
[2]: https://www.wireshark.org/docs/wsug_html_chunked/ChWorkBuildDisplayFilterSection.html
[3]: https://www.wireshark.org/docs/wsug_html_chunked/ChIOExportSection.html

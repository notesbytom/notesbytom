# Wireshark Display Filters

Show traffic matching a tcp port (Remote Desktop / RDP Example):
* `tcp.port == 3389`
  * Alternative syntax: `tcp.port eq 3389`

## Time Display Format

You can customize the Time Display Format
* Menu: View - Time Display Format - ...
  * Example: Date and Time of Day
* Maybe add another Column to display the RelativeTime (seconds since beginning of capture)

## References

* [Wireshark Wiki - Display Filters][1]
* [Wireshark User’s Guide - Building Display Filter Expressions][2]

[1]: https://wiki.wireshark.org/DisplayFilters
[2]: https://www.wireshark.org/docs/wsug_html_chunked/ChWorkBuildDisplayFilterSection.html

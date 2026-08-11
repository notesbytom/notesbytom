# DHCP Option 2 Timezone Offset
proc tz_offset {int_hours} {
  # Formatting %ll (long long) avoids truncation
  # 0xffffffff & ... (converts to unsigned 32-bit integer)
  set offset [format "0x%llx" [expr 0xffffffff & ($int_hours*60*60)]]
  puts "Time Zone Offset $int_hours Hours = $offset"
}
# Get TZ Offset using First CLI Argument
# Run it like: `tclsh dhcp_timezone_offset.tcl -5`
tz_offset [lindex $argv 0]

# This example script demonstrates how to set timezone and ntp servers in your dhcp scope options
# ... on Windows Server DHCP using PowerShell

# Substitute your dhcp server name here
$dhcpserver = "YOUR-DHCP-SERVER-NAME"

# Substitute your ntp server(s) here (might be domain controllers)
$ntpservers = "1.2.3.4", "2.3.4.5"

# Timezone Offset is in seconds and stored as a DWORD (uint32), example -5 hours
$timezoneoffset = [BitConverter]::ToUInt32([BitConverter]::GetBytes(-5*60*60),0)

$scopes = Get-DhcpServerv4Scope -ComputerName $dhcpserver
foreach ($scope in $scopes) {
    # DHCP Option 2 is Timezone Offset in seconds (DWORD)
    Set-DhcpServerv4OptionValue -ComputerName $dhcpserver -scopeid $scope.ScopeId -OptionId 2 -Value $timezoneoffset -Verbose
    # DHCP Option 42 is NTP Server List
    Set-DhcpServerv4OptionValue -ComputerName $dhcpserver -ScopeId $scope.ScopeId -OptionId 42 -Value $ntpservers -Verbose
    # This example assumes that all scopes are load-balance-failover enabled
    # ... comment-out if you don't have load-balance-failover scopes
    Invoke-DhcpServerv4FailoverReplication -ComputerName $dhcpserver -ScopeId $scope.ScopeId -Force -Verbose
}

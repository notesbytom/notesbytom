# If users report they are not able to reach private resources when connected, ...
# check the following to ensure the full-tunnel or split-tunnel setting matches the vpn-server configuration.

# Look for system connections with Full Tunnel vs Split Tunnel configured.

Get-VpnConnection -AllUserConnection | Format-Table Name,SplitTunnel*

# Look for Full Tunnel and Classless Split-Tunnel options in system remote-access-services dialer phonebook.

Select-String -path $env:ProgramData\Microsoft\Network\Connections\Pbk\rasphone.pbk '\[|DisableClass|PrioritizeRemote' | Format-Table Line


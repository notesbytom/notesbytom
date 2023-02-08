Set-StrictMode -Version Latest

$list = Get-CimInstance -ClassName Win32_Share -ComputerName FILE_SERVER_NAME

$list

# Properties: Name, Path, Description, PSComputerName
# Unfortunately this appears to require admin-level permissions?
# Is there a similar way that works for non-privileged users?

$ErrorActionPreference = "Stop"
Set-StrictMode -Version "Latest"

# sample code for testing if current user has elevated privilege required for admin scripts

Function Test-IsAdmin {
  # Check if we're Elevated (UAC) "Run as Administrator"
  $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
  $principal = New-Object Security.Principal.WindowsPrincipal $identity
  $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# example using function and throwing error
if (-not (Test-IsAdmin)) {
    throw "This Script Requires 'Run as Administrator' (Elevated UAC Privilege)"
}

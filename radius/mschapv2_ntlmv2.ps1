# MS-CHAPv2 defaults to NTLMv1 on Windows Radius Server (NPS)
# This registry setting enables NTLMv2 compatibility for MS-CHAPv2 on Windows Radius
# https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/lt2p-ipsec-ras-vpn-connections-fail
# https://support.microsoft.com/en-us/help/893318/a-user-is-not-successfully-authenticated-when-ntlmv2-authentication-is

$path = "HKLM:\SYSTEM\CurrentControlSet\Services\RemoteAccess\Policy"
Set-ItemProperty -Path $path -Name "Enable NTLMv2 Compatibility" -Type DWord -Value 1 -Verbose

Restart-Service IAS -Verbose

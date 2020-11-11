# Readable Example Adding L2TP IPSec VPN Connection with Pre-Shared Key (PowerShell)
# ... This sample will prompt for credentials when connecting.
# ... Change values of $name and $options to match your environment or test scenario

$name = 'Test-VPN';
$options = @{AllUserConnection=$true; Name=$name; ServerAddress='vpnserver.yourdomain.com'; TunnelType='L2tp'; EncryptionLevel='Maximum'; AuthenticationMethod='MSChapv2'; UseWinlogonCredential=$false; L2tpPsk='Your.Pre-Shared-Key.Here.Abc.123'; IdleDisconnectSeconds=14400; Force=$true};
$count = 0;
foreach ($conn in get-vpnconnection -alluserconnection) {
    if($conn.Name -eq $name) {
        $count += 1;
        Set-VpnConnection @options;
    }
};
if ($count -lt 1) { Add-VpnConnection @options; };

# Example to run with scheduled immediate task as SYSTEM with Group Policy
# ... Collapse it down to one-line and run with: powershell -command "& {...}"
# ... Watch out for quoting and escaping ... convert internal quotes to single
# ... With this same method we can also set EAP policy, custom IPsec, etc.

powershell -command "& {$name = 'Test-VPN'; $options = @{AllUserConnection=$true; Name=$name; ServerAddress='vpnserver.yourdomain.com'; TunnelType='L2tp'; EncryptionLevel='Maximum'; AuthenticationMethod='MSChapv2'; UseWinlogonCredential=$false; L2tpPsk='Your.Pre-Shared-Key.Here.Abc.123'; IdleDisconnectSeconds=14400; Force=$true}; $count = 0; foreach ($conn in get-vpnconnection -alluserconnection) { if($conn.Name -eq $name) { $count += 1; Set-VpnConnection @options; } }; if ($count -lt 1) { Add-VpnConnection @options; };}"

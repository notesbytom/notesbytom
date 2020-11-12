# Readable Example Adding L2TP IPSec VPN Connection with Pre-Shared Key (PowerShell)
# ... This sample will prompt for credentials when connecting.
# ... Change values of $name and $options to match your environment or test scenario
# ... Default EAP Setting is EAP-MSCHAPv2

$name = 'Test-VPN';
$server = 'vpnserver.yourdomain.com';
$psk = 'Your.Pre-Shared-Key.Here.Abc.123';
$auth = 'Eap';
$options = @{AllUserConnection=$true; Name=$name; ServerAddress=$server; TunnelType='L2tp'; EncryptionLevel='Maximum'; AuthenticationMethod=$auth; UseWinlogonCredential=$false; RememberCredential=$false; L2tpPsk=$psk; IdleDisconnectSeconds=14400; Force=$true};
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

powershell -command "& {$name = 'Test-VPN'; $server = 'vpnserver.yourdomain.com'; $psk = 'Your.Pre-Shared-Key.Here.Abc.123'; $auth = 'Eap'; $options = @{AllUserConnection=$true; Name=$name; ServerAddress=$server; TunnelType='L2tp'; EncryptionLevel='Maximum'; AuthenticationMethod=$auth; UseWinlogonCredential=$false; RememberCredential=$false; L2tpPsk=$psk; IdleDisconnectSeconds=14400; Force=$true}; $count = 0; foreach ($conn in get-vpnconnection -alluserconnection) { if($conn.Name -eq $name) { $count += 1; Set-VpnConnection @options; } }; if ($count -lt 1) { Add-VpnConnection @options; };}"

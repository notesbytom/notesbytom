# Group Policy Files Analysis

## PowerShell Example Script

Review files copied by Group Policy Preferences Files module. Specifically we're interested in source and destination path along with file sizes (individual and total).

```powershell

$domain_fqdn = "your.domain.fqdn"
$policy_guid = "{1234-5678-90-your-policy-guid}"

$files_xml_path = "\\$domain_fqdn\SYSVOL\$domain_fqdn\Policies\$policy_guid\Machine\Preferences\Files\Files.xml"

$bytes = 0; 
foreach ($file in (Select-Xml -XPath /Files/File -Path $files_xml_path)) { 
  $fileObj = (get-item ($file.node.Properties.fromPath)); 
  $file_len =  $fileObj.Length
  $bytes += $fileObj.Length; 
  write-host "$($fileObj.FullName)"; 
  write-host ("  targetPath = {0}, bytes = {1:N0}" -f $file.node.Properties.targetPath, $file_len)
  write-host ("-"*80)
} 

Write-Host ("Total Bytes = {0:N0}" -f $bytes);
```

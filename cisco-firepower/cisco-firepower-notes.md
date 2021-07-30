# Cisco Firepower Notes

## Offline License Reservation

Starting with FDM 6.6 (locally-managed firepower FTD device), FDM supports Universal Permanent License Reservation. 

* https://www.cisco.com/c/en/us/td/docs/security/firepower/660/fdm/fptd-fdm-config-guide-660/fptd-fdm-license.html#id_123878
* "If you do not have a path to the internet for the system, you cannot use Smart Licensing. Instead, switch to Permanent License Reservation (PLR) mode."
* "FDM supports Universal PLR only. You cannot apply a Specific PLR to an FDM-managed device."
* "You must work with your Cisco representative to enable Universal Permanent License Reservation (PLR) mode in your Cisco Smart Software Manager (CSSM) account."

Centrally managed Firepower Management Center (FMC) deployments can use Specific License Reservation starting with FMC 6.3.0.

* https://www.cisco.com/c/en/us/td/docs/security/firepower/roadmap/fmc-new-features/fmc-new-features-by-release.html
* "Specific License Reservation **for approved customers**"
* This is for offline air-gapped use only. If the FMC has Internet connectivity, normal Smart Licensing is used.

## Virtual Tunnel Interfaces (VTI)

[ENH: FTD should support VTI/Virtual-Template (CSCvf75938)][5]

This has been implemented, it will be good to test it out :-). BGP settings will be important to tune dynamic routing.

From [Cisco Firepower Release Notes, Version 6.7.0, Features and Functionality][6]

* *"Virtual Tunnel Interface (VTI) and route-based site-to-site VPN"*

## Manage FTD on a data interface

From [Cisco Firepower Release Notes, Version 6.7.0, Features and Functionality][6]

* *"You can now configure FMC management of the FTD on a data interface instead of using the dedicated management interface. This feature is useful for remote deployment when you want to manage the FTD at a branch office from an FMC at headquarters and need to **manage the FTD on the outside interface**."*
* *"FMC access on a data interface is not supported with clustering or high availability."*

## SSH Decryption

[ENH: Add SSH decryption on the Firepower (CSCvj90930)][7]

Cisco Firepower Enhancement Request for SSH decryption has not been implemented. No indication of plans to add the feature.

Open a support request with Cisco and mention this Enhancement request number to indicate your desire for the feature.

## Traffic Decryption

From FMC Config Guide v6.7, [Understanding Traffic Decryption][1]

* *"The Firepower System **does not support mutual authentication; that is, you cannot upload a client
certificate** to the FMC and use it for either Decrypt - Resign or Decrypt - Known Key TLS/SSL rule 
actions. For more information, see Decrypt and Resign (Outgoing Traffic). and Known Key Decryption (Incoming Traffic)."*
* *"The Firepower System **does not currently support TLS version 1.3 encryption or decryption**."*
* *"**Aggressive TLS 1.3 downgrade**, [introduced in] 6.2.3.7, Using the system support `ssl-client-hello-enabled aggressive_tls13_downgrade {true|false}` 
CLI command, you can determine the behavior for downgrading TLS 1.3 traffic to TLS 1.2. For details, see the Command Reference for Firepower Threat Defense."*

## File Control

From FMC Config Guide v6.7, [File Policies and Malware Protection][2]

* *"allow or block files based on simple file type matching"*
* *"application protocol, The system can detect ... files transmitted via FTP, HTTP, SMTP, IMAP, POP3, and NetBIOS-ssn (SMB). 
Any, the default, detects files in HTTP, SMTP, IMAP, POP3, FTP, and NetBIOS-ssn (SMB) traffic. 
To improve performance, you can restrict file detection to only one of those application protocols on a per-file rule basis."*
* *"License Requirements for File and Malware Policies"*
  * *"Block or allow all files of a particular type (for example, block all .exe files)"*
    * *"Threat (for FTD devices)"*
    * *"Protection (for Classic devices)"*
  * *"Allow, Block, Block with Reset"*
  
From FMC Config Guide v6.2.3, [Decryption Tuning Using TLS/SSL Rules][4]

* "*Encrypted Application Identification. The system can identify unencrypted applications that become encrypted using **StartTLS. This includes such applications as** SMTPS, POPS, **FTPS,** TelnetS, and IMAPS. In addition, it can identify certain encrypted applications based on the Server Name Indication in the TLS ClientHello message, or the server certificate subject distinguished name value."*
  * It's not clear if the Firpower behavior with StartTLS applications would be different, hopefully the same once an application is identified?

From FMC Config Guide v6.7, [File and Malware Inspection Performance and Storage Tuning][3]
  
* *"Limit the number of bytes inspected when doing file type detection"* 
  * *"Specifies the number of bytes inspected when performing file type detection."*
  * *"0 - 4294967295 (4GB), 0 removes the restriction. The default value is the maximum segment size of a TCP packet (1460 bytes). 
  In most cases, the system can identify common file types using the first packet. To detect ISO files, enter a value greater than 36870."*


[1]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/configuration/guide/fpmc-config-guide-v67/understanding_traffic_decryption.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/configuration/guide/fpmc-config-guide-v67/file_policies_and_advanced_malware_protection.html
[3]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/configuration/guide/fpmc-config-guide-v67/file_and_malware_inspection_performance_and_storage_tuning.html
[4]: https://www.cisco.com/c/en/us/td/docs/security/firepower/623/configuration/guide/fpmc-config-guide-v623/decryption_tuning_using_ssl_rules.html
[5]: https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvf75938/
[6]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/relnotes/firepower-release-notes-670/m_features_functionality.html
[7]: https://bst.cloudapps.cisco.com/bugsearch/bug/CSCvj90930/

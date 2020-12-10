# Cisco Firepower Notes

# Traffic Decryption

From FMC Config Guide v6.7, [Understanding Traffic Decryption][1]

* *"The Firepower System **does not support mutual authentication; that is, you cannot upload a client
certificate** to the FMC and use it for either Decrypt - Resign or Decrypt - Known Key TLS/SSL rule 
actions. For more information, see Decrypt and Resign (Outgoing Traffic). and Known Key Decryption (Incoming Traffic)."*
* *"The Firepower System **does not currently support TLS version 1.3 encryption or decryption**."*
* *"**Aggressive TLS 1.3 downgrade**, [introduced in] 6.2.3.7, Using the system support `ssl-client-hello-enabled aggressive_tls13_downgrade {true|false}` 
CLI command, you can determine the behavior for downgrading TLS 1.3 traffic to TLS 1.2. For details, see the Command Reference for Firepower Threat Defense."*

# File Control

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

[1]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/configuration/guide/fpmc-config-guide-v67/understanding_traffic_decryption.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/firepower/670/configuration/guide/fpmc-config-guide-v67/file_policies_and_advanced_malware_protection.html

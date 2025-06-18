# Migrate from FTD to ASA

The Cisco Secure Firewall Hardware models like FPR and CSF can run either FTD or ASA software.
The ASA software provides a more classic Cisco CLI-based configuration feature set.

## Install the ASA Software

See [FXOS Troubleshooting with ASA - Reimaging and System Recovery][1] section "Perform a Complete Reimage" 
starting at "Step 8 Download and boot the ASA package." The package image file dan be downloaded from "usbA:"
in addition to network-based methods like FTP, SCP, SFTP, or TFTP.

## Appliance Mode vs Platform Mode

If the ASA software being installed is new enough, it should default to Appliance mode which will hide the
details of the underlying FXOS and allow all configuration to be done through the ASA CLI.

## Centralized Management of ASA

There are multiple ways to centrally manage deployed Cisco ASA firewalls.
One popular way is to use [Ansible which has a Cisco ASA collection][2].
Sadly the developers of the Ansible ASA collection have announced they will stop publishing new versions starting with Ansible 12.
Hopefully there will be some community support to pick up the ASA collection and maintain it.

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/fxos/troubleshoot/asa-fxos-troubleshoot/system_recovery.html
[2]: https://docs.ansible.com/ansible/latest/collections/cisco/asa/

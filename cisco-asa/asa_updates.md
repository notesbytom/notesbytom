# Cisco ASA Updates

Notes related to updating ASA and ASDM software on Cisco Secure Firewall.

## Release Notes

Cisco Secure Firewall [ASA Release Notes][1]

| Release Train | Interim     | ASDM         |
|---------------|-------------|--------------|
| [9.24(x)][2]  | [9.24.1][3] | [7.24(x)][7] |
| [9.23(x)][4]  | ...         | ... |
| [9.22(x)][5]  | ...         | ... |
| [9.20(x)][6]  | ...         | ... |

## ASDM Upload Bug

The OpenJRE ASDM File must be uploaded separately because the bundled ASDM is for Oracle Java. Advantage of OpenJRE version is that the required Java is bundled with the installer (No need to install java separately on client system to run ASDM).

There seems to be a bug with recent releases when uploading the ASDM *.bin file where the appliance validates the signature and then fails to save the file to flash. A possible workaround is to specify the flash device name in the SCP upload destination path specification like in this example:
* `scp -O asdm-openjre-7241.bin kbradmin@1.2.3.4:disk0:/asdm-openjre-7241.bin`
  * Strangely this helped by adding the `disk0:` to the path for destination of the upload file

[1]: https://www.cisco.com/c/en/us/support/security/adaptive-security-appliance-asa-software/products-release-notes-list.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa924/release/notes/asarn924.html
[3]: https://www.cisco.com/web/software/280775065/174424/ASA-9241-Interim-Release-Notes.html
[4]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa923/release/notes/asarn923.html
[5]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa922/release/notes/asarn922.html
[6]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa920/release/notes/asarn920.html
[7]: https://www.cisco.com/c/en/us/td/docs/security/asdm/7_24/release/notes/rn724.html

# ASDM Notes

## MSI Installer

Cisco ASA ASDM MSI File (Security Device Manager GUI).
[ASDM upgrade issue (dm-install-tmp.msi, Error 1714)][1] - Cisco Community

* `C:\Users\myusername\.asdm\cache\`
  * `$env:USERPROFILE\.asdm\cache\`
* Look for file: dm-install-tmp.msi
* Copy it to another location and rename to indicate the software version.

This is only visible when the installer has launched and before the installer has closed (it auto-deletes).

## ASDM MSI Versions

Newer versions of ASDM will require Newer versions of the ASDM-IDM Launcher Program which has an MSI installer for Windows.
This table is based on a limited number of releases. There may be some variations not reflected here.

| ASDM | MSI |
|------|-----|
|7.23.x|1.9.9|
|7.22.x|1.9.8|
|7.20.x|1.9.7|
|7.18.x|1.9.5|

## Broken Start Menu Shortcut

The Cisco ASDM-IDM Launcher shortcut is usually broken (invalid path for wscript). 
This can be fixed by removing/changing the Shortcut Properties Target path for `wscript.exe` to the default under $env:SystemRoot\system32\
for example `C:\Windows\system32\wscript.exe`.

[1]: https://community.cisco.com/t5/other-security-subjects/asdm-upgrade-issue-dm-install-tmp-msi-error-1714/m-p/4673223#M150704

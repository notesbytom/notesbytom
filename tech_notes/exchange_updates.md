# Exchange Updates

https://techcommunity.microsoft.com/t5/exchange-team-blog/new-exchange-server-security-update-and-hotfix-packaging/ba-p/3301819

Exchange Security Updates (SU) from the Catalog are in *.cab form. Inside the CAB file is a *.msp patch file.

Apparently the \*.msp must be installed with ELEVATED PRIVILEGES. 
For example, from Elevated PowerShell or CMD window with:
* `msiexec /update Drive:\Path\To\UpdateFile.msp`

This is often an issue as double-clicking the MSP won't run with the correct privileges.

To help resolve this issue, EXE Package files are also published in the Microsoft Download center (NOT in the Update Catalog).

It is recommended to use the EXE Packages because they include logic that will require elevation to proceed with the install.

Read the linked article for more detail from Microsoft.

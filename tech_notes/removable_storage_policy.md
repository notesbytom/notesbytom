# Removable Storage Policy

Access to Removable Storage devices in Windows can be restricted by Group Policy.

## Limit Scope of Policy

Limit the scope of the policy to only apply to specific systems using techniques like these:

* Security Filtering, limit to specific Computers or Groups of Computers
* WMI Filter, limit to specific type of computer like Workstation OS Only
* OU Linking, link to only specific OU's (vs linking at domain root)

Create an **Exemption/Override Policy** which can be used with linking order, security filtering, and policy enforcement to win over a general policy to deny access.

## Policy Settings

Removable Storage policy settings are found here:

* Computer - Policies - Administrative Templates - System - Removable Storage Access
  * There are detailed settings for different types of Removable Storage
    * CD and DVD
    * Removable Disks
    * All Removable Storage
    * ...

## Further Reading

* https://serverfault.com/questions/576768/disable-usb-mass-storage-access-on-client-machines
* https://blog.emsisoft.com/en/35347/how-to-use-a-group-policy-object-to-block-access-to-usb-storage-devices/


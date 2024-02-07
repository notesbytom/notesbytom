# Cisco ASA Transparent Mode

The Cisco ASA can be configured as a `routed` (default) or `transparent` mode device.

Many of the transparent-mode features are also available in routed mode. 
Because of this, **I recommend leaving the device in Routed mode** unless there is a specific transparent-mode feature you need that is NOT supported in routed-mode.

## Switching Firewall Modes

To switch between routed and transparent modes, the `firewall ...` command sequence is used.
To verify the current mode, use the `show firewall` command.
**A REBOOT is likely required for the new mode to take effect!**

**WARNING!!!! Changing the mode will DELETE LARGE PARTS OF YOUR DEVICE CONFIGURATION** including: aaa, local user accounts, hostname, interface configurations, etc.
* Because of this, **I recommend using ONLY routed firewall mode when possible** and NEVER changing modes!
  * Most of the transparent firewall features are available in routed mode.

## References

* [ASA General Operations CLI Configuration - Getting Started - Transparent or Routed Firewall Mode][1]

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa914/configuration/general/asa-914-general-config/intro-fw.html

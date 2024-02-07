# Cisco ASA Transparent Mode

The Cisco ASA can be configured as a `routed` (default) or `transparent` mode device.

Many of the transparent-mode features are also available in routed mode. 
Because of this, **I recommend leaving the device in Routed mode** unless there is a specific transparent-mode feature you need that is NOT supported in routed-mode.

## Switching Firewall Modes

To switch between routed and transparent modes, the `firewall transparent` or `no firewall transparent` command sequences.
To verify the current mode, use the `show firewall` command.
**The RUNNING CONFIGURATION WILL BE CLEARED when changing modes!!! 
You will LOSE IP-BASED ACCESS and the configuration will need to be rebuilt or restored from a backup!**

**WARNING!!!! Changing the mode will DELETE LARGE PARTS OF YOUR DEVICE CONFIGURATION** including: aaa, local user accounts, hostname, interface configurations, etc.
* Because of this, **I recommend using ONLY routed firewall mode when possible** and NEVER changing modes!
  * Most of the transparent firewall features are available in routed mode.
* [Cisco's Warning Note][1]: *"We recommend that you set the firewall mode before you perform any other configuration because changing the firewall mode clears the running configuration."*
 
## Unsupported Features in Routed Mode

Bridge Group Members canNOT be EtherChannel interfaces. EtherChannel = Link Aggregation (LAG) / Channel-Groups / Port-Channels.
* If you need a Bridge-Group with EtherChannel member interfaces, you need to use Transparent mode.
Bridge Groups in Multiple-Context Mode (Routed) are not supported.
* If you need Multiple Contexts with Bridge Groups, you will need to use Transparent Mode
* In Routed Mode, you must have only the Single Default/Only Context to use Bridge Groups

See the below Reference Document(s) for further detail on specific routed or transparent mode limitations.

## References

* [ASA General Operations CLI Configuration - Getting Started - Transparent or Routed Firewall Mode][1]

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa914/configuration/general/asa-914-general-config/intro-fw.html

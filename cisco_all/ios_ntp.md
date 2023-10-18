# NTP with Cisco IOS

## NTP VRF Configuration

If you want to communicate with NTP Servers over a VRF other than the global/default VRF, special configuration is required.
Here are some hints:

* Use the `ntp server vrf VRF_NAME 1.2.3.4` command pattern
  * Substitute a real vrf name like Mgmt-vrf for VRF_NAME
  * Substitute a real NTP Server IP for 1.2.3.4
* It may be tempting to specify the source-interface under `ntp server ...` command
  HOWEVER the VRF is not correctly learned from the source-interface!!!
  * You may use the standalone `ntp source INTERFACE_NAME` command.
  * BEWARE that you MUST ALSO specify the VRF on EVERY `ntp server vrf ...` line AS WELL!!!
   
The trouble can be seen if you use `terminal monitor` and `debug ntp all` where the NTP `src` is shown as 0.0.0.0 for outbound packets.
* Setting the correct VRF on your `ntp server vrf ...` lines should fix this.
* Another indicator of this type of error is if the server in `show ntp associations` is stuck in the .INIT. or .TIME. states.
 
It is surprisingly hard to find Cisco IOS Documentation / Examples for sending IOS Device NTP Traffic over a VRF!

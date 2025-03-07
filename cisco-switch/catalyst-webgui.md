# Cisco Catalyst Switch Web UI

Tech notes for the Web UI feature of Cisco Catalyst switches. Search keywords: Web GUI, dot1x.

## Attack Surface Area

The Web GUI increases the Switch Attach Surface Area by running additional services and accepting network connections. 
If the GUI is not needed, consider disabling it in your switch configuration.
The GUI can be temporarily enabled for use to limit the time the webgui services are running and accepting connections.
There are frequently announced security vulerabilities for the Web GUI feature.
Keep your switch software up-to-date for security fixes.
* Disable Non-Secure access to the Web UI: `no ip http server`
* Temporarily enable Secure access to the Web UI: `ip http secure-server`
* User accounts must be authenticated to privilege level 15 for full webui feature access.

## Missing Capabilities

There are many capabilities that seem to be missing from the webgui. Some on my list:
* View and Configure the Voice Vlan for an access port.
* View the access-session detail for a port to see the 802.1x/MAB authenticated user and device-tracking ip address.
* Customize 802.1x IBNS Policies to change the violation action between: err-disable, restrict, and protect.
* View and customize Interface configuration Templates.
  You can apply templates, but you cannot see the template definition or the derived-config when the template is applied.

There is a CLI feature in the webgui that can be used to make up for some of the missing features.

## Fast File Transfers for Updates

When updating the Switch Software, trasferring the update file(s) can take a long time over a WAN when using ssh/scp.
The Web GUI seems to be Much Faster for transferring update file(s) over a WAN.
Perhaps there is a difference in the control-plane-policing rate limits for ssh/scp vs http/https?

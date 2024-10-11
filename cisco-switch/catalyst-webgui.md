# Cisco Catalyst Switch Web GUI

Tech notes for the Web GUI feature of Cisco Catalyst switches.

## Attack Surface Area

The Web GUI increases the Switch Attach Surface Area by running additional services and accepting network connections. 
If the GUI is not needed, consider disabling it in your switch configuration.
The GUI can be temporarily enabled for use to limit the time the webgui services are running and accepting connections.
There are frequently announced security vulerabilities for the Web GUI feature.
Keep your switch software up-to-date for security fixes.

## Missing Capabilities

There are many capabilities that seem to be missing from the webgui. Some on my list:
* Configure the Voice Vlan for an access port.
* View the access-session detail for a port to see the authenticated user and device-tracking ip address.
* Customize 802.1x IBNS Policies to change the violation action between: err-disable, restrict, and protect.

There is a CLI feature in the webgui that can be used to make up for some of the missing features.

## Fast File Transfers for Updates

When updating the Switch Software, trasferring the update file(s) can take a long time over a WAN when using ssh/scp.
The Web GUI seems to be Much Faster for transferring update file(s) over a WAN.
Perhaps there is a difference in the control-plane-policing rate limits for ssh/scp vs http/https?

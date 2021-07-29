# Cisco ASA License Reservation

## ASA 2100 or 1100 Series

ASA software on Firepower 2100 and 1100 Series Chassis normally require Smart Licensing which requires direct 
communication from the licensed device to the Cisco Smart Licensing portal, or indirect communication
via a Smart Licensing Satellite (which has direct communicaiton to Cisco Smart Licensing portal or 
ability to transfer Smart Licensing telemetry files regularly.

To license completely offline, you will need to purchase a special Permanent License Reservation SKU which
Cisco Global Licensing can provide. This type of licensing requires special validation and approval by Cisco.

## Permanent License Reservation Commands

Here are some example commands for managing permanent license reservation on the device.

* `license smart reservation`
* `license smart reservation request universal`
  * Use Smart Licensing Manager Site with Request Code from ASA
* `license smart reservation install code`
* `show license all`
* `license smart`
  * `feature tier standard`
  * `feature context number`
* A REBOOT might be required to activate some features.
  
## Clock Time

For licensing it might be good to verify the time is correct first.

* `show clock`
* `set timezone America/New_York`
* `clock set HH:MM:SS Month DD Year`
* Use ntp if the system has access to a network time source

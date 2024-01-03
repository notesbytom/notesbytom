# Cisco ASA License Reservation

## Firepower ASA 1K 2K 3K 4K 9K Series

ASA software on Firepower 2100 and 1100 Series Chassis normally require Smart Licensing which requires direct 
communication from the licensed device to the Cisco Smart Licensing portal, or indirect communication
via a Smart Licensing Satellite (which has direct communicaiton to Cisco Smart Licensing portal or 
ability to transfer Smart Licensing telemetry files regularly.

To license completely offline, you will need to purchase a special Permanent License Reservation SKU which
Cisco Global Licensing Support can provide. 
This type of licensing requires special validation and approval by Cisco. 
SKU Pattern Examples: -PU-, or -BPU (PU is short for Permanent Universal). 
* [ASA General Operations CLI Configuration Guide][1] (Cisco Secure Firewall)
  * Search page for pattern "BPU" for Example SKU's
* `L-FPR1K-ASA-BPU=` (Firepower 1000 Series)
* `L-FPR2K-ASA-BPU=` (Firepower 2000 Series)
* `L-FPR3K-ASA-BPU=` (Firepower 3000 Series)
* `L-FPR4K-ASA-BPU=` (Firepower 4100 Series)
* `L-FPR4200-ASA-BPU=` (Firepower 4200 Series)
* `L-FPR9K-ASA-BPU=` (Firepower 9300 Series)

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
* A REBOOT (`reload`) might be required to activate some features.
  
## Clock Time

For licensing it might be good to verify the time is correct first.

* `show clock`
* `clock timezone US/Eastern`
  * Use tab completion to see timezone options such as `America/New_York`
* `clock set HH:MM:SS Month DD Year`
* Use ntp if the system has access to a network time source

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa920/configuration/general/asa-920-general-config/intro-license-smart.html

# Cisco Support

IT Tech Notes related to Cisco Support.

## Device Coverage Checker

Cisco has an online "Device Coverage Checker" tool. Enter your Cisco device Serial Number and the tool will show you the support or warranty coverage status of the device. The tool may also provide links to the End of Sale and End of Support announcements for your device.

* https://cway.cisco.com/sncheck/

## Device Serial Number

Devices may have more than one serial number. Here are some notes on which serial number may be tied to your support agreement and warranty.

* Cisco ASA 5508: "Chassis" serial number from `show inventory`
  * Ignore the serial number from ~`show version`~ or ~`show run`~ - this may be tied to software licensing, but appears to not be linked to the support agreement or warranty.

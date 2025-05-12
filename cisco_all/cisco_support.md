# Cisco Support

IT Tech Notes related to Cisco Support.

## Device Coverage Checker

Cisco has an online "Device Coverage Checker" tool. Enter your Cisco device Serial Number and the tool will show you the support or warranty coverage status of the device. The tool may also provide links to the End of Sale and End of Support announcements for your device.

* https://cway.cisco.com/sncheck/

## Device Serial Number

Devices may have more than one serial number. Here are some notes on which serial number may be tied to your support agreement and warranty.

* Cisco ASA 5508: "Chassis" serial number from `show inventory`
  * Ignore the serial number from ~`show version`~ or ~`show run`~ - this may be tied to software licensing, but appears to not be linked to the support agreement or warranty.

## End of Life

Notes for Cisco products End of Life.

* [ASA 5508 and 5516 EOL][1]
* [Firepower 2100 Series Security Appliances][2] (includes 2130)
  * New Service Attachment 27 May 2026. Service Renewal 22 Aug 2029. Support 31 May 2030.
 
## Bug Search Tool

* https://bst.cloudapps.cisco.com/bugsearch

[1]: https://www.cisco.com/c/en/us/products/collateral/security/asa-5500-series-next-generation-firewalls/eos-eol-notice-c51-744798.html
[2]: https://www.cisco.com/c/en/us/products/collateral/security/firepower-ngfw/firepower-2100-series-sec-app-5-yr-sub-eol.html

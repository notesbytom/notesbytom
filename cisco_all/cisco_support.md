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

| Hardware Model                 | Last Hardware Purchase | New Service Attachment | Service Renewal | Support        |
|--------------------------------|------------------------|------------------------|-----------------|----------------|
| [Firepower 21xx Firewall][2]   | 27 May 2025            | 27 May 2026            | 22 Aug 2029     | 31 May 2030    |
| [ASA 5508 + 5516 Firewall][1]  | 2 August 2021          | 2 August 2022          | 28 Oct 2025     | 31 Aug 2026    |
| [ASA 5525 + 5545 Firewall][4]  | 4 September 2020       | 4 September 2021       | 30 Nov 2024     | 30 Sept 2025   |

## Catalyst Switch In-Service Software Upgrade (ISSU)

* [Catalyst Switch - Tech Reference - ISSU][3] (Includes Release Support Matrix)
* [Perform ISSU on Catalyst 3850 and Catalyst 9000 Series Switches][5] (How-to Guide)

## Bug Search Tool

* https://bst.cloudapps.cisco.com/bugsearch

[1]: https://www.cisco.com/c/en/us/products/collateral/security/asa-5500-series-next-generation-firewalls/eos-eol-notice-c51-744798.html
[2]: https://www.cisco.com/c/en/us/products/collateral/security/firepower-ngfw/firepower-2100-series-sec-app-5-yr-sub-eol.html
[3]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst_standalones/b-in-service-software-upgrade-issu.html
[4]: https://www.cisco.com/c/en/us/products/collateral/security/asa-firepower-services/eos-eol-notice-c51-743545.html
[5]: https://www.cisco.com/c/en/us/support/docs/switches/catalyst-9500-series-switches/214406-in-service-software-upgrade-issu-on-ca.html

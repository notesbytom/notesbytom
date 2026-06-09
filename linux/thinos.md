# Dell ThinOS

ThinOS is an operating system for Dell Wyse Thin Clients.

## Documentation

* Dell ThinOS 10.x [App Builder User Guide][1]
  * Ubuntu/Debian Linux Packages can be Tried with App Builder
  * Appendix - Customer Installed (CI) application package details
    * These are Third Party Application Packages
* Dell ThinOS 10.x [Administrator Guide][2]
  * Wyse Management Suite (WMS) is for Central Management
  * Admin Policy Tool (APT) is for Local ThinOS Management
* Dell ThinOS 10.x [Migration Guide][3]
  * Appendix: Reference and licensing - ThinOS 10.x 2xxx application packages
    * These are Dell Provided Application Packages
* Dell [ThinOS Manuals + Documents][4]

## ThinOS 10.x Chrome Browser Citrix Portal / Store-Front Compatibility

For Manage Browser Global Settings - **Safe Browsing**
* It appears that _Enhanced OR Standard_ Safe Browsing _BLOCK the Citrix ICA file from downloading_
  * **Choose "No Protection"** to allow Citrix ICA File Downloads (to launch Virtual Desktops)
* The Safe Browsing feature appears to BREAK Modern Versions of Citrix Portal / Store-Front from launching Virtual Desktops
  via Dell ThinOS Thin Clients

For **Browser Shortcut Settings**
* The "**Launch VDI via Browser**" setting should be **Turned On**
* If this is Off, it appears to Break the ability to launch a Citrix Virtual Desktop from Chrome

[1]: https://www.dell.com/support/manuals/en-us/wyse-thinos-maintenance/app_builder_portal_ug/
[2]: https://www.dell.com/support/manuals/en-us/wyse-thinos-maintenance/thinos_10.x_ag/
[3]: https://www.dell.com/support/manuals/en-us/wyse-thinos-maintenance/thinos_10.x_mg/
[4]: https://www.dell.com/support/product-details/en-us/product/wyse-thinos-maintenance/resources/manuals

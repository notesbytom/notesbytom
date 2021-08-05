# Cisco Wireless Controller

## Saving the text configuration for reference

* https://notesbytom.wordpress.com/2013/03/22/quick-save-of-cisco-ios-running-config/

## Mobility Express (ME)

Some settings might only be accessible from the Web GUI in "Expert View".

### ME NTP Settings

* Management - Time
  * Defaults: 0.ciscome.pool.ntp.org, 1.ciscome.pool.ntp.org, 2.ciscome.pool.ntp.org ?
  * Status will show "In Sync" next to the server ME has decided to sync with.

### ME DNS Settings

* Advanced - Controller Tools
  * Defaults: Open DNS (208.67.220.220, 208.67.222.222)

## Retrieving Pre-Shared Key (PSK)

The encryption of WPA PSK is supposedly irreversible in the configuration. You can attempt to retrieve it from Windows if you have the profile saved there.

* https://community.cisco.com/t5/wireless/retrieve-wlan-password-from-wlc/td-p/1795272
* https://devblogs.microsoft.com/scripting/get-wireless-network-ssid-and-password-with-powershell/
  * This method uses `netsh` command

# Cisco Firepower Advanced Troubleshooting

## Advanced Troubleshooting File Download

* On FMC, relative URL `/ddd/#ATFileDownload;deviceId=0` (AT File Download)
* Accessible from Health Monitor - Select Device - Advanced Troubleshooting button.
* Files in `/var/common/` can be downloaded from here with the exact filename (case sensitive).

## locate and updatedb

Firepower 7.0 seems to have a compatibility issue with the `locate` database. This might only be an issue for upgrades from previous releases?
I am seeing the issue after an upgrade from FMC 6.4 to 7.0. I was able to resolve it with the following.

* Rename the directory /var/locatedb/ to something unused like /var/locatedb_old/
* Run `updatedb` as root or with sudo
* If the problem is fixed, you can delete the locatedb_old folder and old files in it.

This tool is not usually needed but is helpful during advanced troubleshooting tasks.

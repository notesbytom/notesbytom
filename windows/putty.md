# PuTTY

Tech Notes related to the SSH and Serial Console Terminal Program.

## Find Available Serial Ports

* `[System.IO.Ports.SerialPort]::GetPortNames()`
* `devmgmt.msc`
  * In Device Manager look under "Ports (COM...)"

## Downloading and Installing

In addition to the Installers, there are standalone programs and a zip bundle as well as a winget package.
* The installers and winget package require admin privilege provide a shared deployment for the machine
  * The installers and package are signed with Authenticode
* The standalone programs and zip bundle are for using directly (no install)
  * The standalone and zip items are signed with a gpg key

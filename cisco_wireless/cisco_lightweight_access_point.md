# Cisco Lightweight Access Point

## Priming an Access Point to talk to a Central Controller

You can automatically configure the access point IP and preferred controller(s) via DHCP. 
Alternatively you can use the hints here to configure the AP with a static IP and preferred-controller(s).

* Connect the AP Serial Console port to your computer (9600-8-1-N-N)
* Connect the Main PoE Ethernet Port on the AP to a powered port on your switch
* Login - if the AP has factory defaults you can web-search for the default credentials
* Temporarily turn off logging: `logging console disable`
* Configure a Static IP: `capwap ap ip 1.2.3.4 255.255.255.0 1.2.3.1`
  * Verify with `show capwap ip config`
* Configure the SwitchPort for the matching access vlan
* Verify connectivity from AP to the controller with `ping a.b.c.d`
* Configure a Controller IP: `capwap ap primary-base 4.3.2.1`
* Turn logging back on: `logging console` 

## If your AP is Mobility Express or Previously Configured

* In Mobility Express, go to Wireless Settings - Access Points
  * Select the AP you want to migrate and choose "Convert to CAPWAP
  * Wait for the AP to load the CAPWAP image and refresh the Mobility Express to see AP Type of "CAPWAP"
* Login to the AP using Serial Console and erase the capwap config
  * `capwap ap erase all`
* After the AP reboots, it should have factory defaults and be ready to prime using steps above.

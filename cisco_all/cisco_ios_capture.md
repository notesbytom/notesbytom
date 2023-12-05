# Cisco IOS Capture

Example: `monitor capture cap_14 buffer circular size 2 int gig1/0/14 both match any start`

## Disabled Interfaces

It appears that we can't start a capture on a Disabled/Shutdown Interface! The interface must be Enabled (No Shutdown) to start the capture.

## View Status of Capture Buffer

Example: `show monitor capture cap_14 buffer`

## View List of Captured Packets

Example: `show monitor capture cap_14 buffer brief`

## Export the Capture to a File

Example: `monitor capture cap_14 export flash:/cap_14.pcap`

## References

* [Configure and Capture Embedded Packet on Software][1] (Cisco IOS)

[1]: https://www.cisco.com/c/en/us/support/docs/ios-nx-os-software/ios-embedded-packet-capture/116045-productconfig-epc-00.html

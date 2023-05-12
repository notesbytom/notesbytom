# Aruba Switch Notes

ProCurve / ProVision / HPE Network Switches

## Software Updates

Download Software Updates from the Aruba Support Portal.
* https://asp.arubanetworks.com/downloads

## Spanning Tree

The 2530 Switch Series (and likely others) supports Rapid Per-Vlan Spanning Tree (RPVST) which should be compatible with the same feature on current Cisco Catalyst switches. In a hybrid network - it would be a good idea to use this spanning-tree mode for better interoperability.

References:
* [Aruba 2530 Switch Series - Document List][1]
* Aruba 2530 Switch Series - QuickSpecs
  * Feature Listed: *Rapid Per-VLAN Spanning Tree (RPVST+)*
* Aruba 2530 Advanced Traffic Management Guide for ArubaOS-Switch
  * *Chapter 9 Rapid per-VLAN spanning tree (RPVST+) operation*

## BPDU Filtering

If we have compatibility issues with other-brand switch STP implementation, we can use bpdu filtering on the trunk between them. 
Beware that you don't create loops because this disables STP on the specified ports.

* https://techhub.hpe.com/eginfolib/networking/docs/switches/YA-YB/15-18/5998-8157_yayb_2530_atmg/content/ch04s05.html
* `spanning-tree [<port-list> | all ] bpdu-filter`

## SNMP Configuration

* Force SNMP Response source-ip to be same as destination of the requester
  * `snmp-server response-source  dst-ip-of-request`
  * This was helpful for MRTG and likely other network monitoring tools
  * See "HP Switch Software Management and Configuration Guide" (MCG)
    * Chapter "Configuring for Network Management Applications"
      * Section "... SNMP ..."
      * https://techhub.hpe.com/eginfolib/networking/docs/switches/K-KA-KB/15-18/5998-8160_ssw_mcg/content/ch06s10.html
      * https://techhub.hpe.com/eginfolib/networking/docs/switches/WB/15-18/5998-8162_wb_2920_mcg/content/ch06.html

[1]: https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c04408237

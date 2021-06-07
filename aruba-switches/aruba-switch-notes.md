# Aruba Switch Notes

ProCurve / ProVision / HPE Network Switches

## BPDU Filtering

If we have compatibility issues with other-brand switch STP implementation, we can use bpdu filtering on the trunk between them. 
Beware that you don't create loops because this disables STP on the specified ports.

* https://techhub.hpe.com/eginfolib/networking/docs/switches/YA-YB/15-18/5998-8157_yayb_2530_atmg/content/ch04s05.html
* `spanning-tree [<port-list> | all ] bpdu-filter`


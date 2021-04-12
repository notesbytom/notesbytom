# Cisco ASA Top Talkers

The `byte` statistics are likely the most useful regarding traffic utilization impact. The ASDM GUI has nice displays for this information.

## Top Talkers by Port

* `show threat-detection stat top port-protocol`
* Additional detail by port.
  * `show threat-detection statistics port | include tot-ses:|byte:`

## Top Talkers by Host

* `show threat-detection stat top host`
* Additional detail by host.
  * `show threat-detection statistics host 1.2.3.4`

## Enabling Top Talker Statistics

These statistics are off by default but they can be enabled easily. Here are some of the commands used from the CLI. This can also be done through the GUI.

* `threat-detection statistics host`
* `threat-detection statistics port`
* `threat-detection statistics protocol`

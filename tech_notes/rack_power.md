# Rack Power

## NEMA Sockets and Plugs

For rack power, we often see Non-locking 5-15P/R, 5-20P/R and Twist-Locking L5-20R/P, L5-30R/P, L6-20R/P, L6-30R/P. The twist-lock connectors are usually input for an UPS or PDU. 
Ironically, the "locking" connectors don't actually lock - they just resist unplugging when twisted to the "locked" position. The twisting motion is unrestrained, and the plug can easily untwist with a light touch.

* https://en.wikipedia.org/wiki/NEMA_connector#Nomenclature

## IEC Appliance Couplers

Female and Male power connectors. For Rack Power, we often see C13/C14, C15/C16, and C19/C20.

* https://en.wikipedia.org/wiki/IEC_60320#Appliance_couplers
* Odd-Numbered codes are female connectors like C13, C15, C19.
  * The PDU connectors are normally female like C13. These supply power.
    * The cord connecting to PDU would then be C14 in this case.
* Even-Numbered codes are male connectors like C14, C16, C19.
  * The Power Supply (PSU) connectors are normally male like C14. These consume power.
    * The metal prongs are exposed in these male connectors.
    * The cord connecting to PSU would then be C13 in this case.
   
## Notched Connectors

Higher-wattage power supplies often have notched connectors like C16. This may be to prevent the connection of lower-amperage C13 power-cords.

If your power-supply has notched C16 (male) connector, your power cable will need a notched C15 (female) connector.

If you have a **208v** or 240v high-power PDU, the most **common power cord** needed in this case would be **C14 to C15**. The PDU connector would be C13 in this case. 
This should support at least 10+A ~2000W for 208v. While the International Standard allows up to 10 Amps, [North America allows up to 15A][1] in this case ~3000W for 208v - 
check markings on your power cable for the max amperage which is related to [wire gauge][2] (thickness) and distance.

If you have a lower power 120v PDU - the PDU-side might be NEMA 5-20R for up to 20A ~2000W or NEMA 5-15R for up to 15A ~1500W

## 208 Volt AC Power

When we use 208 Volt AC power in an equipment rack, we are able to get **almost twice the wattage** for the **same amount of current** (amps). 
This **reduces heat** on power cabling which helps **reduce cooling needs** and **reduces fire risk** as well.

208 Volt AC Power is created by delivering TWO HOTS to our AC power supply. Each hot supply wire is from a different phase (leg) of a Three-Phase 120 Volt AC power source.

The equipment using the power "sees" the difference in potential (voltage) between the two legs. These legs are out of phase with each other by 120 degrees or (2/3)*PI radians.

Here are PowerShell formulas to **calculate the two-leg difference in potential**: 
* `2*120*[Math]::Sin([Math]::PI/3)`
  * [Circular Segment][3] Chord Length where Radius = 120 Volts and Angle Theta = (1/3) x 2 x PI radians = 120 Degrees
* `2*120*[Math]::Cos([Math]::PI/6)`
  * Looking at the Triangles a different way for same answer. 180 Degrees - 120 Degrees / 2 = 30 Degrees = PI/6 radians

This gives a result of `207.846096908265` or ~ 208 Volts AC.

## Glossary

* PSU = Power Supply Unit
* PDU = Power Distribution Unit (rack-mount power strip)
* UPS = Uninterruptible Power Supply (battery back-up unit)

[1]: https://en.wikipedia.org/wiki/IEC_60320#North_American_ratings
[2]: https://en.wikipedia.org/wiki/American_wire_gauge
[3]: https://en.wikipedia.org/wiki/Circular_segment

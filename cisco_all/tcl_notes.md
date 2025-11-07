# TCL Notes

The Tool Command Language (TCL) is bundled with Cisco IOS-XE Routers and Switches. 
It is useful for automating things on the IOS-XE Command Line Interface (CLI).

## Decimal Binary Conversions

When working with IP Addresses it may be useful to convert between decimal and binary string representations of numbers.
Following some conventions similar to C functions `sprintf` (string print formatted) and `sscanf` (string scan formatted).

```
$ tclsh
% scan 11110000 %llb
240
% format %llb 240
11110000
```

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

See [Binary representation of numbers][1] (wiki.tcl-lang.org) for an explanation that using `%ll` (long long) should prevent 
nonsense values which might happen when truncating large or negative values. In this case `%ll` means No Truncation.

## Powers of Two

Another useful thing for IP Address work is powers of two. Those can be done with the TCL `pow(x,y)` math function.

```
% exp pow(2,4)
16.0
% exp pow(2,8)
256.0
```

## TCL Version

The version of TCL running can be shown with `puts $tcl_version`

## Command Reference

* [format][2] (string formatting)
* [expr][3] (math operations)
  * [mathfunc][4] Mathematical functions for Tcl expressions
 
[1]: https://wiki.tcl-lang.org/page/Binary+representation+of+numbers
[2]: https://www.tcl-lang.org/man/tcl9.0.2/TclCmd/format.html
[3]: https://www.tcl-lang.org/man/tcl9.0.2/TclCmd/expr.html
[4]: https://www.tcl-lang.org/man/tcl9.0.2/TclCmd/mathfunc.html

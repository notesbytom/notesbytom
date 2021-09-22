# IP Address Conversion

Using PowerShell to Convert and work with IP Address Objects.

## IPv4 Address to Int64

You can convert an IPv4 Address Object in DotNet into an Int64/long. These IPAddress Objects are properties of Windows DNS Server Resource Records.

`[ipaddress]::NetworkToHostOrder(([ipaddress]"4.3.2.1").Address -shl 16) -shr 16`

This is tricky because the `IPAddress.Address` is stored in network-byte-order (big endian).
Since it is a signed long, the address is in the lower four bytes.
If we do network-to-host without shifting, the first byte will be in the sign position (unwanted).
By shifting left by 16 bits, the ipv4 address is now in the "middle" four bytes of the 8-byte long.
When we swap the byte order they are still in the middle bytes, just reversed (little endian).
Now we finish by shifting back to the right by 16 bits (two bytes) so that they are in the lowest bytes where we want them!

Note that the IPAddress.Address property is deprecated because it is too small for ipv6 address.
For compatibility with ipv6, code should use IPAddress.GetAddressBytes()

Here's an example using the `BitConverter`. It takes three statements rather than one. 
*This pattern can be altered to support IPv6 with BigInteger.*

`$bytes = [IPAddress]::Parse("4.3.2.1").getAddressBytes(); [Array]::Reverse($bytes); [BitConverter]::ToUInt32($bytes,0)`

## Greater Than Less Than Comparisons

The reason we want an integer representation is to do greater-than or less-than comparisons for sorting and filtering!

## Array Comparisons

It is also possible to compare two arrays structurally in PowerShell using something like the following.

`(1,2,3).CompareTo((3,2,1),[System.Collections.StructuralComparisons]::StructuralComparer)`

This returns `-gt 0`, `-eq 0`, or `-lt 0` for greater-than, equal, or less-than respectively.

# Cisco ASA Capture

In version 9.9(1): *"Support for capturing [...] decrypted packets. New options were added: [...] `include-decrypted`."*

This should be useful for capturing traffic on the encrypted side of the ASA inside of an IPsec tunnel?
The documentation for this feature doesn't make it clear if this is only for traffic between ASA cluster units?
Hopefully it is for any crypto-map based tunnel traffic.
Capturing VTI tunnel traffic might work by just specifying the VTI interface name for capture?

This feature should work on the following older model ASA hardware (in addition to newer models).
* ASA 5512 supports up to version 9.12.x
* ASA 5525 supports up to version 9.14.x
* ASA 5506,5508,5516 support up to version 9.16.x

## References

* Cisco Secure Firewall [ASA Series Command Reference, A-H Commands: Chapter: ca - cld][1]
  * Jump to the section for the `capture` command - or search page for `include-decrypted`
* Feature announcement: Cisco Secure Firewall [ASA New Features by Release][2]
  * Search page for `include-decrypted`

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa-cli-reference/A-H/asa-command-ref-A-H/ca-cld-commands.html#wp2435483314
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/roadmap/asa_new_features.html

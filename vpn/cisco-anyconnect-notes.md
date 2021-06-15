# Cisco AnyConnect Notes

## Profile Configuration

On Windows, the Profile Configuration XML files are stored under `"$env:ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\"`.

## Double Authentication (aaa and certificate)

* https://www.cisco.com/c/en/us/support/docs/security/anyconnect-secure-mobility-client/116111-11611-config-double-authen-00.html
* Going to the ASA in browser gives 403 forbidden in this scenario (expected)
* Connect directly from AnyConnect client to test double-auth
* `tunnel-group T-G-NAME webvpn-attributes`
  * `authentication aaa certificate`

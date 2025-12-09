# Cisco ASA User Management

## Password Policies

Password Policies can be used for user accounts in the local-user database on the ASA. Certain password policies will require the user to change the password after it has been set by an admin.

* [`change-password`][1]
  * Use this command to change the password for the logged-in user
  * This is the REQUIRED method to change the password when certain password policies are enabled.

 ## Testing and Lessons Learned

 Password Expiration
 * If Password Expiration is enabled and a password expires, the user will Not be able to login using SSH or ASDM/HTTPS
   * Only the Serial Console login will work when a user password is expired!
   * If the device is remote and you don't have serial console access, you will be unable to manage the device.

## SSH X.509 User Certificates

As of [Late 2025, the latest ASA software adds support for RFC 6187 X.509 Certificate Authentication with SSH][7].

[RFC 6187 X.509 Certificates for SSH Authentication][4]. 

Free or Open Source SSH Clients
* [PKIX-SSH / pkixssh][12] by Roumen Petrov (Bulgaria) supports RFC 6187.
  * Source Code at https://gitlab.com/secsh/pkixssh
  * Are Linux Distributions shipping packages for this?
* Unfortunately it appears that [OpenSSH does Not support this][5]
  * There is a source code file `ssh-pkcs11.c` in OpenSSH which includes a function `pkcs11_fetch_x509_pubkey`.
    * This has further dependencies including `openssl/x509.h` and `openssl/x509v3.h`.
    * It is not clear if this is part of some work to support RFC 6187 or for another unrelated purpose.
* It also appears that [PuTTY does Not support this][6]


Some Paid SSH Clients appear to support RFC 6187:
* [Pragma Fortress SSH Client][8]
* [VanDyke SecureCRT Client][9]

See Also [Configuring Certificate Authentication for SSH on Cisco IOS XE Devices][10]. 
The document is for a different operating system (IOS-XE), but still useful reading for Cisco ASA users.

## Radius and AAA Notes

* ASA General CLI Guide - System Administration - [Management Access][2]
* ASA General CLI Guide - AAA - [RADIUS Servers for AAA][3]

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa-cli-reference/A-H/asa-command-ref-A-H/ca-cld-commands.html
[2]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa920/configuration/general/asa-920-general-config/admin-management.html
[3]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa920/configuration/general/asa-920-general-config/aaa-radius.html
[4]: https://datatracker.ietf.org/doc/html/rfc6187
[5]: https://security.stackexchange.com/questions/30396/how-to-set-up-openssh-to-use-x509-pki-for-authentication
[6]: https://community.cisco.com/t5/network-management/ios-ssh-configuration-for-pki-login-putty-still-wants-to-use-ssh/td-p/4047741
[7]: https://www.cisco.com/c/en/us/td/docs/security/asa/roadmap/asa_new_features.html
[8]: https://www.pragmasys.com/support-cisco-2-factor
[9]: https://www.vandyke.com/support/tips/configure-securecrt-securefx-for-2fa-rfc-6187-smartcard-authentication.html
[10]: https://www.cisco.com/c/en/us/support/docs/security-vpn/secure-shell-ssh/223290-configuring-certificate-authentication.html
[11]: https://github.com/openssh/openssh-portable/blob/master/ssh-pkcs11.c
[12]: https://roumenpetrov.info/secsh/

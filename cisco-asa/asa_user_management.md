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
  
[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa-cli-reference/A-H/asa-command-ref-A-H/ca-cld-commands.html

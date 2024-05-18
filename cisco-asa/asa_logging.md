# Cisco ASA Logging

Tech Notes for Cisco ASA Firewall Logging Configuration.

## Reducing Log Noise

Firewalls can generate an excessively large amount of log messages. It is valuable to be able to reduce unimportant noise messages so that interesting log events are more easy to spot. Here are some hints to reduce the quantity and improve the quality of your ASA logging.
* Find useless messages in your log and determine if the config can be improved to reduce or eliminate these.
* Noisy log messages often highlight areas for improvement in your ASA configuration.
* A common source of useless logs is outside systems probing common ports on the ASA management control-plane
  * Use [Control-Plane Access-Control Policy][4] to deny and no-log this useless probing.
  * Example: Deny http, https, ssh, and telnet on the outside interface except for specific sources where needed.
  * `control-plane` management access-lists have a `log disable` option you can append to any ACL entry.
  * Important: The implicit deny does NOT apply to control-plane ACLs. This allows control-plane commands like `ssh ...` and `http ...` to be evaluated if there are no matches from the control-plane ACL.
  * In the ASDM GUI, this feature is called Management Access Control.
* If a noisy log message indicates something is broken, try to fix it!

## References / Further Reading

* [ASA General Operations CLI Configuration - Monitoring - Logging][1]
* [Configure ASA Syslog][2]
* [Cisco Secure Firewall ASA Series Syslog Messages][3]

[1]: https://www.cisco.com/c/en/us/td/docs/security/asa/asa914/configuration/general/asa-914-general-config/monitor-syslog.html
[2]: https://www.cisco.com/c/en/us/support/docs/security/pix-500-series-security-appliances/63884-config-asa-00.html
[3]: https://www.cisco.com/c/en/us/td/docs/security/asa/syslog/b_syslog/about.html
[4]: https://www.cisco.com/c/en/us/support/docs/security/secure-firewall-threat-defense/221457-configure-control-plane-access-control-p.html

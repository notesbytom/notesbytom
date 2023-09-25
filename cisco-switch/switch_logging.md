# Cisco Switch Logging

The `archive` with `log config` settings can be very useful to track and blame configuration changes.

* Review archive log config changes with `show archive log config ...`

An archive of recent configuration revisions can be maintained with `archive` configuration mode.

* See my notes named "[switch_config_archive.md][3]"

Persistent logging is configured with commands like `logging buffered` and `logging persistent ...`

* Verify logging config with `show logging`

## Logging Discriminator

If there are specific log messages that should be skipped and not logged. I believe the `logging discriminator` and corresponding `logging buffered discriminator` could be used.

* [Cisco IOS Embedded Syslog Manager Command Reference][4]

This is not to be confused with the `logging filter` and associated commands which are much more advanced and require TCL scripts.

Log Message Format Example: `seq no:timestamp: %facility-severity-MNEMONIC:description`.

* [System Message Logging][5]

We can change the timestamp format using commands like: `service timestamps log datetime [localtime] [msec] [show-timezone]`.

## Terminal Monitor

Use the `terminal monitor` command to view logging output during an SSH session. 
You can verify if this is on using the `show terminal` command.

* `Capabilities: Receives Logging Output`
  * This indicates that the Terminal has the logging `monitor` enabled.

## References

* [Configuration Change Notification and Logging][2]
* [Configure Persistent Logging on Cisco IOS Platforms][1]

[1]: https://www.cisco.com/c/en/us/support/docs/voice/telephony-signaling/212102-Configure-Persistent-Logging-on-Cisco-IO.html
[2]: https://www.cisco.com/c/en/us/td/docs/ios/ios_xe/fundamentals/configuration/guide/2_xe/cf_xe_book/cf_config-logger_xe.html
[3]: ./switch_config_archive.md
[4]: https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/esm/command/esm-cr-book/esm-cr-a1.html
[5]: https://www.cisco.com/c/en/us/td/docs/routers/access/wireless/software/guide/SysMsgLogging.html

# Cisco Switch Config Archive

Keeping an Archive of recent configurations with rollback capabilities.

## Commands

* Enter archive configuration mode: `archive`
  * Path pattern example: `path flash:/archive_config` 
  * Number of archive configs to keep: `maximum 14`
  * Save archive config automatically during write-mem: `write-memory`
* Archive filename date/time pattern is based on Log Timestamps Service config:
  * `service timestamps log datetime msec localtime show-timezone year`
* `archive config`
  * Archive the current running config.
* `configure replace ...`
  * Rollback to an archived configuration (could even be the startup config).
* Advanced commands for timed rollback
  * `configure revert`
    * Restore previous running config if within timed rollback window.
  * `configure confirm`
    * Keep `configure replace ...` changes and cancel timed rollback window.
   
 ## Verification

 * `show archive`
   * List all config revisions in the archive
 * `show archive config differences ...`
   * This is used by `configure replace` to restore a given config.

## References:

* [Configuration Replace and Configuration Rollback][1] (IOS XE)

[1]: https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9500/software/release/17-7/configuration_guide/sys_mgmt/b_177_sys_mgmt_9500_cg/configuration_replace_and_configuration_rollback.html

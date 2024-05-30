# Multi Router Traffic Grapher (MRTG)

## CentOS 8 Stream MRTG Install Notes

This also applies to Red Hat Enterprise Linux 8 and other similar Linux distributions

```bash
# Install the necessary packages
dnf install httpd
dnf install mod_ssl
dnf install mrtg

# Save a copy of the factory default mrtg.cfg for reference
cp /etc/mrtg/mrtg.cfg /etc/mrtg/factory_mrtg.cfg

# Use `cfgmaker` to generate /etc/mrtg/mrtg.cfg
# Copy over the top items from the factory_mrtg.cfg saved ealier
# Especially: HtmlDir, ImageDir, LogDir, and ThreshDir
# Comment out any WorkDir because it would override some of the RHEL/CentOS MRTG paths

# Edit /etc/mrtg/mrtg.cfg to customize the config including: ...
# RunAsDaemon: Yes
# NoDetach:     Yes
# This will make it compatible with the default systemd `mrtg` unit file

# Use `indexmaker` to generate /var/www/mrtg/index.html
indexmaker --output=/var/www/mrtg/index.html --Title=Multi_Router_Traffic_Grapher /etc/mrtg/mrtg.cfg

# Enable the systemd `mrtg` unit to start when the system boots-up ... and start it now
systemctl enable mrtg
systemctl start mrtg
systemctl enable httpd
systemctl start httpd

# By default, the MRTG web folder will be blocked to outside users
# Edit the httpd mrtg-specific config file if allowing non-loopback web access
# Use `firewall-cmd` to `--add-service=https` or similar (both `--permanent` and runtime)
```

## Adding Items to the MRTG Configuration

* Use `cfgmaker` to generate an isolated sample configuration against your target device.
* **Backup** a copy of the active **MRTG configuration**
* Copy the New Target Items from the sample config into your active MRTG configuration file
* Use `mrtg --check /etc/mrtg/mrtg.cfg` to validate your config file syntax
* Use `systemctl restart mrtg` to start monitoring the new items with MRTG

## Time Synchronization (chrony)

It is important to have time syncrhonized to a reliable source on your network monitoring system.
Here are some notes (hints) for time synchronization with CentOS Stream 8.

Modern CentOS/RHEL ship with the `chrony` NTP service for clock network synchronization.
The default [configuration `/etc/chrony.conf`][1] uses something like `pool pool.ntp.org iburst`.
If you are on an air-gapped / isolated network, you can specify your own NTP servers - 
simply comment out the default pool and add lines like `server srv.fq.dn iburst`
(substitute your real server name or ip address for "srv.fq.dn").
Restart the chrony service with `systemctl restart chronyd` to reload the configuration.
Verify with `chronyc sources`.

Verify the **Time Zone** is set to your desired value with `timedatectl`:
* `timedatectl list-timezones`
* `timedatectl set-timezone ...`
* View current settings without arguments: `timedatectl`
* RHEL 7 Sys Admin Guide - [Configuring Date and Time][2]
* [timedatectl][3] manual page

[1]: https://www.redhat.com/sysadmin/chrony-time-services-linux
[2]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-configuring_the_date_and_time
[3]: https://www.freedesktop.org/software/systemd/man/latest/timedatectl.html

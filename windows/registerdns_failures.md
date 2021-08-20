# Windows Dynamic DNS Registration Fails

## Related Issue - Azure Information Protection Conditional Access

I believe that the Azure Information Protection Conditional-Access machine registration / access token was being partially reset on every reboot of these impacted systems due to the behavior mimicking a computer name-change / domain-join operation.

## Dynamic DNS Registration Overview

During normal operation a computer will automatically register its DNS record(s) at boot, on a regular refresh interval, and any time the computer IP Address changes. 

If a computer has more than one IP Address (like wifi and wired), the dynamic dns registration results may be unreliable.

Active-Directory integrated DNS records replicate with the rest of the LDAP directory partitions. New or changed records will take the replication interval before they resolve in other sites or domain-controllers.

Recent versions of Windows also dynamically register reverse-dns IP-to-Name records when possible. These reverse records are Highly Unreliable because a reverse record created by one computer will be "owned" by the first computer with that reverse-record. Other computers using an ip-address previously registered by another computer will be unable to delete or change the reverse-record because the record is "owned" by the previous computer. DNS Stale-Record Scavenging can be enabled if desired to attempt to clear out old inaccurate reverse-dns records but BEWARE that some dynamically-registered server dns-records may be automatically-deleted in the process of scavenging stale client reverse-dns records. BACKUP a copy of all dns-records to CSV using powershell BEFORE enabling DNS Stale-Record Scavenging to have a record of any reverse entries to add back as static for servers.

## Test Commands with Error Messages

Command-prompt and PowerShell test commands with associated error messages and comments. These commands require UAC Privilege Elevation (run-as-administrator).

* `ipconfig /registerdns`
  * ERROR: `Registration of DNS records failed: The service has not been started.`
  * Review of the `dnscache` (DNS Client) service shows that it is running.
  * The error message was inaccurate in our case.
* `Register-DnsClient -Verbose`
  * ERROR: `A general error occurred that is not covered by a more specific error code.`
  * Attempts to enable logging on the DNS Client in Event Viewer failed to show the cause for our environment.

## Pending Computer-Name Change or Domain Join

In our environment the cause of this issue was a pending computer-name change or domain join which normally would just require a system reboot to resolve.

Unfortunately, in our environment a team-member had created a desired-state-configuration to automate domain-join 
to our old-domain which was triggered by a scheduled task during every startup or user logon. 
The legacy-doman join was failing, but the system was still acting as if a name-change or domain-join was in-process and pending-reboot.

In order to resolve the issue we were able to disable or unregister the scheduled task and remove the DSC (no longer needed).

## Disabling or Removing a Problem Scheduled Task

Commands to review and disable or remove a named scheduled task with comments.

* `Get-ScheduledTask -TaskName 'YourProblemTaskName' -Verbose`
  * This will fail if a task with the matching name is missing.
* `Get-ScheduledTask -TaskPath '\'`
  * List all root-level scheduled tasks for the computer
* `(Get-ScheduledTask -TaskPath '\' | Where TaskName -eq 'YourProblemTaskName') -ne $null`
  * Returns `$true` if the TaskName is present
  * Returns `$false` if the TaskName is missing
* `Disable-ScheduledTask -TaskName 'YourProblemTaskName' -Verbose`
  * Disable the named scheduled task (without deleting)
* `Unregister-ScheduledTask -TaskName 'YourProblemTaskName' -Confirm:$false -Verbose`
  * Remove the named scheduled task (delete)

## Remove Desired State Configuration (DSC)

Commands to review and remove desired state configuration document(s) with comments.

* BACKUP a copy of the system DSC configuration directory `"$env:SystemRoot\System32\Configuration"`
  * This is just in case you need to restore something from the old DSC later.
* `Remove-DscConfigurationDocument -Stage Current -Verbose`
  * Removes the `Current` DSC configuration. You can also specify `Previous` or `Pending` for -Stage.
* `Get-DscConfigurationStatus`
  * This will return `$null` if the DscConfigurationDocument(s) have been removed.

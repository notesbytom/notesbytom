# Windows Dynamic DNS Registration Fails

## Test Commands with Error Messages

Command-prompt and PowerShell test commands with associated error messages and comments.

* `ipconfig /registerdns`
  * ERROR: `Registration of DNS records failed: The service has not been started.`
  * Review of the `dnscache` (DNS Client) service shows that it is running.
  * The error message was inaccurate in our case.
* `Register-DnsClient -Verbose`
  * ERROR: `A general error occurred that is not covered by a more specific error code.`
  * Attempts to enable logging on the DNS Client in Event Viewer failed to show the cause for our environment.

## Pending Computer-Name Change or Domain Join

In our environment the cause of this issue was a pending computer-name change or domain join which normally would just require a system reboot to resolve.

Unfortunately, in our environment a team-member had created a desired-state-configuration to automate domain-join to our old-domain which was triggered by a scheduled task
during every startup or user logon. 

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

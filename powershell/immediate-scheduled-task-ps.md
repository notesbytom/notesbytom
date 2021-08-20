# Group Policy Immedate Scheduled Task Inline PowerShell

You can use Group Policy Preferences to create an "Immediate" scheduled task to run Inline PowerShell code.
This works for Domain GPO's only, GPO Preferences are not available in Local GPO's.

* Collapse your powershell down to one-line and run with: powershell -command "& {...}"
* `powershell -command "& {command1; command2; ...}"`
  * Command: `powershell`
  * Arguments: `-command "& {command1; command2; ...}"`
* Watch out for quoting and escaping, convert internal quotes to single
* Because this will run immediately when a computer updates policy, consider testing for the need to do an action 
  rather than blindly performing an action which will be run repeatedly (every time policy is refreshed).
  * `if (condition) { then; commands; }`

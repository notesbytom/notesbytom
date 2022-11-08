# Avaya IP Office Phone System

Phone system tech notes.

## Login Code for Voicemail Only

If a user is created for voicemail-only, there might not be any extension (phone port) assigned to the user.

Warning (error) message: `avaya extension ???? doesn't exist or user doesn't have a login code set.`

Possible workaround: Configure the **User - Telephony - Supervisor Settings - Login Code**. This should make the system happy with a user without an assigned Extension.

See related forum discussion https://www.tek-tips.com/viewthread.cfm?qid=1721279

## Phone Login and Logout

Short Codes:

* Login: `*35*N*P#`
  * Login to a phone using your extension number (N) and login code (P). 
* Log Out: `*36`
  * Log yourself out from the phone where you are currently logged in.

Snippet from https://ipofficekb.avaya.com/businesspartner/ipoffice/user/1608/short_codes.htm

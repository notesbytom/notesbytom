# Avaya IP Office Phone System

Phone system tech notes.

## Login Code for Voicemail Only

If a user is created for voicemail-only, there might not be any extension (phone port) assigned to the user.

Warning (error) message: `avaya extension ???? doesn't exist or user doesn't have a login code set.`

Possible workaround: Configure the **User - Telephony - Supervisor Settings - Login Code**. This should make the system happy with a user without an assigned Extension.

See related forum discussion https://www.tek-tips.com/viewthread.cfm?qid=1721279

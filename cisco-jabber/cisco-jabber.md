# Cisco Jabber

## Ports and Protocols

* [Planning Guide for Cisco Jabber 14.0 - Requirements][1]
  * Network Requirements - Ports and Protocols
  * Includes a detailed list of ports used by Cisco Jabber

## Screen Share

* [Planning Guide for Cisco Jabber 14.0 - Screen Share ][2]
  * Confusing due to multiple types.
  * Four types of screen share:
    * Cisco Webex share
      * For cloud deployments, Webex Screen Share is selected automatically after choosing a contact, if BFCP and IM Only screen share options are not available.
    * BFCP share
      * Remote screen control is not supported with BFCP
      * Video desktop sharing using BFCP is not supported if Trusted Relay Point or Media Termination Point are enabled on the software phone device. 
      * In Jabber for Windows, the Screen Share button starts a BFCP screen share by default. If BFCP-based sharing is unavailable, the button starts an IM-only screen share if possible.
    * IM Only share
      * One-to-one client-to-client screen share over Remote Desktop Protocol (RDP). 
      * Allowed via the EnableP2PDesktopShare parameter
      * IM-only screen share default port range is 49152–65535 TCP and UDP
    * Escalate to a meeting and share
      * Use Webex instead of Jabber Screen Sharing

[1]: https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/jabber/14_0/cjab_b_planning-guide-cisco-jabber-14_0/cjab_b_planning-guide-cisco-jabber-129_chapter_01010.html
[2]: https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/jabber/14_0/cjab_b_planning-guide-cisco-jabber-14_0/cjab_b_planning-guide-cisco-jabber-129_chapter_01000.html

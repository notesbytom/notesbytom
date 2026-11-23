# TACACS+ Notes

For Network Device Administrative Management access sessions, 
TACACS+ is a popular choice - especially for command authorization features which seem to be lacking in RADIUS.

## Commercially Available Server Software

* Cisco Identity Services Engine (ISE)
* Sadly the Microsoft NPS RADIUS Server does NOT provide any TACACS+ functionality.

## Open Source Software

There are several TACACS+ open source projects. Here are some for review. Binaries may be lacking so these are likely built directly from source code.

* TAC_PLUS-NG by Marc Huber
  * [tac_plus-ng source code][1]
  * [TACACS+ NG documentation][2]
* TACACS+ daemon (tac_plus) by John Heasley of shrubbery.net
  * [TACACS+ daemon][3] Tool overview page
  * [tac_plus download][4] Source Code bundle
  * This is used by Cisco Modeling Labs (CML) for [lightweight TACACS+ container testing][6]
  * Ubuntu [manual page for this `tac_plus` distribution][7] (as of 18.04 LTS "bionic")
* [Tacquito RFC8907 TACACS+][5] Meta reference implementation (in Go)

## Acronyms and Definitions

* Terminal Access Controller Access-Control System Plus (TACACS+)
* Modular Attribute-Value Interchange System (MAVIS)
  * This may be specific to the Marc Huber NG implementation.

[1]: https://github.com/MarcJHuber/event-driven-servers
[2]: https://projects.pro-bono-publico.de/event-driven-servers/doc/tac_plus-ng.html
[3]: https://www.shrubbery.net/tac_plus/
[4]: https://www.shrubbery.net/pub/tac_plus/
[5]: https://github.com/facebookincubator/tacquito
[6]: https://github.com/CiscoLearning/cml-docker-containers/blob/main/containers/tacplus/Dockerfile
[7]: https://manpages.ubuntu.com/manpages/bionic/man5/tac_plus.conf.5.html

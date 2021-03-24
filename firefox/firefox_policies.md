# Firefox Policies

## Policy Reference Documents

* Expanding Client Certificates in Firefox 75
  *  https://blog.mozilla.org/security/2020/04/14/expanding-client-certificates-in-firefox-75/
  *  `about:config` item `security.osclientcerts.autoload`
* Firefox Group Policy Templates README
  * https://github.com/mozilla/policy-templates/blob/master/README.md
  * Certificates | ImportEnterpriseRoots
    * Configuration Item `security.enterprise_roots.enabled`
  * Preferences
    * Configuration Item `security.osclientcerts.autoload`
* Setting Up Certificate Authorities (CAs) in Firefox
  * https://support.mozilla.org/en-US/kb/setting-certificate-authorities-firefox
  * Registry, Group Policy, `about:config` preference, etc.

## User Certificate Support (OS Cert Store)

The latest 2.8 release of Policy Templates is missing the `security.osclientcerts.autoload` option which is in the github master branch. Here is some information on the registry setting if desired for testing.

* https://github.com/mozilla/policy-templates/blob/master/windows/firefox.admx
  * Value Type: Boolean
  * `key="Software\Policies\Mozilla\Firefox\Preferences"`
  * `valueName="security.osclientcerts.autoload"`
  * enabledValue: `decimal value="1"`
  * disabledValue: `decimal value="0"`


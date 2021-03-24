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

The released Policy Templates has both the deprecated setting for Preferences `security.osclientcerts.autoload` and the modern JSON Preferences setting. 

The deprecated preference sets a registry value with the following details.

* https://github.com/mozilla/policy-templates/blob/master/windows/firefox.admx
  * Value Type: Boolean
  * `key="Software\Policies\Mozilla\Firefox\Preferences"`
  * `valueName="security.osclientcerts.autoload"`
  * enabledValue: `decimal value="1"`
  * disabledValue: `decimal value="0"`

The JSON Preferences setting seems to be preferred by the documentation. It requires all deprecated preferences to be unset (cleared).

```{
  "security.osclientcerts.autoload": {
    "Value": true,
    "Status": "default"
  },
}```

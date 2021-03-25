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

The JSON Preferences setting seems to be preferred by the documentation. It requires all deprecated preferences to be unset (cleared).

```
{
  "security.osclientcerts.autoload": {
    "Value": true,
    "Status": "default"
  }
}
```

The **deprecated** preference sets a registry value with the following details. The documentation recommends the JSON Preferences config instead. Avoid setting this so that you can use the JSON Preferences (above).

* https://github.com/mozilla/policy-templates/blob/master/windows/firefox.admx
  * Value Type: Boolean
  * `key="Software\Policies\Mozilla\Firefox\Preferences"`
  * `valueName="security.osclientcerts.autoload"`
  * enabledValue: `decimal value="1"`
  * disabledValue: `decimal value="0"`

## JSON Formatting Issues

Firefox seems to be picky about JSON formatting for configuration text. Specifically I needed to REMOVE TRAILING COMMA after the last element.

* Trailing commas in JSON (Mozilla JavaScript Reference)
  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Trailing_commas#trailing_commas_in_json
  * *"trailing commas are **not allowed** in JSON"*
* Can you use a trailing comma in a JSON object?
  * https://stackoverflow.com/questions/201782/can-you-use-a-trailing-comma-in-a-json-object
  * Answer: Not allowed by JSON specification, but some parsers might not care.
  * Firefox configuration parser seems to disallow trailing commas in JSON text.

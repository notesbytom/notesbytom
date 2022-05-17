# Atlassian Custom CA Trust

## Backup

Backup a copy of any config files / trust store files before making changes in case you need to revert.

## Jira or Confluence Custom CA Trust

Jira and Confluence internal app processes must trust the CA that signed the server cert presented.

For Jira on Linux, this may require importing your CA public cert into the Java `cacerts` used by Jira. 
If there is a trust chain, you might need to import the intermediate CA certs as well.

* **Jira** on Linux - common `cacerts` path
  * `/opt/atlassian/jira/jre/lib/security/cacerts`
* **Confluence** on Linux - common `cacerts` path
  * `/opt/atlassian/confluence/jre/lib/security/cacerts`

You can use the Java built-in `keytool` utility command to manage the `cacerts` trust store for each Atlassian app.

## Restart Services or Daemons

After updating the CA trust store for each Atlassian app, you might need to restart the app service/daemon for the new trust to become active.

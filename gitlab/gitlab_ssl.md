## Private Trusted Certificate Authorities

From https://docs.gitlab.com/omnibus/settings/ssl.html

* Copy the public certificate file only into the `/etc/gitlab/trusted-certs` directory.
* Run `gitlab-ctl reconfigure`.

## Install Server Certificate

From https://docs.gitlab.com/omnibus/settings/nginx.html#manually-configuring-https

* follow the instructions in gitlab NGINX documentation
* *"If the content of your SSL certificates has been updated, but no configuration changes have been made to `gitlab.rb`, then `gitlab-ctl reconfigure` will not affect NGINX. Instead, run `sudo gitlab-ctl hup nginx` to cause NGINX to reload the existing configuration and new certificates gracefully."*

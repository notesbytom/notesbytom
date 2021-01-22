# Gitlab Administrators

## Grant admin access from cli

If you have privileged command-line access, you can grant or revoke instance admininstrator role.
- https://docs.gitlab.com/12.10/ee/security/reset_root_password.html
  - `gitlab-rails console -e production`
  - `user = User.find_by(email: 'username@domain.com')`
  - `user.admin = true`
  - `user.save`
  - `exit`
  
See this stack overflow question for more hints
- [How to setup admin user with gitlab ...][1]

[1]: https://stackoverflow.com/questions/11761396/how-to-setup-admin-user-with-gitlab-with-ldap-authentication

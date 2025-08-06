# Gitlab Administrators

## Grant admin access from cli

If you have privileged command-line access, you can grant or revoke instance admininstrator role.
- https://docs.gitlab.com/ee/security/reset_user_password.html#reset-the-root-password
  - `gitlab-rails console -e production`
  - `user = User.find_by(email: 'username@domain.com')`
  - `pp user.attributes`
  - `user.admin = true`
  - `user.save`
  - `exit`
  
See this stack overflow question for more hints
- [How to setup admin user with gitlab ...][1]

## Additional Reading

- [GitLab Rails Console Cheat Sheet][2]
- GitLab [Rails console][4] Overview
- [Old broken link for resetting root password][3]

[1]: https://stackoverflow.com/questions/11761396/how-to-setup-admin-user-with-gitlab-with-ldap-authentication
[2]: https://docs.gitlab.com/ee/administration/troubleshooting/gitlab_rails_cheat_sheet.html
[3]: https://docs.gitlab.com/12.10/ee/security/reset_root_password.html
[4]: https://docs.gitlab.com/ee/administration/operations/rails_console.html

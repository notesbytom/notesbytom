# Web Redirect Analysis (PowerShell)

# Helpful Article: https://jmcnatt.net/quick-tips/powershell-capturing-a-redirected-url-from-a-web-request/

`$obj = Invoke-WebRequest -Uri $Uri -MaximumRedirection 0 -ErrorAction SilentlyContinue`

# The returned object will have the:
# redirect status code ($obj.StatusCode)
# redirect status description ($obj.StatusDescription)
# and redirection URL ($obj.Headers.Location)

# You can view later redirections by repeating and incrementing the `-MaximumRedirection` parameter.
# exceeding redirection limit is a terminating error. `-ErrorAction SilentlyContinue` allows the error.

# If authentication is required and you're using Domain SSO, try the `-UseDefaultCredentials` parameter.

# I also had an issue where I needed the `-UseBasicParsing` parameter (missing Internet Explorer engine).

Set-StrictMode -Version Latest

# Test machine account password validity (domain join credential for computer)

Test-ComputerSecureChannel -Verbose

# If broken, it can be reset by running from local admin account on impacted system:

Reset-ComputerMachinePassword -Server SOME_DOMAIN_CONTROLLER -Credential (get-credential)

# You can substitute a valid credential object for get-credential (with permission to reset computer machine passwords

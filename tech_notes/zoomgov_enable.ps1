# Changing this setting requires admin (uac-elevated) access
# Enable and verify that zoomgov is selectable in the zoom software.

# Add or update the setting with this:
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Zoom\Zoom Meetings\General\" -Name EnableCloudSwitch -PropertyType dword -Value 1 -Force

# Verify the setting with this:
Get-ItemProperty "HKLM:\SOFTWARE\Policies\Zoom\Zoom Meetings\General\" -Name EnableCloudSwitch

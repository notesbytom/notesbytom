# Procedure for Clearing (Re-Authenticating) 802.1x Access-Sessions
# If RADIUS Servers are Unreachable 802.1x Access-Sessions can Fail as Unauth
# After RADIUS Servers become reachable this will trigger re-auth of Unauth Devices
proc reauth_dot1x {} {
  # Find Unauth Access-Sesssions (802.1x Failed-Auth Devices)
  set unauth [exec "show access-session | include Unauth"]
  # Match lines of 1+ NON [\r\n] characters (exclude [\r\n])
  foreach line [regexp -inline -all {[^\r\n]+} $unauth] {
    # Clear Unauth Access-Sessions (Re-Authenticate Unauth Devices)
    # [lindex ... end] gives us each Unauth Access-Session-ID
    set clear_cmd "clear access-session session-id [lindex $line end]"
    puts "RUNNING $clear_cmd"
    exec "$clear_cmd"
  }
}
# Run the procedure defined above
reauth_dot1x

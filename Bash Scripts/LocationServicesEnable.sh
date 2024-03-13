#!/bin/bash

# Enable Location Services
# Requires macOS 11 or later
# Created by HCS Technology Group
# Version 20220519
# NOTE: Restart is required due to System Integrity Protection (SIP)
	
# Check if Location Services is disabled
status=$(/usr/bin/defaults read /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled)
	
# Enable Location Services only if Location Services is disabled
	
if [ "${status}" == "0" ]; then
	/usr/bin/defaults write /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled -int 1
	/usr/sbin/chown -R _locationd:_locationd /var/db/locationd
else
	echo "Location Services Enabled"
	exit
fi
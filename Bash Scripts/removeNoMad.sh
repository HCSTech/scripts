#!/bin/bash

## Get the current user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

# unload LaunchAgent
launchctl unload /Library/LaunchAgents/com.trusourcelabs.NoMAD.plist
launchctl unload "/Users/$loggedInUser/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"

# Kill NoMAD process
pkill NoMAD

# Reset Login Window
/usr/local/bin/authchanger -reset -JamfConnect

# Remove Files
sudo rm -rf "/Applications/NoMAD.app"
sudo rm -rf "/Library/Managed Preferences/com.trusourcelabs.NoMAD.plist"
sudo rm -rf "/Library/Managed Preferences/$loggedInUser/com.trusourcelabs.NoMAD.plist"
sudo rm -rf "/Users/$loggedInUser/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"
sudo rm -rf "/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"
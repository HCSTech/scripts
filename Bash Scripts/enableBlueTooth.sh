#!/bin/bash


#########################################################################################
#
# This script will add the bluetooh icon to the menubar for the current logged in user.
#
#########################################################################################

runAsUser() {  
    if [ "$currentUser" != "loginwindow" ]; then
        launchctl asuser "$uid" sudo -u "$currentUser" "$@"
    else
        echo "no user logged in"
        exit 1
    fi
}

# Get the Username of the currently logged user
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
uid=$(id -u "$currentUser")
echo "Logged in user: $currentUser"

#Enable the bluetooth icon for currently logged in user

runAsUser defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
#!/bin/bash

## Get logged in user
loggedInUser=$(stat -f%Su /dev/console)

## Get User iCloud Account
icloudaccount=$(defaults read /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist Accounts | grep AccountID | cut -d '"' -f 2)

if [ -z "$icloudaccount" ]
then
	echo "<result>Null</result>"
else
	echo "<result>$icloudaccount</result>"
fi
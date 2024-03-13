#!/bin/bash

fmmStatus=$(defaults read /Library/Preferences/com.apple.FindMyMac.plist FMMEnabled)

if [[ "$fmmStatus" = "1" ]]; then
	
	echo "<result>Enabled</result>"
	
else
	
	echo "<result>Not Enabled</result>"
	
fi
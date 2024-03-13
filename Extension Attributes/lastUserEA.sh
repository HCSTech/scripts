#!/bin/bash

#Get the last logged in user
echo "<result>$(defaults read /Library/Preferences/com.apple.loginwindow.plist lastUserName)</result>"
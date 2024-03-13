#!/bin/bash

#Get the value of the Display Sleep Timer when connected to AC Power
echo "<result>$(/usr/libexec/PlistBuddy -c "Print:AC\ Power:Display\ Sleep\ Timer" /Library/Preferences/com.apple.PowerManagement.plist)</result>"
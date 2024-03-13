#!/bin/bash

#This scirpt will look up the computer model and serial number and re name the mac.  the naming format will be LI-serialNumber-macModel.  LI-987234098-MacBook Pro


###Variables###
ComputerModel="$(sysctl -n hw.model | cut -d "," -f 1 | tr -d '[0-9]_')"
SerialNumber="$(ioreg -l | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/')"
ComputerName="LI-$SerialNumber-$ComputerModel"



###Script Contents - Do Not Modify Below This Line###
echo "Setting Computer Name to $ComputerName"
sudo /usr/sbin/scutil --set ComputerName "$ComputerName"
sudo /usr/sbin/scutil --set LocalHostName "$ComputerName"
sudo /usr/sbin/scutil --set HostName "$ComputerName"
sudo dscacheutil -flushcache
exit 0
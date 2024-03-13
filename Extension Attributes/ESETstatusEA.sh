#!/bin/bash
if [ -e "/Applications/ESET Endpoint Antivirus.app" ]; then
	APP="ESET Endpoint Antivirus.app"
fi
if [ -e "/Applications/ESET Endpoint Security.app" ]; then
	APP="ESET Endpoint Security.app"
fi
if [ -z "$APP" ]; then 	
	echo "<result>No ESET Enpoint protection</result>"
else 
	if [ "$APP" == "ESET Endpoint Antivirus.app" ]; then ESET="EEA"; fi
	if [ "$APP" == "ESET Endpoint Security.app" ]; then ESET="EES"; fi 
	Status="$(mktemp -q /tmp/ESETstatus.XXXXX)" 
	/Applications/"$APP"/Contents/MacOS/esets_daemon --status > $Status 
	AVSigsVer=$(grep AVSigsVer $Status | sed 's/AVSigsVer=//g')
	ClientVer=$(grep ClientVer $Status | sed 's/ClientVer=//g')
	Activation=$(grep Activation $Status | sed 's/Activation=//g')
	echo "<result>$ESET $ClientVer $AVSigsVer $Activation</result>"
	rm -f $Status
fi
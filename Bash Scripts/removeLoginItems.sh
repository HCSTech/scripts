#!/bin/bash

loggedInUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk -F': ' '/[[:space:]]+Name[[:space:]]:/ { if ( $2 != "loginwindow" ) { print $2 }}' )
	
	/bin/rm -rf "/Users/$loggedInUser/Library/Application Support/com.apple.backgroundtaskmanagementagent/backgrounditems.btm"
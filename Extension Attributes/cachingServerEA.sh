#!/bin/sh
#
#
# Jamf Pro Extension Attribute to return the active Caching Servers
# Created by HCS Technology Group
# Version 11-21-22
# NOTE: Output will be multiple lines or null if no caching servers are found
#
#
#
result=`/usr/bin/AssetCacheLocatorUtil 2>&1 | grep guid | awk '{print$4}' | sed 's/^\(.*\):.*$/\1/' | awk '!a[$0]++'`
echo "<result>$result</result>"

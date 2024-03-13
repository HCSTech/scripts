#!/bin/bash

SAFEIFS=$IFS
IFS="
"
wifiDevice=`networksetup -listallhardwareports | grep 'Wi-Fi' -A1 | grep -o en.`
wifiStatus=`ifconfig "$wifiDevice" | grep 'status' | awk '{ print $2 }'`
ethernetDevice=`networksetup -listallhardwareports | grep 'en' | grep -v "$wifiDevice" | grep -o en.`
ethernetStatus=`for i1 in ${ethernetDevice};do
    echo $(ifconfig "$i1" | grep 'inet' | grep -v '127.0.0.1|169.254.' | awk '{ print $2 }')
done`
if [ "$ethernetStatus" ] && [ "$wifiStatus" = "active" ]; then
    $(networksetup -setairportpower "$wifiDevice" off)
    touch /var/tmp/wifiDisabled; fi
if [ "$ethernetStatus" = "" ] && [ "$wifiStatus" = "inactive" ]; then
    if [ -f "/var/tmp/wifiDisabled" ]; then
        rm -f /var/tmp/wifiDisabled
        $(networksetup -setairportpower "$wifiDevice" on); fi
fi
IFS=$SAVEIFS
exit 0
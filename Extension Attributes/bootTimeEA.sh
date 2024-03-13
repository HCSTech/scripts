#!/bin/bash

bootTime=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)

bootTimeFormatted=$(date -jf %s $bootTime +%F\ %T)

echo "<result>$bootTimeFormatted</result>"
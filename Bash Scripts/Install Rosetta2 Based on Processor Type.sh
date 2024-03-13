#!/bin/bash
arch=$(/usr/bin/arch)
if [ "$arch" == "arm64" ]; then
     /usr/sbin/softwareupdate --install-rosetta --agree-to-license
else
echo "Intel Processor installed.  Rosetta 2 not required"
exit
fi
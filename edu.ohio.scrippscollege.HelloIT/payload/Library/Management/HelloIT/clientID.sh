#!/bin/sh

MAC_EN0=`ifconfig en0 | grep ether | awk '{print $2}'`
echo "hitp-enabled: YES"
echo "hitp-title: Client Identifier - $MAC_EN0"
echo "hitp-state: ok"

##This line copies the MAC address to the clipboard if the arugement "run" is passed.
if [ "$1" == "run" ]; then
  ifconfig en0 | grep ether | awk '{print $2}' | pbcopy
fi
#!/bin/sh

IP_EN0=`ipconfig getifaddr en0`
echo "hitp-enabled: YES"
echo "hitp-title: Client IP - $IP_EN0"
echo "hitp-state: ok"

##This line will copy the IP Address to the clipboard
ipconfig getifaddr en0 | pbcopy
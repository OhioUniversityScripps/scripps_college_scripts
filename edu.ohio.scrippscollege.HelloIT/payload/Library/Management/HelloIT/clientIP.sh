#!/bin/sh

if [ "$1" != "run" ]; then
  sleep 10
fi

IP_EN0=`ipconfig getifaddr en0`

##This line will copy the IP Address to the clipboard if the argument "run" is passed.
if [ "$1" == "run" ]; then
  echo $IP_EN0 | pbcopy
fi

echo "hitp-enabled: YES"
echo "hitp-title: Client IP - $IP_EN0"
echo "hitp-state: none"


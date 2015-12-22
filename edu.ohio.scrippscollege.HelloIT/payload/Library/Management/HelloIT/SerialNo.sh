#!/bin/sh

SERIAL=`ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}'`
echo "hitp-enabled: YES"
echo "hitp-title: Serial No. - $SERIAL"
echo "hitp-state: ok"

##This line copies the serial number to the clipboard if the arugement "run" is passed.
if [ "$1" == "run" ]; then
  ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}' | pbcopy
fi
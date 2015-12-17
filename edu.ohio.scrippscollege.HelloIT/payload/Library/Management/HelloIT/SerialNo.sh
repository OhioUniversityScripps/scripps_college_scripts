#!/bin/sh

SERIAL=`ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}'`
echo "hitp-enabled: YES"
echo "hitp-title: Serial No. - $SERIAL"
echo "hitp-state: ok"

##This line copies the serial number
ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}' | pbcopy
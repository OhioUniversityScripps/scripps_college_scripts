#!/bin/sh

MAC_EN0=`ifconfig en0 | grep ether | awk '{print $2}'`
echo "hitp-enabled: YES"
echo "hitp-title: Client Identifier - $MAC_EN0"
echo "hitp-state: ok"


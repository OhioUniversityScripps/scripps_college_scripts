#!/bin/sh

MUNKI_CHECK=`defaults read /Library/Preferences/ManagedInstalls LastCheckDate | awk '{print $1}'`
echo "hitp-enabled: YES"
echo "hitp-title: Last Munki Server Run - $MUNKI_CHECK"
echo "hitp-state: ok"
#!/bin/sh

echo "hitp-enabled: YES"
echo "hitp-title: Reset Wacom Driver Preferences"
echo "hitp-state: none"

##This line resets the preferences if the argument "run" is passed.
if [ "$1" == "run" ]; then
  OPTION=`osascript -e 'tell app "System Events" to display dialog "Please close the System Preferences before hitting OK" default button 2 buttons {"OK", "Cancel"}' | grep 'OK'`

  if [$OPTION -ne ""]; then
	exit -1
  else
    rm -f $HOME/Library/Preferences/com.wacom.*.prefs
  fi
fi
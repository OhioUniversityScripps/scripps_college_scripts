#!/bin/sh

echo "hitp-enabled: YES"
echo "hitp-title: Reset Adobe After Effects Preferences"
echo "hitp-state: none"

##This line resets the preferences if the argument "run" is passed.
if [ "$1" == "run" ]; then
  OPTION=`osascript -e 'tell app "System Events" to display dialog "Please close Adobe After Effects before hitting OK" default button 2 buttons {"OK", "Cancel"}' | grep 'OK'`

  if [$OPTION -ne ""]; then
	exit -1
  else
    rm -rf $HOME/Library/Preferences/Adobe/After\ Effects/
  fi
fi
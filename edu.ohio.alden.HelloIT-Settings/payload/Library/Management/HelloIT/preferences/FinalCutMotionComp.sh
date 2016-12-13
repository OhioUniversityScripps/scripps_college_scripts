#!/bin/sh

echo "hitp-enabled: YES"
echo "hitp-title: Reset Final Cut Studio Preferences"
echo "hitp-state: none"

##This line resets the preferences if the argument "run" is passed.
if [ "$1" == "run" ]; then
  OPTION=`osascript -e 'tell app "System Events" to display dialog "Please close Final Cut, Motion, and Compressor before hitting OK" default button 2 buttons {"OK", "Cancel"}' | grep 'OK'`

  if [$OPTION -ne ""]; then
	exit -1
  else
    defaults delete com.apple.FinalCut
    defaults delete com.apple.motionapp
    defaults delete com.apple.Compressor
  fi
fi
#!/bin/sh

echo "hitp-enabled: YES"
echo "hitp-title: Clear Adobe Cache"
echo "hitp-state: none"

##This line deletes adobe cahes if the argument "run" is passed.
if [ "$1" == "run" ]; then
  OPTION=`osascript -e 'tell app "System Events" to display dialog "Please close Adobe Creative Cloud before hitting OK" default button 2 buttons {"OK", "Cancel"}' | grep 'OK'`

  if [$OPTION -ne ""]; then
	exit -1
  else
    rm -rf $HOME/Library/Application\ Support/Adobe/Common/
  fi
fi
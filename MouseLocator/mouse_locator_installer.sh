#!/bin/bash

# Copy MouseLocator.prefPane (untar first) to $HOME/Library/PreferencePanes
echo 'Copy MouseLocator preference pane'
PREF_PANE=$HOME/Library/PreferencePanes
cd $PREF_PANE
/usr/bin/tar xzf /Library/Management/MouseLocator/MouseLocator.prefPane.tar.gz 
chown -R $USER:staff MouseLocator.prefPane

# Copy our MouseLocator.png to ~/Pictures
echo 'Copy default MouseLocator'
/bin/cp -f /Library/Management/MouseLocator/MouseLocator.png $HOME/Pictures
#!/bin/bash

MAMP_ROOT="/Applications/MAMP/htdocs"
DOC_LOC="$HOME/Documents"

#Symlink $TEMP_LOC to the $DOC_ROOT
if [ ! -d "$MAMP_ROOT/$USER" ]; then
	ln -s $DOC_LOC $MAMP_ROOT/$USER
fi

#Preference Changes
defaults write de.appsolute.MAMP startServers -bool false
defaults write de.appsolute.MAMP checkForMampPro -bool false
defaults write de.appsolute.MAMP NSNavLastRootDirectory /Volumes/Temporary/www
defaults write de.appsolute.MAMP openPage -bool true
defaults write de.appsolute.MAMP startPage /MAMP/
defaults write de.appsolute.MAMP stopServers -bool true

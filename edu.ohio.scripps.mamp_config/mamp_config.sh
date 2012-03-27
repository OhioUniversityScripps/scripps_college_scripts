#!/bin/bash

DOC_ROOT="/Applications/MAMP/htdocs"
TEMP_LOC="/Volumes/Temporary/www"

#Create and set permissions on the folder 
mkdir -p $TEMP_LOC

#Symlink $TEMP_LOC to the $DOC_ROOT
if [ ! -d "$DOC_ROOT/www" ]; then
	ln -s $TEMP_LOC $DOC_ROOT/www
fi

#Preference Changes
defaults write de.appsolute.MAMP startServers -bool false
defaults write de.appsolute.MAMP checkForMampPro -bool false
defaults write de.appsolute.MAMP NSNavLastRootDirectory /Volumes/Temporary/www
defaults write de.appsolute.MAMP openPage -bool true
defaults write de.appsolute.MAMP startPage /MAMP/
defaults write de.appsolute.MAMP stopServers -bool true

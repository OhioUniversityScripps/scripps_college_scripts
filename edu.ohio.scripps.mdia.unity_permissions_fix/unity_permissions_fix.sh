#!/bin/bash

# Copy AngryBots project to $HOME/Documents/Unity/AngryBots
# if it doesn't already exist
# This fixes a problem where Unity will ask for an admin
# to "Set Permissions" for each standard user

if [ ! -d "$HOME/Documents/Unity/AngryBots" ]; then
	#Make directory and then unzip AngryBots into the users Documents folder
	mkdir -p $HOME/Documents/Unity/
	unzip /Library/Management/unity_permissions_fix/AngryBots.zip -d $HOME/Documents/Unity
fi

#Make the Shared Unity directory and set permissions correctly
mkdir -p /Users/Shared/Unity
chmod -R 777 /Users/Shared/Unity

#Symbolically link the expected location (/Users/Shared/Unity/AngryBots) to the copied location
ln -sf $HOME/Documents/Unity/AngryBots /Users/Shared/Unity/AngryBots
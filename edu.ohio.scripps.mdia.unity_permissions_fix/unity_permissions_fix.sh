#!/bin/bash

# Copy AngryBots project to $HOME/Documents/Unity/AngryBots
# if it doesn't already exist
# This fixes a problem where Unity will ask for an admin
# to "Set Permissions" for each standard user

if [ ! -d "$HOME/Documents/Unity/AngryBots" ]; then
	#Make directory and then unzip AngryBots into the users Documents folder
	mkdir -p /Users/Shared/Unity
	mkdir -p /Users/Shared/Unity/AngryBots-$USER
	unzip /Library/Management/unity_permissions_fix/AngryBots.zip -d /Users/Shared/Unity/AngryBots-$USER
fi

#Make the Shared Unity directory and set permissions correctly
chmod -R 777 /Users/Shared/Unity/AngryBots-$USER

#Symbolically link the expected location (/Users/Shared/Unity/AngryBots) to the copied location
ln -sf /Users/Shared/Unity/AngryBots-$USER /Users/Shared/Unity/AngryBots
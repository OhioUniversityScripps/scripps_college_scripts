#!/bin/bash

FFMPEG_LOCATION="/usr/local/bin/ffmpeg"
ADAPTER_APPLICATION_SUPPORT="$HOME/Library/Application Support/Adapter"

if [ ! -e "$ADAPTER_APPLICATION_SUPPORT/ffmpeg" ]; then
	echo "FFmpeg doesn't exist. Setting preferences and symlinking"
	ADAPTER_DOMAIN=$HOME/Library/Preferences/com.macroplant.adapter

	# Enable Automatic Software Update Checks
	defaults write $ADAPTER_DOMAIN SUEnableAutomaticChecks -bool FALSE
	defaults write $ADAPTER_DOMAIN showWelcomeWindowOnStartup -bool FALSE

	# Symplink FFmpeg
	mkdir -p "$ADAPTER_APPLICATION_SUPPORT"
	ln -s $FFMPEG_LOCATION "$ADAPTER_APPLICATION_SUPPORT/ffmpeg"
fi

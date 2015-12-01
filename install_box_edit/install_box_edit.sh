#!/bin/bash

BOX_EDIT_INSTALL="/Applications/Utilities/Install Box Edit.app"

if [ -d "$BOX_EDIT_INSTALL" ]; then
	BOX_EDIT_RESOURCES="$BOX_EDIT_INSTALL/Contents/Resources"

	BOX_EDIT="$BOX_EDIT_RESOURCES/Box Edit.app"
	BOX_EDIT_FOLDER="$HOME/Library/Application Support/Box/Box Edit/"

	echo "Make Box Edit Folder"
	mkdir -p "$BOX_EDIT_FOLDER"

	echo "Make Box Edit Document Folder"
	mkdir -p "$BOX_EDIT_FOLDER/Documents"

	echo "Copy Box Edit App"
	cp -r "$BOX_EDIT" "$BOX_EDIT_FOLDER"

	#BOX_EDIT_PLUGIN="$BOX_EDIT_RESOURCES/Box Edit.plugin"
	#INTERNET_PLUGIN_FOLDER="$HOME/Library/Internet Plug-Ins"
	#cp -r "$BOX_EDIT_PLUGIN" "$INTERNET_PLUGIN_FOLDER"
	
	BOX_EDIT_SERVER="$BOX_EDIT_RESOURCES/Box Local Com Server.app"
	cp -r "$BOX_EDIT_SERVER" "$BOX_EDIT_FOLDER"
	
	open -a "$HOME/Library/Application Support/Box/Box Edit/Box Local Com Server.app"
fi
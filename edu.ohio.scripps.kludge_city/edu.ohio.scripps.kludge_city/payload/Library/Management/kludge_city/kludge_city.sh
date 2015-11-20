#!/bin/bash
mkdir -p "$HOME/Library/Preferences/Autodesk/maya/scripts/EdW_KludgeCity"

if [ ! -e "$HOME/Library/Preferences/Autodesk/maya/scripts/EdW_KludgeCity/EdW_KludgeCity.mel" ]; then
	cp /Library/Management/kludge_city/EdW_KludgeCity.mel "$HOME/Library/Preferences/Autodesk/maya/scripts/EdW_KludgeCity"
fi

if [ ! -e "$HOME/Library/Preferences/Autodesk/maya/scripts/EdW_KludgeCity/KCity_Footprints.mb" ]; then
	cp /Library/Management/kludge_city/KCity_Footprints.mb "$HOME/Library/Preferences/Autodesk/maya/scripts/EdW_KludgeCity"
fi
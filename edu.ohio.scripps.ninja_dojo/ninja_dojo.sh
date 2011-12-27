#!/bin/bash

if [ ! -d "$HOME/Library/Preferences/Autodesk/maya/scripts/Ninja_Dojo" ]; then
  mkdir -p "$HOME/Library/Preferences/Autodesk/maya/scripts"
  unzip /Library/Management/ninja_dojo/NinjaDojo.zip -d "$HOME/Library/Preferences/Autodesk/maya/scripts"
fi
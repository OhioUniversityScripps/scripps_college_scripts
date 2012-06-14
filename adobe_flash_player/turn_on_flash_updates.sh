#!/bin/bash
DIR="/Library/Application Support/Macromedia"
MMS="${DIR}/mms.cfg"

#Create Directory
mkdir -p $DIR

#Turn on autoupdates
echo "AutoUpdateDisable=0" > "$MMS"
echo "SilentAutoUpdateEnable=1" >> "$MMS"
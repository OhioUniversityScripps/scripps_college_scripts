#!/bin/bash

# Remove machine licenses if not in the same month
# On next launch, user will be prompted to install new licenses
LICENSE_FOLDER_LOC="/Library/Preferences/sesi"
LICENSE_FILE_LOC="$LICENSE_FOLDER_LOC/licenses"

if [ -e $LICENSE_FILE_LOC ]; then
	echo "Houdini license files exist"
	
	currentMonth=$(date | awk '{print $2}')
	fileMonth=$(ls -la $LICENSE_FILE_LOC | awk '{print $6}')

	# If it's not the same month, remove licenses, envoking a re-license!
	if [ $currentMonth != $fileMonth ]; then
		echo "Houdini licenses are invalid. Removing."
		rm -rf $LICENSE_FOLDER_LOC
	else
		echo "Houdini licenses still valid"
	fi
fi
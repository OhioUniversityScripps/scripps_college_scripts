#!/bin/bash

# Remove machine licenses if not in the same month
# On next launch, user will be prompted to install new licenses
LICENSE_FOLDER_LOC="/Library/Preferences/sesi"

if [ -e $LICENSE_FILE_LOC ]; then
	echo "Houdini license files exist"
	
	# Delete all license files if they are older than 28 days
	# Licenses expire after 30 days, but 28 cycles will take care of
	# any issues related with not rebooting at the currect time(s)
	find $LICENSE_FOLDER_LOC -name license* -and -ctime -28d -exec rm {} \;
fi
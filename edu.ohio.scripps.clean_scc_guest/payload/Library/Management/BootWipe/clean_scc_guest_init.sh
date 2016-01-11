#!/bin/bash

# ------------------------------------------------------------------------
#	This script contains variables to be initialized before any 
#	network scripts are run.
#
#	Author: Tim Grannen
# ------------------------------------------------------------------------

# $User will be defined within the context of each indiviual script

LocalHome="/Users/$User"
MY_DIR="/Library/Management/BootWipe"
OutputFile="$MY_DIR/clean_scc_guest_output.txt"

# For future implementation to check OS: 
# 	will return everything after 10. (i.e. 9.1)
OS=`sw_vers | grep ProductVersion | cut -f 2-4 -d '.'`

WIPEUSERS=( scclab )
CREATEUSERS=( scclab )
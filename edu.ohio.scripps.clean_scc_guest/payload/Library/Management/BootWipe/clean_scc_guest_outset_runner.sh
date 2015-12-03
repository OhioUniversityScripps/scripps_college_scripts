#!/bin/bash

MY_DIR="/Library/Management/BootWipe"
source $MY_DIR/clean_scc_guest_init.sh
$MY_DIR/clean_scc_guest.sh >> $OutputFile

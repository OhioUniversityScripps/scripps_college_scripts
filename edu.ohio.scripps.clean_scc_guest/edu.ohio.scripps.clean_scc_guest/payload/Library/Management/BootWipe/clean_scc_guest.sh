#!/bin/bash


# Wipe user 
MY_DIR="/Library/Management/BootWipe"
source $MY_DIR/clean_scc_guest_init.sh

wipe(){
	# $1 will be the short name of the user to wipe
	dir="/Users/$1"
	echo "DIR is : $dir"
	if [[ -d $dir ]]; then
		echo "Removing $dir"
		sudo rm -rf $dir 	# This launchdeamon will run as root
	fi
}

wipeUsers(){
	for i in "${WIPEUSERS[@]}"; do
		echo "Wiping this user: $i"
		wipe $i
	done
}

makeNewHomeFolders(){
	for i in "${CREATEUSERS[@]}"; do
		echo "Creating home dirs for: $i"
		sudo createhomedir -c -u $i
	done
}


installCerts(){
	dir="/Users/$1/Library/Keychains/"
	sudo mkdir -p $dir
	sudo cp $MY_DIR/login.keychain $dir
	sudo chown $1 $dir/login.keychain
}

installCertsForUsers(){
	for i in "${CREATEUSERS[@]}"; do
		echo "Installing Certs for: $i"
		installCerts $i
	done
}

echoDate(){
	date
}

echoStars(){
	echo
	echo "*******************************************************"
	echo
}

echoStars
echoDate
wipeUsers
makeNewHomeFolders
installCertsForUsers
echoStars



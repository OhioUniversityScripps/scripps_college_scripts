#!/bin/bash

SERVER_ADDRESS="https://mydesktop.ohio.edu:443/broker/xml"
user=`whoami`
prefsdir="/Users/${user}/Library/Preferences"
if [ ! -d "${prefsdir}" ]; then mkdir -p "${prefsdir}" && chown "${user}" "${prefsdir}"; fi

addTrustedServerAddress(){
	/usr/libexec/PlistBuddy -c "Add trustedServers array" "${prefsdir}/com.vmware.view.plist"
	/usr/libexec/PlistBuddy -c "Add trustedServers:0 string" "${prefsdir}/com.vmware.view.plist" 
	/usr/libexec/PlistBuddy -c "Set trustedServers:0 "${SERVER_ADDRESS}"" "${prefsdir}/com.vmware.view.plist"
}

addServerHistory(){
	/usr/libexec/PlistBuddy -c "Add broker-history array" "${prefsdir}/com.vmware.view.plist"
	/usr/libexec/PlistBuddy -c "Add broker-history:0 string" "${prefsdir}/com.vmware.view.plist" 
	/usr/libexec/PlistBuddy -c "Set broker-history:0 "${SERVER_ADDRESS}"" "${prefsdir}/com.vmware.view.plist"
}


isServerAddressInPlistArray(){
	# $1 will be the array to check
	
	# Getting number of entries in plist array
	cnt=`/usr/libexec/PlistBuddy -c "Print $1" ${prefsdir}/com.vmware.view.plist | grep "http" | wc -l`
	for (( i = 0; i < $cnt; i++ )); do
		# reading each entry
		line=`/usr/libexec/PlistBuddy -c "Print $1:${i}" ${prefsdir}/com.vmware.view.plist`
		if [[ "$line" = "$SERVER_ADDRESS" ]]; then
			# Return 1 in result variable if found
			result="1"
			return
		fi
	done
	# Return 0 in result variable if not found
	result="0"
	return
}

restartDefaults(){
	killall -u ${user} cfprefsd
}

defaults write "${prefsdir}/com.vmware.view" promptedUSBPrintingServicesInstall -bool YES
chown "${user}" "${prefsdir}/com.vmware.view.plist"

isServerAddressInPlistArray "trustedServers"
isTrustedServers=$result

isServerAddressInPlistArray "broker-history"
isBrokerHistory=$result

# if SERVER_ADDRESS is not in the broker-history array
if [[ $isBrokerHistory = "0" ]]; then
	echo  "Adding history"
	addServerHistory
	restartDefaults
fi

# if SERVER_ADDRESS is not in the trustedServers array
if [[ $isTrustedServers = "0" ]]; then
	echo "Adding trust"
	addTrustedServerAddress
	restartDefaults
fi

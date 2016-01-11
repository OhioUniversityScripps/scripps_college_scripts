README.txt

These scripts, when installed with outset, will wipe and recreate the home directories for the specified users in clean_scc_guest_init.sh.

This will also replace their login keychain with a keychain that has been prepopulated with the necessary OU wireless certifications. This keychain will only work for the user accounts with the same password that the keychain was created from. Instructions below describe how to update the keychain for this package.

Creating a new Keychain:
	Login to the user account that will be wiped
	Open Keychain Access
	Connect to OU wireless with the desired wireless credentials that will be re-installed after wipe(This will grab all of the necessary certs and create a 802.11X password in the login keychain)
	Remove all entries in the login keychain that are not relevent to OU wireless (keep the 802.11X password)
	Copy the login.keychain file from ~/Library/Keychains/ and place it in the directory where the new package will be built
	Change the user account shortnames in clean_scc_guest_init.sh (if necessary)
	make pkg

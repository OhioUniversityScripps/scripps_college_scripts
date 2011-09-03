#!/bin/sh

#Set MunkiServer Preferences
defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL "http://od3.ohio.edu"
defaults write /Library/Preferences/ManagedInstalls ManifestURL "http://od3.ohio.edu"

#Set Staff Preferences
defaults write /Library/Preferences/ManagedInstalls AppleSoftwareUpdatesOnly -bool false
defaults write /Library/Preferences/ManagedInstalls InstallAppleSoftwareUpdates -bool true
defaults write /Library/Preferences/ManagedInstalls SuppressUserNotification -bool false
defaults write /Library/Preferences/ManagedInstalls ShowRemovalDetail -bool true
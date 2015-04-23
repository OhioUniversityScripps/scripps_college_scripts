#!/bin/sh

local_user=$(dscl . -list /Users | grep -i $1) 

if [ "$local_user" != "$1" ]; then
	/bin/rm -rf /home/$1/Library/Caches
	
	echo "Network login via $1@ohio.edu" >> /Users/Shared/logins.log
	chmod 666 /Users/Shared/logins.log
fi

#To create the login hook use:  
#sudo defaults write com.apple.loginwindow LoginHook /Library/Management/login_hook.sh

#To remove the login hook:
#sudo defaults delete com.apple.loginwindow LoginHook /Library/Management/login_hook.sh
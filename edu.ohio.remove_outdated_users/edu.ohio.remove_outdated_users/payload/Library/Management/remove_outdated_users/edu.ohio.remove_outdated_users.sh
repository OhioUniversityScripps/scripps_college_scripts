#!/bin/bash

# List of users to keep
KEEP=$( cat <<EOL
/Users/admin
/Users/administrator
/Users/sccadmin
/Users/Shared
/Users/Search
EOL);

# Number of days to keep
DAYS=30

USERLIST=`find /Users -type d -maxdepth 1 -mindepth 1 -not -name "*.*" -mtime +$DAYS`

for user in $USERLIST ; do
  echo "Inspecting $user to determine whether it should be kept"
  
  # Keep select accounts
  for kept_user in $KEEP ; do
    if [[ "$user" == "$kept_user" ]]; then
		echo "Will not delete $user"
		user=""
		break # no need to continue if we've found a match
	fi
  done
  
  if [[ "$user" != "" ]]; then
    echo "Deleting account and home directory for" $user
    # dscl . delete $user  #delete the account  
    rm -r $user  #delete the home directory
  fi
done
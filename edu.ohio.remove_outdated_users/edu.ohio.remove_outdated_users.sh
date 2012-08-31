#!/bin/bash

# List of users to keep
KEEP=$( cat <<EOL
/Users/admin
/Users/administrator
/Users/sccadmin
/Users/mdiaadmin
/Users/Shared
/Users/Search
EOL);

# Number of days to keep
DAYS=30

USERLIST=`find /Users -type d -maxdepth 1 -mindepth 1 -not -name "*.*" -mtime +$DAYS`

for user in $USERLIST ; do
  # Keep select accounts
  for keep in $KEEP ; do
    [[ "$user" == "$keep" ]] && user="" && continue
  done
  
  if [[ "$user" != "" ]]; then
    echo "Deleting account and home directory for" $user
    # dscl . delete $user  #delete the account  
    # rm -r $user  #delete the home directory
  fi
done
#!/usr/bin/ruby

usernames=%w{userid_1 userid_2 userid_3}
fullnames=["User Name 1", "User Name 2", "User Name 3",]
passwords=%w{password1 password2 password3}

# ====

`if [[ $UID -ne 0 ]]; then echo "Please run $0 as root." && exit 1; fi`

usernames.count.times do |index|
	# Find out the next available user ID
	max_id = `dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1`
	user_id = max_id.to_i + 1

	username = usernames[index]
	fullname = fullnames[index]
	password = passwords[index]
	
	# Create the user account
  `dscl . -create /Users/#{username}`
  `dscl . -create /Users/#{username} UserShell /bin/bash`
  `dscl . -create /Users/#{username} RealName "#{fullname}"`
  `dscl . -create /Users/#{username} UniqueID "#{user_id}"`
  `dscl . -create /Users/#{username} PrimaryGroupID 20`
  `dscl . -create /Users/#{username} NFSHomeDirectory /Users/#{username}`

  `dscl . -passwd /Users/#{username} #{password}`

	# Create the home directory
  `createhomedir -c > /dev/null`

	puts "Created user #{user_id}: #{username} (#{fullname})"
end
#!/usr/bin/ruby
require 'csv'

test = false

#Removing SX Virtual Link Preferferences folder
`rm -rf /Users/$USER/Library/Preferences/silex/SXVirtualLink`

#Copy Default Plists
`mkdir /Users/$USER/Library/Preferences/silex/SXVirtualLink`
`cp /Library/Management/ilok_connect/jp.silex.configuration.plist /Users/$USER/Library/Preferences/silex/SXVirtualLink/jp.silex.configuration.plist`
`cp /Library/Management/ilok_connect/default-jp.silex.favorites.plist /Users/$USER/Library/Preferences/silex/SXVirtualLink/jp.silex.favorites.plist`

#Modify jp.silex.favorites.plist with device specific settings
mac_address = `ifconfig en0 | awk '/ether/ {print $2}'`.chomp
puts "My MAC address is #{mac_address}" if test

CSV.open('/Library/Management/ilok_connect/data.csv', 'r') do |row|
  if row[0].downcase == mac_address.downcase
    connect_automatically_enable = "/usr/libexec/plistbuddy -c \"Set :#{row[1]}:Connect\\ Automatically\\ Enable true\" /Users/$USER/Library/Preferences/silex/SXVirtualLink/jp.silex.favorites.plist"
    connect_automatically = "/usr/libexec/plistbuddy -c \"Set :#{row[1]}:Connect\\ Automatically 1\" /Users/$USER/Library/Preferences/silex/SXVirtualLink/jp.silex.favorites.plist"
    if test
      puts connect_automatically_enable
      puts connect_automatically
    else
      `#{connect_automatically_enable}`
      `#{connect_automatically}`
    end
  end
end

if test
  puts "I would be running SX Virtual Link now"
else
  #Open Application
  `open "/Applications/SX Virtual Link.app"`
end
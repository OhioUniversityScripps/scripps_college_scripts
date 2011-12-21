#Lock the Saved Application State Folder
chflags uchg "$HOME/Library/Saved Application State"

#Lock the BYHOST
BYHOST=$(system_profiler SPHardwareDataType | grep 'Hardware UUID' | awk '{print $3}')
chflags uchg "$HOME/Library/Preferences/ByHost/com.apple.loginwindow.$BYHOST.plist"


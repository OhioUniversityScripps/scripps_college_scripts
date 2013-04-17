DOMAIN="${HOME}/Library/Preferences/com.bartastechnologies.transcriva2app"

defaults write ${DOMAIN} "Serial Name" -string "USERNAME"
defaults write ${DOMAIN} "Serial Number" -string "Serial Number"
defaults read ${DOMAIN}
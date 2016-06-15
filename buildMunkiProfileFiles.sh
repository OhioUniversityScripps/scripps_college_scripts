#!/bin/zsh

PROFILE=$1
VERSION=$2

function helpAndQuit {
  echo
  echo "Usage:"
  echo "./buildMunkiProfileFiles.sh /path/to/profile VERSION"
  echo
  echo "Example:"
  echo "./buildMunkiProfileFiles.sh ~/Desktop/lab.mobileconfig 1.2"
  exit 1
}

[[ -z "$PROFILE" ]] && echo "PROFILE not specified" && helpAndQuit
[[ -z "$VERSION" ]] && echo "VERSION not specified" && helpAndQuit

PROFILE_FILENAME=`basename $PROFILE`
PROFILE_INSTALL_LOC="/Library/Management/Profiles/"
PROFILE_DMG="$PROFILE.dmg"
PROFILE_DMG_PLIST="$PROFILE_DMG.plist"
POSTINSTALL_SCRIPT=postinstall_script.sh
PREUNINSTALL_SCRIPT=preuninstall_script.sh


echo "Building DMG..."
rm -rf $PROFILE_DMG
dropdmg "$PROFILE"

echo
echo "Building POSTINSTALL_SCRIPT..."
cat <<- EOF > $POSTINSTALL_SCRIPT
#!/bin/sh
/usr/bin/profiles -IF /Library/Management/Profiles/$PROFILE_FILENAME
EOF

echo
echo "Building PREUNINSTALL_SCRIPT..."
cat <<- EOF > $PREUNINSTALL_SCRIPT
#!/bin/sh
/usr/bin/profiles -RF /Library/Management/Profiles/$PROFILE_FILENAME
EOF

echo
echo "Generating PKGINFO..."
rm -rf $PROFILE_DMG_PLIST
makepkginfo --pkgvers $VERSION -i $PROFILE_FILENAME -d $PROFILE_INSTALL_LOC --postinstall_script=$POSTINSTALL_SCRIPT --preuninstall_script=$PREUNINSTALL_SCRIPT $PROFILE_DMG > $PROFILE_DMG_PLIST

# echo "Cleaning up after myself..."
rm -rf $POSTINSTALL_SCRIPT
rm -rf $PREUNINSTALL_SCRIPT


echo
echo "Complete!"

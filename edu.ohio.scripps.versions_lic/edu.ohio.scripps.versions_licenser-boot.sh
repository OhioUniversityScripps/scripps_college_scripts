#This script will copy the correct license file to 
MAC_ADDRESS=`ifconfig en0 | awk '/ether/ {print $2}'`
LICENSE_DIR="/Library/Application Support/Versions"
LICENSE_FILE="$LICENSE_DIR/License"

rm $LICENSE_FILE
mkdir -p "$LICENSE_DIR"

cp /Library/Management/versions_licenser/$MAC_ADDRESS.lic "$LICENSE_DIR"
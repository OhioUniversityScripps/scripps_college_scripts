#!/bin/bash
SERIAL=`system_profiler SPHardwareDataType | awk '/Serial Number/ { print $4; }'`
LICENSE_DIR="/Users/Shared/DSP-Quattro/Support Files/"
DEPLOYMENT_DIR="./"

/bin/mkdir /Volumes/Deployment
/sbin/mount_afp afp://USERNAME:PASSWORD@SERVER/Deployment /Volumes/Deployment
cd /Volumes/Deployment
/bin/mkdir -p "/Volumes/Deployment/dsp_quattro"

cp "${LICENSE_DIR}/DSP-Quattro4License.sig" "/Volumes/Deployment/dsp_quattro/${SERIAL}.sig"

sleep 2

/sbin/umount /Volumes/Deployment
/bin/rmdir /Volumes/Deployment
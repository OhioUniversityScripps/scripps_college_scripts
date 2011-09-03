#!/bin/sh

#Touch this file which will cause Munki to check at startup for new installs
/usr/bin/touch /Users/Shared/.com.googlecode.munki.checkandinstallatstartup

exit 0
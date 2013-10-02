#!/bin/bash

#
# This Loginhook enables Folder Redirection for student accounts (not
generic accounts).
# The local Documents folder will be redirected to the student's Home
Folder path as defined in AD.
# Desktop Shortcut is created to the the Old Local saved Documents Folder
# Desktop Shortcut is created to the Active Directory Home Folder (same as
new Documents)
#
##

#
# Get OS Version
#

OS=`sw_vers | grep ProductVersion | cut -f 2 -d '.'`


#
# Establish who the user is
#

touch /login.txt
echo " " >> /login.txt
echo "################## START  "$1" ##################" >> /login.txt
echo `date` >> /login.txt
echo "OS VERSION: 10."$OS >> /login.txt
USERTYPE=unknown
USER=$1

echo "User is: "$USER >> /login.txt

if [ $OS == "5" ];
then
echo "OS Version 10." $OS " is not 10.6 or higher" >> /login.txt
echo "################## END  "$1" ##################" >> /login.txt
echo " " >> /login.txt
exit 0
elif [ $OS == "4" ];
then
echo "OS Version 10." $OS " is not 10.6 or higher" >> /login.txt
echo "################## END  "$1" ##################" >> /login.txt
echo " " >> /login.txt
exit 0
else
echo "OS Version 10." $OS " is supported" >> /login.txt
fi

#
# Is logging on user a centrally created student account?  Let's find out.
# Check first 2 characters of employeeID.  ST=Student
#


USERTYPE=`dscl /Active\ Directory/DOMAINNAME/All\ Domains -read
/Users/$USER | grep employeeID | cut -f 2 -d ' ' | cut -b -2`
echo "AD UserType is: "$USERTYPE >> /login.txt


if [ $USERTYPE == ST ];
then
USERTYPE=student
echo "User employeeID starts ST.  UserType set as: "$USERTYPE >> /login.txt
else
echo "employeeID did not fit criteria for redirection (ST). Exiting." >>
/login.txt
echo "Folder Redirection is limited to centrally generated student
accounts.  Exiting." >> /login.txt
echo "################## END  "$1" ##################" >> /login.txt
echo " " >> /login.txt
exit 0
fi

#
# Get User's SMB Home Path
#
SMBHOME=`dscl /Active\ Directory/DOMAINNAME/All\ Domains -read /Users/$USER
| grep SMBHome:`

echo "SMBHome: "$SMBHOME >> /login.txt

SERVER=`echo $SMBHOME | cut -f 3 -d '\'`
echo "Server Name is: "$SERVER >> /login.txt

VOLUME=`echo $SMBHOME | cut -f 4 -d '\'`
echo "Volume to mount is: "$VOLUME >> /login.txt

FOLDER=`echo $SMBHOME | cut -f 5 -d '\'`
echo "Folder Name is: "$FOLDER >> /login.txt

#
# Student Actions: Create "!Server Documents" Link on Desktop
#

if [ $USERTYPE == student ]; then
	echo "Beginning Documents Redirection For Student: "$USER >> /login.txt
	ln -fs /Volumes/$VOLUME/$FOLDER /Users/$USER/Desktop/\!Server\ Documents

	#
	# Check local /Users/ for existence of "Documents" and move as necessary.
	# Then create symlinks
	#

	if [ -L "/Users/$USER/Documents" ]; then
	 echo "Documents is a symlink, don't move it, but relink in case it is
	incorrect" >> /login.txt
	 ln -fs /Volumes/$VOLUME/$FOLDER /Users/$USER/Documents;
	else
	 echo "Need to make a Documents symlink" >> /login.txt
	 mv /Users/$USER/Documents /Users/$USER/Old_Documents;
	 ln -fs /Volumes/$VOLUME/$FOLDER /Users/$USER/Documents;
	fi

else
	echo "UserType for "$USER" is not Student." >> /login.txt
fi


echo "################## END  "$1" ##################" >> /login.txt
echo " " >> /login.txt

exit 0
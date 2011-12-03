#
#   Copyright 2011 Ricky Chilcott <chilcotr@ohio.edu> and Logan Zimmerer <lz298708@ohio.edu>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#       You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# 
#  Luggage makefile for installing our unity fix permissions script

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.mdia.unity_permissions_fix
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-Library-Management_unity_permissions_fix-unity_permissions_fix.sh\
		pack-Library-Management_unity_permissions_fix-AngryBots.zip\
		pack-Library-LaunchAgents-edu.ohio.scripps.mdia.unity_permissions_fix.plist\
		pack-script-postflight
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/ilok_connect
l_Library_Management_unity_permissions_fix: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/unity_permissions_fix
	@sudo chown root:wheel ${WORK_D}/Library/Management/unity_permissions_fix
	@sudo chmod 755 ${WORK_D}/Library/Management/unity_permissions_fix

# Install at /Library/Management/ilok_connect
pack-Library-Management_unity_permissions_fix-%: % l_Library_Management_unity_permissions_fix
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/unity_permissions_fix

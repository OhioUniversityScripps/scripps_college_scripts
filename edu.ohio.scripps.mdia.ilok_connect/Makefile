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
#  Luggage makefile for installing our auto-connect iLok login script

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.mdia.ilok_connect
REVERSE_DOMAIN=edu.ohio.scripps.mdia.
PAYLOAD=pack-Library-Management_iLok_Connect-data.csv\
		pack-Library-Management_iLok_Connect-default-jp.silex.favorites.plist\
		pack-Library-Management_iLok_Connect-jp.silex.configuration.plist\
		pack-Library-Management_iLok_Connect-edu.ohio.scripps.mdia.ilok_connect.rb\
		pack-Library-LaunchAgents-edu.ohio.scripps.mdia.ilok_connect.plist\
		pack-script-postflight \
		pack-script-preflight
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/ilok_connect
l_Library_Management_iLok_Connect: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/ilok_connect
	@sudo chown root:wheel ${WORK_D}/Library/Management/ilok_connect
	@sudo chmod 755 ${WORK_D}/Library/Management/ilok_connect

# Install at /Library/Management/ilok_connect
pack-Library-Management_iLok_Connect-%: % l_Library_Management_iLok_Connect
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/ilok_connect

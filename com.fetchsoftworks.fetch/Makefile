#
#   Copyright 2013 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for installing and licensing Fetch

USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=Fetch
REVERSE_DOMAIN=com.fetchworks.fetch
PAYLOAD=unbz2-applications-Fetch.app\
				pack-Library-Management_fetch_licenser-fetch_licenser.sh\
				pack-Library-LaunchAgents-com.fetchsoftworks.fetch_licenser.plist
PACKAGE_VERSION=5.7.3

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/fetch_licenser
l_Library_Management_fetch_licenser: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/fetch_licenser
	@sudo chown root:wheel ${WORK_D}/Library/Management/fetch_licenser
	@sudo chmod 755 ${WORK_D}/Library/Management/fetch_licenser

# Install at /Library/Management/fetch_licenser
pack-Library-Management_fetch_licenser-%: % l_Library_Management_fetch_licenser
	@sudo ${INSTALL} -m 555 -g wheel -o root $< ${WORK_D}/Library/Management/fetch_licenser

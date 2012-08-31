#
#   Copyright 2012 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for installing the MAMP -- this will run at every startup

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.remove_outdated_users
REVERSE_DOMAIN=edu.ohio
PAYLOAD=pack-Library-Management_remove_outdated_users-edu.ohio.remove_outdated_users.sh\
        pack-Library-LaunchDaemons-edu.ohio.remove_outdated_users.plist
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/remove_outdated_users
l_Library_Management_remove_outdated_users: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/remove_outdated_users
	@sudo chown root:wheel ${WORK_D}/Library/Management/remove_outdated_users
	@sudo chmod 755 ${WORK_D}/Library/Management/remove_outdated_users

# Install at /Library/Management/remove_outdated_users
pack-Library-Management_remove_outdated_users-%: % l_Library_Management_remove_outdated_users
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/remove_outdated_users
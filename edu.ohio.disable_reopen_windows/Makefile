#
#   Copyright 2011 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for builing a package to disable the "reopen window" functionality made
#  popular by Lion. YUCK!

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.disable_reopen_windows
REVERSE_DOMAIN=edu.ohio
PAYLOAD=pack-Library-Management_disable_reopen_windows-disable_reopen_windows.sh\
		pack-Library-LaunchAgents-edu.ohio.disable_reopen_windows.plist
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/disable_reopen_windows
l_Library_Management_disable_reopen_windows: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/disable_reopen_windows
	@sudo chown root:wheel ${WORK_D}/Library/Management/disable_reopen_windows
	@sudo chmod 755 ${WORK_D}/Library/Management/disable_reopen_windows

# Install at /Library/Management/disable_reopen_windows
pack-Library-Management_disable_reopen_windows-%: % l_Library_Management_disable_reopen_windows
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/disable_reopen_windows

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
#  Luggage makefile for licensing Transcriva

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.transcriva_licenser
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-Library-Management_transcriva_licenser-transcriva_licenser.sh\
		pack-Library-LaunchAgents-edu.ohio.scripps.transcriva_licenser.plist
PACKAGE_VERSION=1.1

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/transcriva_licenser
l_Library_Management_transcriva_licenser: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/transcriva_licenser
	@sudo chown root:wheel ${WORK_D}/Library/Management/transcriva_licenser
	@sudo chmod 755 ${WORK_D}/Library/Management/transcriva_licenser

# Install at /Library/Management/transcriva_licenser
pack-Library-Management_transcriva_licenser-%: % l_Library_Management_transcriva_licenser
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/transcriva_licenser

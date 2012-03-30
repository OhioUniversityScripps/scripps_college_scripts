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
#  Luggage makefile for installing the MAMP Config Script -- this will run at every login

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.mamp_config
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-Library-Management_mamp_config-mamp_config.sh\
		pack-Library-LaunchAgents-edu.ohio.scripps.mamp_config.plist
PACKAGE_VERSION=1.1

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/mamp_config
l_Library_Management_mamp_config: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/mamp_config
	@sudo chown root:wheel ${WORK_D}/Library/Management/mamp_config
	@sudo chmod 755 ${WORK_D}/Library/Management/mamp_config

# Install at /Library/Management/mamp_config
pack-Library-Management_mamp_config-%: % l_Library_Management_mamp_config
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/mamp_config

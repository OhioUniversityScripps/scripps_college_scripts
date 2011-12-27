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
#  Luggage makefile for installing a set of Autodesk Scripts -- Nija Dojo -- this will run at every login
#  https://www.creativecrash.com/maya/downloads/scripts-plugins/modeling/poly-tools/c/ninja-dojo-white-belt/

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.ninja_dojo
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-Library-Management_ninja_dojo-ninja_dojo.sh\
		pack-Library-Management_ninja_dojo-NinjaDojo.zip\
		pack-Library-LaunchAgents-edu.ohio.scripps.ninja_dojo.plist
# Package Version is year.month of script publication
PACKAGE_VERSION=2011.10

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/ninja_dojo
l_Library_Management_ninja_dojo: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/ninja_dojo
	@sudo chown root:wheel ${WORK_D}/Library/Management/ninja_dojo
	@sudo chmod 755 ${WORK_D}/Library/Management/ninja_dojo

# Install at /Library/Management/ninja_dojo
pack-Library-Management_ninja_dojo-%: % l_Library_Management_ninja_dojo
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/ninja_dojo

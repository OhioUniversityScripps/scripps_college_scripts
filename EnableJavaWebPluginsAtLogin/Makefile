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
#  Luggage makefile for enabling Java Web Plugin and fixing the warning that pops up at login.

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.oit.enable_web_java_plugin
REVERSE_DOMAIN=edu.ohio
PAYLOAD=pack-Library-Management_enable_web_java_plugin-enable_web_java_plugin.sh\
        pack-Library-LaunchDaemons-edu.ohio.oit.enable_web_java_plugin.plist
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/enable_web_java_plugin
l_Library_Management_enable_web_java_plugin: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/enable_web_java_plugin
	@sudo chown root:wheel ${WORK_D}/Library/Management/enable_web_java_plugin
	@sudo chmod 755 ${WORK_D}/Library/Management/enable_web_java_plugin

# Install at /Library/Management/enable_web_java_plugin
pack-Library-Management_enable_web_java_plugin-%: % l_Library_Management_enable_web_java_plugin
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/enable_web_java_plugin

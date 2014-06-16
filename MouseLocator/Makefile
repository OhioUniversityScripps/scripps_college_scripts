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

TITLE=MouseLocator
REVERSE_DOMAIN=com.2point5fish.mouselocator
PAYLOAD=pack-usr-local-outset-login-every-mouse_locator_installer.sh\
				pack-Library-Management-mouse-locator-MouseLocator.png\
				unbz2-preferencepanes-MouseLocator.prefPane\
				
PACKAGE_VERSION=1.1

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/MouseLocator
l_Library_Management_mouse_locator: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/MouseLocator
	@sudo chown root:wheel ${WORK_D}/Library/Management/MouseLocator
	@sudo chmod 755 ${WORK_D}/Library/Management/MouseLocator

# Install at /Library/Management/MouseLocator
pack-Library-Management-mouse-locator-%: % l_Library_Management_mouse_locator
	@sudo ${INSTALL} -m 555 -g wheel -o root $< ${WORK_D}/Library/Management/MouseLocator

# Outset Rules
l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/{firstboot-packages,firstboot-scripts,everyboot-scripts,login-every,login-once}
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-firstboot-packages-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-packages

pack-usr-local-outset-firstboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-scripts

pack-usr-local-outset-everyboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/everyboot-scripts

pack-usr-local-outset-login-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-every

pack-usr-local-outset-login-once-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-once
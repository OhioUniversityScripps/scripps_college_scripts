#
#   Copyright 2014 Tim Grannen <tg236309@ohio.edu>
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
#  Luggage makefile for initializing VMware Horizon View Client

USE_PKGBUILD=1

include /usr/local/share/luggage/luggage.make


TITLE=edu.ohio.vmware_user_init
REVERSE_DOMAIN=edu.ohio
# PAYLOAD=pack-Library-Management_coda_licenser-coda_licenser.sh\
# 		pack-Library-LaunchAgents-edu.ohio.scripps.coda_licenser.plist
PAYLOAD=pack-Library-Management_vmware-vmware_user_init.sh\
		pack-Library-LaunchAgents-edu.ohio.vmware_user_init.plist
PACKAGE_VERSION=1.3

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/vmware
l_Library_Management_vmware: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/vmware
	@sudo chown root:wheel ${WORK_D}/Library/Management/vmware
	@sudo chmod 755 ${WORK_D}/Library/Management/vmware

# Install at /Library/Management/vmware
pack-Library-Management_vmware-%: % l_Library_Management_vmware
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/vmware

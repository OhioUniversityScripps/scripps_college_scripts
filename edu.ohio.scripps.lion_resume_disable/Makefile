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
#  Luggage makefile for installing a Lion Disable Script -- this will run at every login

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.mdia.lion_resume_disable
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-Library-Management_lion_resume_disable-lion_resume_disable.sh\
		pack-Library-LaunchAgents-edu.ohio.scripps.lion_resume_disable.plist
PACKAGE_VERSION=1.0

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/ilok_connect
l_Library_Management_lion_resume_disable: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/lion_resume_disable
	@sudo chown root:wheel ${WORK_D}/Library/Management/lion_resume_disable
	@sudo chmod 755 ${WORK_D}/Library/Management/lion_resume_disable

# Install at /Library/Management/ilok_connect
pack-Library-Management_lion_resume_disable-%: % l_Library_Management_lion_resume_disable
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/lion_resume_disable

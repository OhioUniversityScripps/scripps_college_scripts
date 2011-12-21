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
#  Luggage makefile for installing a set of Autodesk Scripts -- EdW Kludge City-- this will run at every login

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.kludge_city
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-Library-Management_kludge_city-kludge_city.sh\
		pack-Library-Management_kludge_city-EdW_KludgeCity.mel\
		pack-Library-Management_kludge_city-KCity_Footprints.mb\
		pack-Library-LaunchAgents-edu.ohio.scripps.kludge_city.plist
# Package Version is year.month of script publication
PACKAGE_VERSION=2010.04


# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/kludge_city
l_Library_Management_kludge_city: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/kludge_city
	@sudo chown root:wheel ${WORK_D}/Library/Management/kludge_city
	@sudo chmod 755 ${WORK_D}/Library/Management/kludge_city

# Install at /Library/Management/kludge_city
pack-Library-Management_kludge_city-%: % l_Library_Management_kludge_city
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/kludge_city

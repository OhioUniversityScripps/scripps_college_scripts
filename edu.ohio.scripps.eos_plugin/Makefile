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
#  Luggage makefile for installing the Canon EOS Plugin for Final Cut Pro ver 1.2

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.eos_plugin
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=unbz2-Library-ProApps-Plugins-CanonE1.RADPlug
PACKAGE_VERSION=1.2

# Create /Library/Application Support/ProApps/MIO/RAD/Plugins/CanonE1.RADPlug/
l_Library_ProApps_Plugins: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Application\ Support/ProApps/MIO/RAD/Plugins
	@sudo chown root:wheel ${WORK_D}/Library/Application\ Support/ProApps/MIO/RAD/Plugins
	@sudo chmod 775 ${WORK_D}/Library/Application\ Support/ProApps/MIO/RAD/Plugins

unbz2-Library-ProApps-Plugins-%: %.tar.bz2 l_Library_ProApps_Plugins
	@sudo ${TAR} xjf "${<}" -C ${WORK_D}/Library/Application\ Support/ProApps/MIO/RAD/Plugins
	@sudo chown -R root:admin ${WORK_D}/Library/Application\ Support/ProApps/MIO/RAD/Plugins/"$(shell echo "${<}" | sed s/\.tar\.bz2//g)"

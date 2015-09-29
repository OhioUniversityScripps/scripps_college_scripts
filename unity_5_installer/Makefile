#
#   Copyright 2015 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for Unity Download and Install Script
PKG_BUILD=1

include /usr/local/share/luggage/luggage.make

TITLE=UnityDownloadAndInstall
REVERSE_DOMAIN=edu.ohio.scrippscollege.unity_download_and_install
PAYLOAD=pack-Library-Management_unity-unity_download.py
PACKAGE_VERSION=1.1

# Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/unity
l_Library_Management_unity: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/unity
	@sudo chown root:wheel ${WORK_D}/Library/Management/unity
	@sudo chmod 755 ${WORK_D}/Library/Management/unity

# Install at /Library/Management/disable_reopen_windows
pack-Library-Management_unity-%: % l_Library_Management_unity
	@sudo ${INSTALL} -m 544 -g wheel -o root $< ${WORK_D}/Library/Management/unity

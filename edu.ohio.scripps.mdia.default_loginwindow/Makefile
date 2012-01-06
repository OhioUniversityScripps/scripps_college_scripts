#
#   Copyright 2011 Ricky Chilcott <chilcotr@ohio.edu> and Logan Zimmerer <lz298708@ohio.edu>
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
#  Luggage makefile for installing MDIA Login Window Image

include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.scripps.mdia.default_loginwindow
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-System_Library_CoreServices-DefaultDesktop.jpg
PACKAGE_VERSION=1.0

# Create /System/Library/CoreServices/
l_system_library_CoreServices:
	@sudo mkdir -p ${WORK_D}/System/Library/CoreServices/
	@sudo chown root:wheel ${WORK_D}/System/Library/CoreServices/
	@sudo chmod 755 ${WORK_D}/System/Library/CoreServices/

# Install at /Library/Management/ilok_connect
pack-System_Library_CoreServices-%: % l_system_library_CoreServices
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/System/Library/CoreServices/

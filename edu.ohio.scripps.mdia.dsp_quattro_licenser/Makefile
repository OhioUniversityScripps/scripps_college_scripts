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
#  Luggage makefile for builing a package to remove unneeded applications Microsoft Office Applications
# in labs.

include /usr/local/share/luggage/luggage.make

TITLE=dsp_quattro_licenser
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-licenses \
        pack-script-postflight
PACKAGE_VERSION=1.0

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/mamp_config
l_Library_Management_DSP_Quattro_Licenses: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/DSP_Quattro_Licenses
	@sudo chown root:wheel ${WORK_D}/Library/Management/DSP_Quattro_Licenses
	@sudo chmod 700 ${WORK_D}/Library/Management/DSP_Quattro_Licenses

pack-licenses: l_Library_Management_DSP_Quattro_Licenses
	@sudo ${CP} -rf licenses/ ${WORK_D}/Library/Management/DSP_Quattro_Licenses
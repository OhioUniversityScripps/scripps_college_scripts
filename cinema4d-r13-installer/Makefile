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
#  Luggage makefile for installing Cinema4D

include /usr/local/share/luggage/luggage.make

TITLE=viscom.cinema4d_r13
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=unzip-folder-to-applications-MAXON
PACKAGE_VERSION=13.0

unzip-folder-to-applications-%: %.zip l_Applications
	@sudo ${DITTO} --noqtn -k -x "${<}" ${WORK_D}/Applications/
	@sudo chown -R root:admin ${WORK_D}/Applications/$(shell echo "${<}" | sed s/\.zip//g)
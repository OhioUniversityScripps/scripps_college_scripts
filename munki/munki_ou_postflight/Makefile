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
#  Luggage makefile for building a package that installs a printer.

include /usr/local/share/luggage/luggage.make

TITLE=Munki_OU_Postflight
REVERSE_DOMAIN=edu.ohio.oit.pkg.munki_ou_postflight
PAYLOAD=pack-usr-local-munki-postflight
PACKAGE_VERSION=1.0

l_munki: l_usr
	@sudo mkdir -p ${WORK_D}/usr/local/munki
	@sudo chown root:wheel ${WORK_D}/usr/local/munki
	@sudo chmod 755 ${WORK_D}/usr/local/munki

pack-usr-local-munki-preflight: l_munki
	@sudo ${CP} -p preflight ${WORK_D}/usr/local/munki/preflight
	@sudo chown root:wheel ${WORK_D}/usr/local/munki/preflight
	@sudo chmod 755 ${WORK_D}/usr/local/munki/preflight

pack-usr-local-munki-postflight: l_munki
	@sudo ${CP} -p postflight ${WORK_D}/usr/local/munki/postflight
	@sudo chown root:wheel ${WORK_D}/usr/local/munki/postflight
	@sudo chmod 755 ${WORK_D}/usr/local/munki/postflight

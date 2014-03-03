#
#   Copyright 2014 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for configuring standard cupsd.conf file, namely to allow non-admins to enable, resume, release printers and print jobs

USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=cupsd_conf
REVERSE_DOMAIN=edu.ohio.scripps.cupsd_conf
PAYLOAD=pack-script-preinstall \
 				pack-script-postinstall \
				pack-cupsd.conf

PACKAGE_VERSION=1.1

l_private_etc_cups: l_private_etc
	@sudo mkdir -p ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups
	@sudo chmod 755 ${WORK_D}/private/etc/cups

pack-cupsd.conf: l_private_etc_cups
	@sudo ${CP} cupsd.conf ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups/cupsd.conf
	@sudo chmod 644 ${WORK_D}/private/etc/cups/cupsd.conf
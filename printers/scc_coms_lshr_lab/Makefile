#
#   Copyright 2009 Joe Block <jpb@ApesSeekingKnowledge.net>
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

l_private_etc_cups: l_private_etc
	@sudo mkdir -p ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups
	@sudo chmod 755 ${WORK_D}/private/etc/cups

pack-cupsd.conf: l_private_etc_cups
	@sudo ${CP} cupsd.conf ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups/cupsd.conf
	@sudo chmod 644 ${WORK_D}/private/etc/cups/cupsd.conf

pack-printers.conf: l_private_etc_cups
	@sudo ${CP} printers.conf ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups/printers.conf
	@sudo chmod 600 ${WORK_D}/private/etc/cups/printers.conf

l_private_etc_cups_ppd: l_private_etc_cups
	@sudo mkdir -p ${WORK_D}/private/etc/cups/ppd
	@sudo chown root:_lp ${WORK_D}/private/etc/cups/ppd
	@sudo chmod 751 ${WORK_D}/private/etc/cups/ppd

pack-ppds: l_private_etc_cups_ppd
	@sudo ${CP} -rf ppd/ ${WORK_D}/private/etc/cups/ppd
	@sudo chown -R root:_lp ${WORK_D}/private/etc/cups/ppd/
	@sudo chmod -R 644 ${WORK_D}/private/etc/cups/ppd/

TITLE=coms_lasher_lab_printers
REVERSE_DOMAIN=edu.ohio.scripps.coms
PAYLOAD=pack-script-postflight \
		pack-script-preflight \
		pack-cupsd.conf \
		pack-printers.conf \
		pack-ppds

PACKAGE_VERSION=1.0



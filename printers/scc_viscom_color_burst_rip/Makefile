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
#  Luggage makefile for building a package that installs the ColorBurst VisCom RIP printer
USE_PKGBUILD=1

include /usr/local/share/luggage/luggage.make

TITLE=viscom_colorburst_rip
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-script-preinstall \
        pack-viscom-ppd \
        pack-script-postinstall
PACKAGE_VERSION=1.0


pack-viscom-ppd: 
  
l_private_etc_cups: l_private_etc
	@sudo mkdir -p ${WORK_D}/private/etc/cups
	@sudo chown root:_lp ${WORK_D}/private/etc/cups
	@sudo chmod 755 ${WORK_D}/private/etc/cups

l_private_etc_cups_ppd: l_private_etc_cups
	@sudo mkdir -p ${WORK_D}/private/etc/cups/ppd
	@sudo chown root:_lp ${WORK_D}/private/etc/cups/ppd
	@sudo chmod 751 ${WORK_D}/private/etc/cups/ppd

pack-viscom-ppd: l_private_etc_cups_ppd
	@sudo ${CP} -rf VisCom_RIP.ppd ${WORK_D}/private/etc/cups/ppd/VisCom_RIP.ppd
	@sudo chown -R root:_lp ${WORK_D}/private/etc/cups/ppd/VisCom_RIP.ppd
	@sudo chmod -R 644 ${WORK_D}/private/etc/cups/ppd/VisCom_RIP.ppd
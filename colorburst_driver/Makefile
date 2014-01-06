#
#   Copyright 20012 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for installing ColorBurst Driver
USE_PKGBUILD=1

include /usr/local/share/luggage/luggage.make

TITLE=colorburst
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD=pack-colorburst-ppd

PACKAGE_VERSION=4.1

l_library_printers_ppds: 
	@sudo mkdir -p ${WORK_D}/Library/Printers/PPDs/Contents/Resources
	@sudo chown root:admin ${WORK_D}/Library/Printers/PPDs/Contents/Resources
	@sudo chmod 755 ${WORK_D}/Library/Printers/PPDs/Contents/Resources
  
pack-colorburst-ppd: l_library_printers_ppds
	@sudo ${CP} -rf ColorBurst.ppd.gz ${WORK_D}/Library/Printers/PPDs/Contents/Resources/ColorBurst.ppd.gz
	@sudo chown -R root:admin ${WORK_D}/Library/Printers/PPDs/Contents/Resources/ColorBurst.ppd.gz
	@sudo chmod -R 644 ${WORK_D}/Library/Printers/PPDs/Contents/Resources/ColorBurst.ppd.gz
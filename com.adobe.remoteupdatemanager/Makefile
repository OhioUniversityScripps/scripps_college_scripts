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
#  Luggage makefile for installing the Adobe Remote Update Mangager

include /usr/local/share/luggage/luggage.make

TITLE=remoteupdatemanager
REVERSE_DOMAIN=com.adobe
PAYLOAD=pack-usr-local-bin-adobe-RemoteUpdateManager \
        pack-Library-LaunchDaemons-com.adobe.remoteupdatemanager.plist
PACKAGE_VERSION=3.0.1

pack-usr-local-bin-adobe-%: % l_usr_local_bin_adobe
	@sudo ${INSTALL} -m 755 -g wheel -o root $< ${WORK_D}/usr/local/bin/adobe
  
l_usr_local_bin_adobe: l_usr_local_bin
	@sudo mkdir -p ${WORK_D}/usr/local/bin/adobe
	@sudo chown -R root:wheel ${WORK_D}/usr/local/bin/adobe
	@sudo chmod -R 755 ${WORK_D}/usr/local/bin/adobe
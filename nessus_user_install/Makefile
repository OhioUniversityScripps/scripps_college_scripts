#
#   Copyright 2011 Ricky Chilcott <chilcotr@ohio.edu> and Phil Skocich <skocich@ohio.edu>
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
#  Luggage makefile for installing nessus user

include /usr/local/share/luggage/luggage.make

pack-nessus-ssh-authorized_keys: pack-nessus-ssh
	@sudo ${INSTALL} -m 0600 -o nessus -g staff authorized_keys ${WORK_D}/Users/nessus/.ssh/

pack-nessus-ssh: pack-nessus
	sudo mkdir -p ${WORK_D}/Users/nessus/.ssh
	sudo chown nessus:staff ${WORK_D}/Users/nessus/.ssh
	sudo chmod 700 ${WORK_D}/Users/nessus/.ssh

pack-nessus:
	sudo mkdir -p ${WORK_D}/Users/nessus
	sudo chown nessus:staff ${WORK_D}/Users/nessus
	sudo chmod 740 ${WORK_D}/Users/nessus

TITLE=oit_install_nessus_user
REVERSE_DOMAIN=edu.ohio.oit
PAYLOAD=pack-script-preflight\
		pack-script-postflight\
		pack-nessus-ssh-authorized_keys
PACKAGE_VERSION=1.0



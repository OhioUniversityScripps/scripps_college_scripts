#
#   Copyright 2011 Ricky Chilcott <chilcotr@ohio.edu>
#   with help from Geordie Korper <geordie@korper.org>
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
#	Helper rules for munki preflight and postflight scripts

l_usr_local_munki: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/munki
	@sudo chown root:wheel ${WORK_D}/usr/local/munki
	@sudo chmod 755 ${WORK_D}/usr/local/munki

pack-usr-local-munki-preflight: l_usr_local_munki
	@sudo ${INSTALL} -m 0755 -o root -g wheel preflight ${WORK_D}/usr/local/munki/preflight

pack-usr-local-munki-postflight: l_usr_local_munki
	@sudo ${INSTALL} -m 0755 -o root -g wheel postflight ${WORK_D}/usr/local/munki/postflight


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
#  Luggage makefile for installing the DuDuF IK Tools for After Effects
#  http://ik.duduf.com/

include /usr/local/share/luggage/luggage.make

l_adobe-after-effects: l_Applications
	@sudo mkdir -p ${WORK_D}/Applications/Adobe\ After\ Effects
	@sudo chown root:admin ${WORK_D}/Applications/Adobe\ After\ Effects
	@sudo chmod 755 ${WORK_D}/Applications/Adobe\ After\ Effects

l_adobe-after-effects_scripts: l_adobe-after-effects
	@sudo mkdir -p ${WORK_D}/Applications/Adobe\ After\ Effects/Scripts/
	@sudo chown root:admin ${WORK_D}/Applications/Adobe\ After\ Effects/Scripts/
	@sudo chmod 755 ${WORK_D}/Applications/Adobe\ After\ Effects/Scripts/

pack-ScriptUIPanels: l_adobe-after-effects_scripts
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects/Scripts/ScriptUI Panels"
	@sudo ${CP} -rf ./ScriptUI\ Panels/* "${WORK_D}/Applications/Adobe After Effects/Scripts/ScriptUI Panels"
	@sudo chown -R root:admin "${WORK_D}/Applications/Adobe After Effects/Scripts/ScriptUI Panels"
	@sudo chmod -R 755 "${WORK_D}/Applications/Adobe After Effects/Scripts/ScriptUI Panels"

pack-DuikIcons: l_adobe-after-effects_scripts
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects/Scripts/Duik Icons"
	@sudo ${CP} -rf Duik\ Icons/* "${WORK_D}/Applications/Adobe After Effects/Scripts/Duik Icons"
	@sudo chown -R root:admin "${WORK_D}/Applications/Adobe After Effects/Scripts/Duik Icons"
	@sudo chmod -R 755 "${WORK_D}/Applications/Adobe After Effects/Scripts/Duik Icons"

TITLE=scc_mdia_install_duik_ae_plugin
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-ScriptUIPanels \
		pack-DuikIcons
PACKAGE_VERSION=12.2



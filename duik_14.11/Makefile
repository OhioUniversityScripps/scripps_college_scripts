#
#   Copyright 2013 Ricky Chilcott <chilcotr@ohio.edu>
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

USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=scc_do_ae-cc_duik_plugin
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PACKAGE_VERSION=14.11
PAYLOAD=pack-ScriptUIPanels-Duik_images.jsxinc \
				pack-ScriptUIPanels-Duik_translations.jsxinc \
				pack-ScriptUIPanels-Duik.jsx

l_adobe-after-effects: l_Applications
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects CC 2014/"
	@sudo chown root:admin "${WORK_D}/Applications/Adobe After Effects CC 2014/"
	@sudo chmod 755 "${WORK_D}/Applications/Adobe After Effects CC 2014/"

l_adobe-ae_scripts: l_adobe-after-effects
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/"
	@sudo chown root:admin "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/"
	@sudo chmod 755 "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/"

l_adobe-ae_scripts-scriptui_panels: l_adobe-ae_scripts
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/ScriptUI Panels"
	@sudo chown -R root:admin "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/ScriptUI Panels"
	@sudo chmod -R 755 "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/ScriptUI Panels"

pack-ScriptUIPanels-%: % l_adobe-ae_scripts-scriptui_panels
	@sudo ${INSTALL} -m 755 -g admin -o root $< "${WORK_D}/Applications/Adobe After Effects CC 2014/Scripts/ScriptUI Panels"


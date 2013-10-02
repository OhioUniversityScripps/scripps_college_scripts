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

l_adobe-after-effects: l_Applications
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects CS6/"
	@sudo chown root:admin "${WORK_D}/Applications/Adobe After Effects CS6/"
	@sudo chmod 755 "${WORK_D}/Applications/Adobe After Effects CS6/"

l_adobe-after-effects_effects: l_adobe-after-effects
	@sudo mkdir -p "${WORK_D}/Applications/Adobe After Effects CS6/Plug-ins/Effects/"
	@sudo chown root:admin "${WORK_D}/Applications/Adobe After Effects CS6/Plug-ins/Effects/"
	@sudo chmod 755 "${WORK_D}/Applications/Adobe After Effects CS6/Plug-ins/Effects/"

pack-AfterEfectsEffects-%: % l_adobe-after-effects_effects
	@sudo ${INSTALL} -m 755 -g wheel -o root $< "${WORK_D}/Applications/Adobe After Effects CS6/Plug-ins/Effects/"

TITLE=scc_mdia_install_duik_ae_plugin
REVERSE_DOMAIN=edu.ohio.scripps.mdia
PAYLOAD=pack-AfterEfectsEffects-TonemapAdvanced-mac64.plugin \
		pack-AfterEfectsEffects-TonemapBasic-mac64.plugin \
		pack-AfterEfectsEffects-GingerWrapper-AE-mac64.plugin \
		pack-AfterEfectsEffects-LicenseManager.app
PACKAGE_VERSION=13.0.2



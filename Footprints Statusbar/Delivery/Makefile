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
#  Luggage makefile for installing the Footprints Status Bar

include /usr/local/share/luggage/luggage.make

unbz2-applications-FootprintsStatusbar.app: FootprintsStatusbar.app.tar.bz2 l_Applications
	@SUDO ${TAR} xjf FootprintsStatusbar.app.tar.bz2 -C ${WORK_D}/Applications
	@SUDO chown -R root:admin "${WORK_D}/Applications/Footprints Statusbar.app"

TITLE=oit_footprints_statusbar
REVERSE_DOMAIN=edu.ohio.oit.desktop-support
PAYLOAD=unbz2-applications-FootprintsStatusbar.app \
		pack-script-postflight \
		pack-script-preflight \
		pack-Library-LaunchAgents-edu.ohio.oit.desktop_support.footprints_statusbar.plist
PACKAGE_VERSION=1.1



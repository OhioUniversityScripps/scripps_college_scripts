#
#   Copyright 2014 Ricky Chilcott <chilcotr@ohio.edu>
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
#  Luggage makefile for installing the VisCom Gamma Wallpaper

USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=gamma-wallpaper
REVERSE_DOMAIN=edu.ohio.scripps.viscom
PAYLOAD=pack-gamma_22_wallpaper.tiff
PACKAGE_VERSION=1.0

l_users_shared:
	@sudo mkdir -p ${WORK_D}/Users/Shared
	@sudo chmod 755 ${WORK_D}/Users/Shared
		
pack-gamma_22_wallpaper.tiff: l_users_shared
	@sudo ${CP} gamma_22_wallpaper.tiff ${WORK_D}/Users/Shared
	@sudo chown root:wheel ${WORK_D}/Users/Shared/gamma_22_wallpaper.tiff
	@sudo chmod 644 ${WORK_D}/Users/Shared/gamma_22_wallpaper.tiff

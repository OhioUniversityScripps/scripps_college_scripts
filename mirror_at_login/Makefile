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
#  Luggage makefile for installing mirror application and turning on mirroring at startup

# Using the mirror tool found at http://www.fabiancanas.com/Projects/MirrorDisplays/ by Fabián Cañas
# Thanks Fabián

include /usr/local/share/luggage/luggage.make

TITLE=oit_mirror_displays
REVERSE_DOMAIN=edu.ohio.oit.desktop-support
PAYLOAD=pack-usr-local-bin-mirror \
		pack-script-postflight \
		pack-Library-LaunchAgents-edu.ohio.oit.desktop_support.mirror_displays.plist
PACKAGE_VERSION=1.0
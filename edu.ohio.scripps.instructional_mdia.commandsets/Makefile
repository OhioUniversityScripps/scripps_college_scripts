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
#  Luggage makefile for installing a set of command sets for FCP, Motion and other Apple Apps

USE_PKGBUILD=1

include /usr/local/share/luggage/luggage.make

TITLE=commandsets
REVERSE_DOMAIN=edu.ohio.scripps.instructional_media.commandsets
PAYLOAD=pack-IM-FCPX-RTG_CUSTOM_6v4.commandset\
        pack-IM-MOTION5-RTG_Final_Cut_Pro_Set.commandset
PACKAGE_VERSION=1.0

# Create /Instructional Media/Commandsets
l_instructional_media:
	@sudo mkdir -p ${WORK_D}/Instructional\ Media
	@sudo chown root:wheel ${WORK_D}/Instructional\ Media
	@sudo chmod 755 ${WORK_D}/Instructional\ Media

# Create /Instructional Media/Commandsets/Motion 5
l_instructional_media_motion5: l_instructional_media
	@sudo mkdir -p ${WORK_D}/Instructional\ Media/Commandsets/Motion\ 5
	@sudo chown root:wheel ${WORK_D}/Instructional\ Media/Commandsets/Motion\ 5
	@sudo chmod 755 ${WORK_D}/Instructional\ Media/Commandsets/Motion\ 5
  
# Create /Instructional Media/Commandsets/FCP X
l_instructional_media_fcpx: l_instructional_media
	@sudo mkdir -p ${WORK_D}/Instructional\ Media/Commandsets/FCP\ X
	@sudo chown root:wheel ${WORK_D}/Instructional\ Media/Commandsets/FCP\ X
	@sudo chmod 755 ${WORK_D}/Instructional\ Media/Commandsets/FCP\ X

# Install at /Instructional Media/Commandsets/Motion 5
pack-IM-MOTION5-%: % l_instructional_media_motion5
	@sudo ${INSTALL} -m 555 -g wheel -o root $< ${WORK_D}/Instructional\ Media/Commandsets/Motion\ 5
  
# Install at /Instructional Media/Commandsets/FCP X
pack-IM-FCPX-%: % l_instructional_media_fcpx
	@sudo ${INSTALL} -m 555 -g wheel -o root $< ${WORK_D}/Instructional\ Media/Commandsets/FCP\ X


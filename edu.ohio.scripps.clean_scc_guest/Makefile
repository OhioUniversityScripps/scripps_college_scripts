USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=clean_scc_guest
REVERSE_DOMAIN=edu.ohio.scripps
PAYLOAD= \
        pack-usr-local-outset-everyboot-scripts-clean_scc_guest_outset_runner.sh \
        pack-Library-Management_BootWipe-clean_scc_guest_outset_runner.sh \
        pack-Library-Management_BootWipe-clean_scc_guest.sh \
        pack-Library-Management_BootWipe-clean_scc_guest_init.sh \
        pack-Library-Management_BootWipe-Read-README.txt \
        pack-Library-Management_BootWipe_keychain-login.keychain \

l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/everyboot-scripts
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-everyboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/everyboot-scripts


 # Create /Library/Management
l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

# Create /Library/Management/BootWipe
l_Library_Management_BootWipe: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/BootWipe
	@sudo chown root:wheel ${WORK_D}/Library/Management/BootWipe
	@sudo chmod 755 ${WORK_D}/Library/Management/BootWipe

# Install at /Library/Management/BootWipe
pack-Library-Management_BootWipe-%: % l_Library_Management_BootWipe
	@sudo ${INSTALL} -m 655 -g wheel -o root $< ${WORK_D}/Library/Management/BootWipe

# Install at /Library/Management/BootWipe
pack-Library-Management_BootWipe_keychain-%: % l_Library_Management_BootWipe
	@sudo ${INSTALL} -m 444 -g wheel -o root $< ${WORK_D}/Library/Management/BootWipe

# Install README at /Library/Management/BootWipe
pack-Library-Management_BootWipe-Read-%: % l_Library_Management_BootWipe
	@sudo ${INSTALL} -m 644 -g wheel -o root $< ${WORK_D}/Library/Management/BootWipe

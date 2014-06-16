USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=edu.ohio.install_box_edit
REVERSE_DOMAIN=edu.ohio
PAYLOAD=pack-usr-local-outset-login-every-install_box_edit.sh

PACKAGE_VERSION=1.0

l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/{firstboot-packages,firstboot-scripts,everyboot-scripts,login-every,login-once}
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-firstboot-packages-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-packages

pack-usr-local-outset-firstboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-scripts

pack-usr-local-outset-everyboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/everyboot-scripts

pack-usr-local-outset-login-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-every

pack-usr-local-outset-login-once-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-once
USE_PKGBUILD=1


include /usr/local/share/luggage/luggage.make
TITLE=AdapterSetup
REVERSE_DOMAIN=edu.ohio.scrippscollege
PAYLOAD=pack-usr-local-bin-ffmpeg\
        pack-usr-local-outset-login-every-adapter_setup.sh
				
PACKAGE_VERSION=2.1.1

l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/{firstboot-packages,firstboot-scripts,everyboot-scripts,login-every,login-once}
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-login-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-every

.PHONY: install

install : clipsync.sh clipsync.service.mk
	chmod 755 clipsync.sh
	cp clipsync.sh        ${HOME}/.local/bin
	sh clipsync.service.mk > clipsync.service
	cp clipsync.service   ${HOME}/.config/systemd/user

uninstall:
	rm ${HOME}/.local/bin/clipsync.sh
	rm ${HOME}/.config/user/clipsync.service


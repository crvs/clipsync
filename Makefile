.PHONY: install clean

all: clipsync.service

clipsync.service: clipsync.service.mk
	sh clipsync.service.mk > clipsync.service

install: clipsync.sh clipsync.service
	chmod 755 clipsync.sh
	cp clipsync.sh        ${HOME}/.local/bin
	cp clipsync.service   ${HOME}/.config/systemd/user

clean:
	@if [ -f clipsync.service ] ; then rm clipsync.service ; echo cleaned ; else echo nothing to do ; fi

uninstall:
	rm ${HOME}/.local/bin/clipsync.sh
	rm ${HOME}/.config/user/clipsync.service


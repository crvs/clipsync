.PHONY: install clean

all: clipsync.service

clipsync.service: clipsync.service.mk
	sh clipsync.service.mk > clipsync.service

install: clipsync clipsync.service
	install -m 755 clipsync ${HOME}/.local/bin/clipsync
	install clipsync.service   ${HOME}/.config/systemd/user/clipsync.service

clean:
	@if [ -f clipsync.service ] ; then rm clipsync.service ; echo cleaned ; else echo nothing to do ; fi

uninstall:
	rm ${HOME}/.local/bin/clipsync.sh
	rm ${HOME}/.config/user/clipsync.service


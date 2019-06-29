# Clipsync

Keep the system clipboard and the primary selection synchronized

### Dependencies

xclip

### Installation

make install

### Notes

The only thing that is really running is the `clipsync.sh` script. This should be copied into your path and invoked in the background to keep synchronizing your clipboards.

If you have systemd installed then you can enable clipsync as a user service by doing after having installed it with `make install` (note that this is a local installation so no sudo required).

> systemctl --user enable clipsync.service

These instructions work on arch linux, I'm not sure how they would port to other distributions




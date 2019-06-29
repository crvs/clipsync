# Clipsync

Keep the system clipboard and the primary selection synchronized

### Dependencies

`xclip`

### Installation

> $ make install

Note that the installation is not as root, so it will only affect the current user. It pre-suposes that the paths `$HOME/.local/systemd/user` and `$HOME/.config/bin` exist and will install there the necessary `service` file and the script.

### Notes

The only thing that is running is the `clipsync.sh` script. This should be copied into your path and invoked in the background to keep synchronizing your clipboards.

If you have systemd installed then you can enable clipsync as a user service after having installed it with `make install` by running.

> $ systemctl --user enable clipsync.service
>
> $ systemctl --user start clipsync.service

**These instructions work on arch linux, I'm not sure how they would port to other distributions**


echo "[Unit]
Description=synchronize clipboard with primary selection using xclip

[Service]
ExecStart=${HOME}/.local/bin/clipsync.sh
Restart=always

[Install]
WantedBy=default.target"

[Unit]
Description=Auto start of Pi Nodes
Documentation=
After=

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/sbin/clusterhat on all
ExecStop=/sbin/clusterhat off all

[Install]
WantedBy=multi-user.target

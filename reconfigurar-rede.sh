#!/bin/bash
install -m 644 systemd/*.network /etc/systemd/network

systemctl stop NetworkManager
systemctl disable NetworkManager

systemctl enable systemd-networkd
systemctl enable systemd-networkd-wait-online
systemctl enable systemd-resolved

systemctl start systemd-networkd
systemctl start systemd-networkd-wait-online
systemctl start systemd-resolved

ln -sf /var/run/systemd/resolve/resolv.conf /etc/resolv.conf

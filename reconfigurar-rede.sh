#!/bin/bash

wifi_iface=$(ip -o link | grep wl | cut -d: -f2 | awk '{print $1}')

install -m 644 systemd/cabeada.network /etc/systemd/network

if [ -n "${wifi_iface}" ]
then
    install -m 644 systemd/wifi.network /etc/systemd/network
    install -m 644 systemd/wpa_supplicant@.service /etc/systemd/system
    install -d /etc/wpa_supplicant
    install -m 644 systemd/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-${wifi_iface}.conf
fi

systemctl stop NetworkManager
systemctl disable NetworkManager

systemctl stop networking
systemctl disable networking

systemctl enable systemd-networkd
systemctl enable systemd-networkd-wait-online
systemctl enable systemd-resolved

systemctl start systemd-networkd
systemctl start systemd-networkd-wait-online
systemctl start systemd-resolved

if [ -n "${wifi_iface}" ]
then
    systemctl enable wpa_supplicant@${wifi_iface}
    systemctl start wpa_supplicant@${wifi_iface}
fi

ln -sf /var/run/systemd/resolve/resolv.conf /etc/resolv.conf

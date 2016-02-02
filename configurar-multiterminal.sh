#!/bin/bash

install systemd/xorg@s* /etc/systemd/system
install -m 644 udev/* /etc/udev/rules.d

install -d /etc/X11/xorg.conf.d
install -m 644 xorg/* /etc/X11/xorg.conf.d

install -d /etc/lightdm/lightdm.conf.d
install -m 644 lightdm/* /etc/lightdm/lightdm.conf.d

systemctl enable xorg@90.socket
systemctl start xorg@90.socket

apt-add-repository ppa:ubuntu-multiseat/ppa
apt update
apt install xserver-xorg-video-siliconmotion xserver-xephyr

udevadm trigger
systemctl restart lightdm

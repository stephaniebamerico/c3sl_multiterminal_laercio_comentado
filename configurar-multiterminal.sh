#!/bin/bash

install systemd/xorg@.s* /etc/systemd/system
install -m 644 udev/* /etc/udev/rules.d

install -d /etc/X11/xorg.conf.d
install -m 644 xorg/* /etc/X11/xorg.conf.d

install -d /etc/xdg/lightdm/lightdm.conf.d
install -m 644 lightdm/xephyr* /etc/xdg/lightdm/lightdm.conf.d
install -m 755 xephyr-wrapper /usr/local/bin

systemctl enable xorg@90.service
systemctl start xorg@90.service

apt-add-repository ppa:ubuntu-multiseat/ppa
apt update
apt -y upgrade
apt -y install xserver-xorg-video-siliconmotion xserver-xephyr compton

udevadm trigger
systemctl restart lightdm

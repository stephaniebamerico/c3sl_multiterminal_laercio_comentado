#!/bin/bash

addgroup freeze
adduser --gecos "Modelo para Freeze" --shell /bin/bash freezetemplate

for i in 1 2 3
do
    adduser --disabled-login --gecos "Aluno #${i}" --shell /bin/bash aluno${i}
    adduser aluno${i} freeze
    echo aluno${i}:aluno${i} | chpasswd
done

apt update
apt -y install libpam-mount bindfs

install -m 755 mount-wrapper /usr/local/sbin
install -m 644 pam_mount.conf.xml /etc/security

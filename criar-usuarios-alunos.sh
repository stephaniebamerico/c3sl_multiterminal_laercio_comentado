#!/bin/bash

addgroup freeze
adduser --gecos "Modelo para Freeze" --shell /bin/bash freezetemplate

for i in 1 2 3
do
    adduser --disabled-login --gecos "Aluno #${i}" --groups freeze --shell /bin/bash aluno${i}
    echo aluno${i}:aluno${i} | chpasswd
done

apt update
apt install libpam-mount

install -m 755 mount-wrapper /usr/local/sbin
install -m 644 pam_mount.conf.xml /etc/security

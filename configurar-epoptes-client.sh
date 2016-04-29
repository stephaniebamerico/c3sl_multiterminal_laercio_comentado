#!/bin/bash

apt install -y epoptes-client
install -m 644 systemd/epoptes-client.service /etc/systemd/system

systemctl stop epoptes-client
systemctl disable epoptes-client

[ -n "${1}" ] && sed -i "s/#SERVER=.*$/SERVER=${1}/" /etc/default/epoptes-client

systemctl enable epoptes-client.service
systemctl start epoptes-client.service

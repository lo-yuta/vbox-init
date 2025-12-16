#!/bin/bash
set -euo pipefail
set -x

apt-get update -y
apt-get install -y sudo wget vim

mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh

wget -qO /home/vagrant/.ssh/authorized_keys \
  https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub

chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

systemctl restart ssh || systemctl restart sshd

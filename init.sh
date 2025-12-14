#!/bin/bash

apt install sudo -y

mkdir /home/vagrant/.ssh/
chmod 0700 /home/vagrant/.ssh/
touch /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/ssh

chmod 0600 / home/vagrant/.ssh/authorized_keys
echo "vagrant ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/vagrant
chmod 448 /etc/sudoers.d/vagrant
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

wget https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.pub -0 /home/vagrant/.ssh/authorized_keys

systemctl restart sshd

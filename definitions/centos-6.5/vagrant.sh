#!/usr/bin/env bash

yum -y install wget

useradd -m -s /bin/bash vagrant
echo 'vagrant' | passwd --stdin vagrant

sed -i 's/Defaults    requiretty/#Defaults    requiretty/' /etc/sudoers
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

mkdir -p /home/vagrant/.ssh/
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod -R 0700 /home/vagrant/.ssh/
chmod -R 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh/

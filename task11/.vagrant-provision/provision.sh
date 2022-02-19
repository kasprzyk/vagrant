#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

echo "Installing terraform"
apt-get update
apt-get dist-upgrade
apt-get install dialog
apt-get install -y software-properties-common
apt-get install -y vim curl wget make git unzip groff
apt-get install -y python3 python3-pip
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform

echo "Configuring AWS credentials"
[ ! -e "/vagrant/.vagrant-provision/aws/config" ] && [ ! -e "/vagrant/.vagrant-provision/aws/credentials" ] && echo "Please create aws/config and aws/credentials files in .vagrant-provisioning." && exit 1
mkdir -p /home/vagrant/.aws
cp /vagrant/.vagrant-provision/aws/* /home/vagrant/.aws/
chown -R vagrant:vagrant /home/vagrant/.aws

echo "Generate ssh key"
sudo -u vagrant ssh-keygen -o -a 100 -t ed25519 -f ~vagrant/.ssh/id_ed25519 -C runner -N ""
#sudo -u vagrant ssh-keygen -t rsa -b 8192 -f ~vagrant/.ssh/id_rsa -C runner -N ""

echo "Installing AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo pip install aws-shell

echo Done

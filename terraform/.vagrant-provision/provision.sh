#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "Installing terraform"
apt-get update
apt-get install -y software-properties-common
apt-get install -y vim nano curl wget make git unzip groff
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

echo "Installing Docker"
apt-get update
apt-get remove -y docker docker-engine docker.io containerd runc
apt-get remove -y multipath-tools --purge
# Install docker
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
# post-installation steps
usermod -aG docker vagrant

echo Done

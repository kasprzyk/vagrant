#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo Installing ansible
apt-get update
apt-get install -y software-properties-common
apt-get install -y vim curl wget make git
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
echo Done

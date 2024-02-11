#!/bin/bash

sudo apt get update && sudo apt upgrade


# install packages
packages=[vim]
sudo apt-get install $packages


# docker installation
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo   "deb [ \
arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt-get install docker-compose
sudo chmod 777 /var/run/docker.sock


# git installation
sudo apt-get install git
git config --global init.defaultBranch <name>
git branch -m <name>

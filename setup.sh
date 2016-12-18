#!/bin/bash
sudo su -

# apt-get
apt-get update
apt-get upgrade

# Remove existing node
apt-get purge -y nodejs npm

# using nodebrew
curl -L git.io/nodebrew | perl - setup
echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
nodebrew install-binary stable
nodebrew use stable

# Install Avahi
apt-get install libavahi-compat-libdnssd-dev

# Node modules global path
NODE_PATH=`npm -g root`

# Install config server and multi plugin 
npm install -g --unsafe-perm homebridge-config-server
npm install -g homebridge-multi
cd $NODE_PATH/homebridge-config-server/
npm install

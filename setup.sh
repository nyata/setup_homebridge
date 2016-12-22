#!/bin/bash

# apt-get
sudo apt-get update
sudo apt-get upgrade

# Remove existing node
sudo apt-get purge -y nodejs npm

# using nodebrew
curl -L git.io/nodebrew | perl - setup
echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
sudo nodebrew install-binary stable
sudo nodebrew use stable

# Install Avahi
apt-get install libavahi-compat-libdnssd-dev

# Node modules global path
NODE_PATH=`npm -g root`

# Install config server and multi plugin 
sudo npm install -g --unsafe-perm homebridge-config-server
sudo npm install -g homebridge-multi
cd $NODE_PATH/homebridge-config-server/
npm install

# Create config.json
cd .homebridge
curl https://raw.githubusercontent.com/nfarina/homebridge/master/config-sample.json > config.json

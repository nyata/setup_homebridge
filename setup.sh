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
nodebrew install-binary stable
nodebrew use stable

# for sudo npm
sudo ln -s /home/pi/.nodebrew/current/bin/node /usr/bin/node
sudo ln -s /home/pi/.nodebrew/current/lib/node /usr/lib/node
sudo ln -s /home/pi/.nodebrew/current/bin/npm /usr/bin/npm
sudo ln -s /home/pi/.nodebrew/current/lib/npm /usr/lib/npm

# Install Avahi
sudo apt-get install libavahi-compat-libdnssd-dev

# Node modules global path
NODE_PATH=`npm -g root`

# Install config server and multi plugin 
sudo npm install -g --unsafe-perm homebridge-config-server
sudo npm install -g homebridge-multi
cd $NODE_PATH/homebridge-config-server/
sudo npm install

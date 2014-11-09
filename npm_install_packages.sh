#!/bin/sh

echo "#######################################################################"
echo "NOTE: You should only run this after installing Node manually (http://nodejs.org/download/)"
echo "#######################################################################"


packages=(
  bro
  grunt
  grunt-cli
  cordova
  ionic
  bower
)

# install packages
echo "installing Node.js packages..."
sudo npm install -g ${packages[@]}



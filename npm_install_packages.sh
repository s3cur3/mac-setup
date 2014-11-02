#!/bin/sh

echo "#######################################################################"
echo "NOTE: You should only run this after installing Node manually (http://nodejs.org/download/)"
echo "#######################################################################"


packages=(
  bro
  grunt
  ionic
)

# install packages
echo "installing Node.js packages..."
sudo npm install ${packages[@]}



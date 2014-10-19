#!/bin/sh

echo "Copying .bashrc to ~"
cp .bashrc ~/.bashrc

echo "Installing Bash It"
git clone http://github.com/revans/bash-it.git ~/.bash_it
~/.bash_it/install.sh



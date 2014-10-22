#!/bin/sh

echo "###############################################################################"
echo -e "Okay, I'm assuming you've set up Dropbox before running this, right...?\n\n"
echo "###############################################################################"


########################## Install Mackup (for backing up & restoring app settings) ##########################
sudo easy_install pip
sudo pip install mackup

# Restore settings from Dropbox
mackup restore


echo -e "\n\nApp settings restored!\n\nMoving on to step 3...\n\n"
./setup_step_3.sh

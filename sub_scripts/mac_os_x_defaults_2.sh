#!/bin/sh

chflags nohidden ~/Library
chflags nohidden /Library

# Don't ask if you really want to open this app
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Make ⌘ + F focus the search input in iTunes
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Disable all bouncing
defaults write com.apple.dock no-bouncing -bool TRUE



# Make LS work like it should
echo "alias ls='ls -GpFh'" >> ~/.bash_profile
echo "" >> ~/.bash_profile

sudo -v

echo "Adding Auria color profile"
sudo cp misc_setup/Auria_27-2.2-6500.icm /Library/ColorSync/Profiles

echo "Copying the MultiMarkdown quicklook generator"
sudo cp -R misc_setup/MultiMarkdownQuickLook.qlgenerator /Library/QuickLook/

echo "Copying the QLStephen (quicklook-any-text-file) quicklook generator"
sudo cp -R misc_setup/QLStephen.qlgenerator /Library/QuickLook/

echo "Copying the Hex Color Picker"
sudo cp -R misc_setup/HexColorPicker.colorPicker /Library/ColorPickers/

echo "Copying the Sublime Text helper"
sudo cp -R misc_setup/Marked.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/


echo "Set up SelfControl.app to have a max block length of 8 hours and a block interval of 30 mins"
defaults write org.eyebeam.SelfControl MaxBlockLength -int 480
defaults write org.eyebeam.SelfControl BlockLengthInterval -int 30



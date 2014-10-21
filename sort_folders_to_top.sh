#!/bin/sh


cd /System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/
sudo plutil -convert xml1 InfoPlist.strings
sudo vim InfoPlist.strings
sudo plutil -convert binary1 InfoPlist.strings
killall Finder

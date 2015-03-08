#!/bin/sh


echo "Installing Xcode command line tools"
xcode-select --install


########################## Install Homebrew ##########################

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update



########################## Update Unix tools ##########################
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep




########################## Set our path to use those updated Unix tools ##########################

echo -e "\nexport \$PATH=\$(brew --prefix coreutils)/libexec/gnubin:\$PATH\n" >> ~/.bash_profile


########################## Install Homebrew binaries ##########################

binaries=(
  bash-completion
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  gpgtools
  mysql
  nmap
  python
  python3
  rbenv
  sshfs
  trash
  tree
  ack
  hub
  git
  multimarkdown
  wget
)

echo "installing binaries..."
brew install ${binaries[@]}

########################## Install Python packages ##########################
packages=(
  Enum
  jira-python
  beautifulsoup
  beautifulsoup4
  matplotlib
  markdown
  numpy
  pyparsing
  pybars
)
echo "installing Python packages..."
sudo pip install ${binaries[@]}


########################## Install Homebrew Cask ##########################
brew install caskroom/cask/brew-cask


########################## Install Cask apps ##########################
apps=(
  alfred
  appcode
  aquamacs
  bettertouchtool
  bootchamp
  cakebrew
  calibre
  chicken
  daisydisk
  dia
  filezilla
  flux 
  firefox
  flash
  github
  google-drive
  itsycal
  keepassx
  marked
  max
  opera
  pandoc
  pgadmin3
  phpstorm
  pycharm
  quicklook-json
  quicksilver
  rubymine
  selfcontrol
  sequel-pro
  simple-comic
  skype
  sourcetree
  sublime-text
  totalterminal
  utorrent
  vagrant
  versions
  virtualbox
  vlc
  vmware-fusion
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Allow launching apps from Alfred
brew cask alfred link

# Update bash profile to use bash completion 
echo -e "\nif [ -f `brew --prefix`/etc/bash_completion ]; then\n    . `brew --prefix`/etc/bash_completion\nfi\n" >> ~/.bash_profile && source ~/.bash_profile



########################## Get common fonts ##########################
brew tap caskroom/fonts

fonts=(
  font-open-sans-condensed
  font-open-sans
  font-lobster
  font-antic-slab
  font-bree-serif
  font-droid-sans
  font-josefin-slab
  font-arvo
  font-ubuntu
  font-pt-sans
  font-pt-serif
  font-old-standard-tt
  font-source-sans-pro
  font-source-serif-pro
  font-raleway
  font-alegreya
  font-merriweather
  font-lato
  font-m-plus
  font-clear-sans
  font-roboto
  font-roboto-slab
  font-domine
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}


########################## Install Bash It ##########################
echo "Installing Bash It"
git clone http://github.com/revans/bash-it.git ~/.bash_it
~/.bash_it/install.sh

########################## Install RBENV ##########################
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Required by Sass
gem install compass

gem install jekyll


echo ""
echo "###############################################################################"
echo ""
echo "You'll need to manually set the following to run on startup:"
echo "- Itsycal"
echo "- Skype"
echo "- uTorrent"
echo "- Chrome"
echo "- Airmail"
echo ""
echo "You'll need to manually configure:"
echo "- BetterTouchTool"
echo "- BetterSnapTool (from App Store)"
echo ""
echo "You'll need to manually install:"
echo "- Chrome"
echo "- Office"
echo "- iWork"
echo "- Creative Suite"
echo "- MacTeX"
echo "- Node (http://nodejs.org/download/)"
echo "###############################################################################"

echo ""
echo ""
echo "###############################################################################"
echo "Okay, all done!"
echo ""
echo "Now, go set up Dropbox, and continue on to Step 2:"
echo "      ./setup_step_2.sh"
echo "###############################################################################"
echo ""
echo ""


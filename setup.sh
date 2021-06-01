#!/bin/sh

echo "Installing Xcode command line tools"
xcode-select --install


########################## Install Homebrew ##########################

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

# Clone the mac setup repo
echo "Cloning mac-setup.git"
brew install git

cd ~/Documents
mkdir repos
cd repos
git clone https://github.com/s3cur3/mac-setup.git
cd mac-setup

# Install bundle and install everything in the Brewfile
brew tap Homebrew/bundle
echo "installing apps..."
brew bundle

########################## Set our path to use the updated coreutils ##########################
echo -e "\nexport \$PATH=\$(brew --prefix coreutils)/libexec/gnubin:\$PATH\n" >> ~/.bash_profile

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
  font-fira-code
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

echo ""
echo "###############################################################################"
echo ""
echo "You'll need to manually configure:"
echo "- BetterTouchTool"
echo "- Dropbox"
echo ""
echo "You'll need to manually install:"
echo "- Office"
echo "- iWork"
echo "- Creative Suite"
echo "- MacTeX"
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


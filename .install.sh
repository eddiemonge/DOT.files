#!/bin/bash

# Make sure we start in the home directory and get the password prompt out of the way
echo "User password is needed later on"
sudo cd ~

# Xcode is needed later
open -a App\ Store
xcode-select --install

# Get the dot.files
echo "Do the dots dance"
rm -rf DOTS
git clone --recursive https://github.com/eddiemonge/DOT.files.git ~/DOTS
# Move twice to move the .files and the files
mv DOTS/{.,}* ./
rm -rf DOTS

# Run the OSX customizations
echo "Hello OSX"
./.osx

# Install brew if it isn't already
if ! `which brew` > /dev/null; then
  echo "Brew me"
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
fi

# Install ZSH and other stuff
brew install zsh
echo "ZSH it up"
which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
brew install python wget ack node trash phantomjs svn git mysql

# Customize and update npm
echo "Node, Node, Node"
npm set prefix /usr/local/share/npm/
npm install -g npm

# Doing some python stuff
echo "Ugh Python. Whhhhhyyyy?"
pip install --upgrade setuptools
pip install --upgrade distribute
pip install --upgrade pip
pip install pygments
pip install git+git://github.com/Lokaltog/powerline

# Install custom fonts
echo "Font you"
cd ~/Desktop
wget http://www.levien.com/type/myfonts/Inconsolata.otf && open Inconsolata.otf
wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf && open Inconsolata\ for\ Powerline.otf
wget https://gist.github.com/eddiemonge/8185698/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf && open Inconsolata-dz-Powerline.otf

# Install macvim
echo "Vimmy whimmy"
brew install macvim --env-std --override-system-vim
brew linkapps

# Vim setup stuff
git clone https://github.com/eddiemonge/TigerStripe.git ~/.vim/colors/TigerStripe
mv ~/.vim/colors/TigerStripe/colors/TigerStripe.vim ~/.vim/colors/TigerStripe.vim
rm -rf ~/.vim/colors/TigerStripe
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
cd ~/.vim/bundle/tern_for_vim && npm install
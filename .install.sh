#!/bin/sh

# Add different instructions for Linux/MacOSX
case "$(uname -s)" in
  Linux*)     OS=Linux;;
  Darwin*)    OS=Mac;;
  *)          echo "Unknown OS $(uname -s), quitting install" && exit 1;;
esac

# Make sure we start in the home directory and get the password prompt out of the way
echo "Sudo password is needed later on. Asking now so installation can proceed unattended"
sudo sh -c "cd $HOME"
cd "$HOME" || exit 1

# Install Chrome and VSCode
if [ "$OS" = "Mac" ]; then
  open https://www.google.com/chrome
  open https://code.visualstudio.com/download
fi

if [ "$OS" = "Mac" ]; then
  # Xcode is needed later
  xcode-select --install > /dev/null
  open -a App\ Store
  echo "Install these from the App Store: Divvy, Navicat, Skitch"
  echo "Install these manually: Alfred, Docker, iTerm2"
fi

# Get the dot.files. Can't clone the repo directly into the home folder
# as there are complaints that there are already files in it
echo "Do the dots dance"
[ -d "$HOME/DOTS" ] || git clone --recurse-submodules https://github.com/eddiemonge/DOT.files.git "$HOME/DOTS"
# Be explicit about whats being moved
mv "$HOME/DOTS/.ackrc" ./.ackrc
mv "$HOME/DOTS/.aliases" ./.aliases
mv "$HOME/DOTS/.git" ./.git
mv "$HOME/DOTS/.gitconfig" ./.gitconfig
mv "$HOME/DOTS/.gitignore" ./.gitignore
mv "$HOME/DOTS/.gitignore_global" ./.gitignore_global
mv "$HOME/DOTS/.gitmodules" ./.gitmodules
mv "$HOME/DOTS/.install.sh" ./.install.sh
mv "$HOME/DOTS/.oh-my-zsh_custom" ./.oh-my-zsh_custom
mv "$HOME/DOTS/.osx.sh" ./.osx.sh
mv "$HOME/DOTS/.profile" ./.profile
mv "$HOME/DOTS/.vim" ./.vim
mv "$HOME/DOTS/.vimrc" ./.vimrc
mv "$HOME/DOTS/.zshrc" ./.zshrc
mv "$HOME/DOTS/README.md" ./README.md
mv "$HOME/DOTS/Settings" ./Settings
rm -rf "$HOME/DOTS"

# Just in case git did not do the submodules
git submodule update --init --recursive

# Run the OS customizations
#   TODO These need to be updated and fixed
if [ "$OS" = "Mac" ]; then
  echo "Hello OSX"
  sh .osx.sh
fi

# Linux needs some things installed first
if [ "$OS" = "Linux" ]; then
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install build-essential curl file git
fi

# Install brew if it isn't already
echo "Brew me"
if [ ! "$(which brew)" ]; then
  if [ "$OS" = "Mac" ]; then 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif [ "$OS" = "Linux" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    brew install gcc
  fi
fi

# Install some supporting software
brew install bat prettyping fzf fd
if [ "$OS" = "Mac" ]; then
  brew install trash git ack wget zsh
elif [ "$OS" = "Linux" ]; then
  sudo apt-get install ack wget zsh
fi

# Install fzf useful key bindings and fuzzy completion:
"$(brew --prefix)/opt/fzf/install" --no-completion --no-bash --no-zsh --no-fish --no-key-bindings

# Install ZSH and other stuff
echo "ZSH it up"
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"
# shellcheck source=/dev/null
. "$HOME/.zshrc"

# Install nvm, NodeJS and update npm
echo "Node, Node, Node"
nvm install node
nvm alias default node
nvm upgrade
npm install -g npm

# Doing some python stuff
# Only need powerline fonts in vim so this is not necessary on Linux
if [ "$OS" = "Mac" ]; then
  echo "Ugh Python. Whhhhhyyyy?"
  pip3 install --upgrade pip setuptools wheel
  pip3 install pygments powerline-status
fi

# Install custom fonts
if [ "$OS" = "Mac" ]; then
  echo "Font you"
  builtin cd "$HOME/Desktop" || exit 1
  wget http://www.levien.com/type/myfonts/Inconsolata.otf && open Inconsolata.otf
  wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf && open Inconsolata\ for\ Powerline.otf
  wget https://gist.github.com/eddiemonge/8185698/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf && open Inconsolata-dz-Powerline.otf
fi

# Install macvim
echo "Vimmy whimmy"
if [ "$OS" = "Mac" ]; then
  brew install macvim
elif [ "$OS" = "Linux" ]; then
  sudo apt-get install vim-nox
fi

# Vim setup stuff
vim +PluginInstall +qall

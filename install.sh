#!/bin/sh

# Add different instructions for Linux/MacOSX
case "$(uname -s)" in
  Linux*)     OS=Linux;;
  Darwin*)    OS=Mac;;
  *)          echo "Unknown OS $(uname -s), quitting install" && exit 1;;
esac

# Ask for the administrator password upfront
echo "Sudo password is needed later on. Asking now so installation can proceed unattended"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we start in the home directory
cd "$HOME" || exit 1

# Install Chrome, VSCode and iTerm2
if [ "$OS" = "Mac" ]; then
  # https://apple.stackexchange.com/questions/73926/is-there-a-command-to-install-a-dmg
  function installdmg {
      tempd=$(mktemp -d)
      curl -L $1 > "$tempd"/pkg.dmg
      listing=$(sudo hdiutil attach $tempd/pkg.dmg | grep Volumes)
      volume=$(echo "$listing" | cut -f 3)
      if [ -e "$volume"/*.app ]; then
        sudo cp -rf "$volume"/*.app /Applications
      fi
      sudo hdiutil detach "$(echo "$listing" | cut -f 1)"
      rm -rf "$tempd"
  }
  function installzip {
      tempd=$(mktemp -d)
      curl -L $1 > "$tempd"/file.zip
      unzip -q "$tempd"/file.zip -d "$tempd"
      if [ -e "$tempd"/*.app ]; then
        sudo cp -rf "$tempd"/*.app /Applications
      fi
      rm -rf "$tempd"
  }

  [ ! -d "/Applications/Google Chrome.app" ] && \
    echo "Installing Chrome" && \
    installdmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
  [ ! -d "/Applications/Docker.app" ] && \
    echo "Installing Docker" && \
    installdmg https://desktop.docker.com/mac/main/arm64/Docker.dmg
  [ ! -d "/Applications/Visual Studio Code.app" ] && \
    echo "Installing VSCode" && \
    installzip https://update.code.visualstudio.com/latest/darwin/stable
  [ ! -d "/Applications/iTerm.app" ] && \
    echo "Installing iTerm2" && \
    installzip https://iterm2.com/downloads/stable/latest
fi

# Linux needs some things installed first
if [ "$OS" = "Linux" ]; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y install build-essential curl file git
fi

# Install brew if it isn't already
echo "Brew me"
if [ ! "$(which brew)" ]; then
  if [ "$OS" = "Mac" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install trash git ack wget zsh
  elif [ "$OS" = "Linux" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install gcc
    sudo apt-get -y install ack wget zsh
  fi

  # Install some supporting software
  brew install bat prettyping fzf fd
else
  brew update
  brew upgrade
fi

# Get the DOT.files. Can't clone the repo directly into the home folder
# as there are complaints that there are already files in it
echo "Do the dots dance"
if [ ! -d "$HOME/.dot.files" ]; then
  git clone --recurse-submodules https://github.com/eddiemonge/DOT.files.git "$HOME/.dot.files"
  builtin cd "$HOME/.dot.files" && { \
    # Just in case git did not do the submodules
    git submodule update --init --recursive ; \
    git remote set-url origin git@github.com:eddiemonge/DOT.files.git ; \
    builtin cd -; \
  }
else
  builtin cd "$HOME/.dot.files" && { \
    git pull origin master ; \
    git submodule update ; \
    builtin cd -; \
  }
fi

# Copy the files over
rsync -avhq --no-perms "$HOME/.dot.files/files/" "$HOME"

# Run the OS customizations
# TODO These need to be updated and fixed
if [ "$OS" = "Mac" ]; then
  echo "Hello OSX"
  sh "$HOME/.dot.files/macos.sh"
fi

# Install fzf useful key bindings and fuzzy completion:
"$(brew --prefix)/opt/fzf/install" --no-completion --no-bash --no-zsh --no-fish --no-key-bindings

# Install zsh helpers
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
fi
if [ ! -d "$HOME/.oh-my-zsh_custom/plugins/zsh-nvm" ]; then
  git clone https://github.com/lukechilds/zsh-nvm "$HOME/.oh-my-zsh_custom/plugins/zsh-nvm"
fi

# Install ZSH and other stuff
if [ "$SHELL" = "/usr/local/bin/zsh" ]; then
  echo "Already using zsh"
else
  echo "ZSH it up"
  which zsh | sudo tee -a /etc/shells
  sudo chsh -s "$(which zsh)"
fi
. "$HOME/.zshrc"

# Doing some python stuff
# Only need powerline fonts in vim so this is not necessary on Linux
if [ "$OS" = "Mac" ]; then
  if [ ! "$(which pygmentize)" ]; then
    echo "Ugh Python. Whhhhhyyyy?"
    pip3 install --upgrade --user pip setuptools wheel
    pip3 install --user pygments powerline-status
  fi
fi

# Install custom fonts
if [ "$OS" = "Mac" ]; then
  if [ ! -f "$HOME/Library/Fonts/Inconsolata.otf" ]; then
    echo "Font install"
    builtin cd "$HOME/Library/Fonts" && { \
      curl -L -O 'http://www.levien.com/type/myfonts/Inconsolata.otf' ; \
      curl -L -O 'https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf' ; \
      curl -L -O 'https://gist.github.com/eddiemonge/8185698/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf' ; \
      builtin cd -; \
    }
  fi
fi

# Install vim
echo "Vimmy whimmy"
if [ "$OS" = "Mac" ]; then
  brew install macvim
elif [ "$OS" = "Linux" ]; then
  sudo apt-get -y install vim-nox
fi

# Vim setup stuff
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  vim +PluginInstall +qall
else
fi

# Cleanup
echo "Cleaning up..."
brew cleanup

echo "All done!"

if [ "$OS" = "Mac" ]; then
  if [ ! -d "/Applications/Google Chrome.app" ]; then
    open -a App\ Store
    echo "Install these from the App Store: Divvy, Navicat, Skitch"
    open -a https://www.alfredapp.com/
    echo "Install this manually: Alfred"
  fi
fi

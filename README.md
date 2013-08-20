These are my custom DOTfiles. 

They go into the user's home directory

There are a lot of ignored files because I don't want them tracked or they are
app specific files that don't matter to version control.


Setup Instructions:

# Copy all the files to home directory ( ~/ )
# Install homebrew on mac
# Command line instructions after installing homebrew

# Install zsh
    brew install zsh

# Edit /etc/shells and add /usr/local/bin/zsh
    chsh -s $(which zsh)

    brew install python
    pip install --upgrade distribute
    pip install --upgrade pip

    brew install macvim --env-std --override-system-vim
    pip install pygments

    brew install wget
    wget http://www.levien.com/type/myfonts/Inconsolata.otf && open Inconsolata.otf
    wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf && open Inconsolata\ for\ Powerline.otf

    brew install ack

    brew install node

    pip install --user git+git://github.com/Lokaltog/powerline
    ~/.vim-update_bundles

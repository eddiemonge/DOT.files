These are my custom DOTfiles. 

They go into the user's home directory

There are a lot of ignored files because I don't want them tracked or they are
app specific files that don't matter to version control.


### Setup Instructions:

* Copy all the files to home directory ( ~/ )

    cd ~
    git submodule init && git submodule update

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

    brew install zsh

    which zsh | sudo tee -a /etc/shells

    chsh -s $(which zsh)

    brew install python wget ack node

    pip install --upgrade setuptools
    pip install --upgrade distribute
    pip install --upgrade pip

    brew install macvim --env-std --override-system-vim

    pip install pygments

    wget http://www.levien.com/type/myfonts/Inconsolata.otf && open Inconsolata.otf
    wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf && open Inconsolata\ for\ Powerline.otf

    pip install --user git+git://github.com/Lokaltog/powerline

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
    
    brew linkapps
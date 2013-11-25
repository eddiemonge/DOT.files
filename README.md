# My custom DOTfiles

They go into the user's home directory

There are a lot of ignored files because I don't want them tracked or they are
app specific files that don't matter to version control.

## Setup Instructions:

    git clone --recursive https://github.com/eddiemonge/DOT.files.git ~/DOTS
    mv ~/DOTS/* ~/
    mv ~/DOTS/* ~/
    cd ~

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

    wget http://www.levien.com/type/myfonts/Inconsolata.otf && open Inconsolata.otf && rm Inconsolata.otf
    wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf && open Inconsolata\ for\ Powerline.otf && rm Inconsolata\ for\ Powerline.otf

    pip install --user git+git://github.com/Lokaltog/powerline

    git clone https://github.com/eddiemonge/TigerStripe.git ~/.vim/colors/TigerStripe
    mv ~/.vim/colors/TigerStripe/colors/TigerStripe.vim ~/.vim/colors/TigerStripe.vim
    rm -rf ~/.vim/colors/TigerStripe

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

    brew linkapps

    ./.osx



# Vim Help Section

### Code Folding
* `zf(motion)` Fold code
* `zo` (on a fold) Open fold


### Diffing
* `:diffthis` Set a buffer to be diffed. Needs two for the diff
* `:diffoff` Turn off diff mode


### Change the surrounding elements
* `ci{w}`  Change inner {|w|ord, |',"|quotes, |{|braces/paren, etc}
* `cs"'` to change quotes inside
* `cs'<em>` to change quote to a block
* `cst"` change a block to quotes
* `ds"` or dst to remove surrounding
* `ysiw'` surround a word
* `yss"` surround line
* `VS<p>` adding surround with visual editor


### A wrapper for git
* `:Gedit/Gsplit/Gvsplit` to edit the file and stage it on save
* `:Gdiff` to view the changes
* `:Gstatus` to see a list of changes. -|p to add/reset
* `:Gblame` to see blames. enter to edit the commit or o to open in a split
* `:Gremove`
* `:Gmove`
* `:Gbrowse` to see the file on github


### ACK for searching
* `:Ack [options] {pattern} [{directory}]`
* `go` to preview file (open but maintain focus on ack.vim results)
* `t` to open in new tab
* `T` to open in new tab silently
* `h` to open in horizontal split
* `H` to open in horizontal split silently
* `v` to open in vertical split
* `gv` to open in vertical split silently
* `q` to close the quickfix window


### Toggle comments on lines
* `gcc` Comment a line
* `gc(motion)` comment a motion


### Working with split windows
* `Ctrl-W t Ctrl-W K` To change two vertically split windows to horizonally split
* `Ctrl-W t Ctrl-W H` Horizontally to vertically:

Explanations:

    Ctrl-W t     makes the first (topleft) window current
    Ctrl-W K     moves the current window to full-width at the very top
    Ctrl-W H     moves the current window to full-height at far left

The Ctrl-W t part can be ignored if only two windows


# Sessions:
* `F2` Save a session
* `F3` Restore a session

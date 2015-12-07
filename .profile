# Path Stuff
# Local bins
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$(npm get prefix)/bin:$PATH
export PHANTOMJS_BIN=$(which phantomjs)
export NODE_PATH=$(npm get prefix)/lib/node_modules

# Set vim as default editor
export SVN_EDITOR=vim
export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load aliases and things after path
for file in $HOME/.{secrets,aliases,aliases_custom,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

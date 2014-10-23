# Path Stuff
# Local bins
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# export PATH=/usr/local/share/npm/bin:$PATH
# export PATH=$(npm get prefix)/bin:$PATH
export PATH=/Applications/Android/platform-tools:$PATH
export PATH=/Applications/Android\ Studio.app/sdk/platform-tools:$PATH
export PHANTOMJS_BIN=$(which phantomjs)
export NODE_PATH=$(npm get prefix)/lib/node_modules

export VAGRANT_VMWARE_CLONE_DIRECTORY="~/Documents/Virtual Machines"
export VAGRANT_DEFAULT_PROVIDER="virtualbox"

# Set vim as default editor
export SVN_EDITOR=vim
export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load aliases and things after path
for file in ~/.{secrets,aliases,aliases_custom,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

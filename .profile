# Path Stuff
# Local bins
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# export PATH=$(npm get prefix)/bin:$PATH
# export NODE_PATH=$(npm get prefix)/lib/node_modules

export GPG_TTY=$(tty)

# Set vim as default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


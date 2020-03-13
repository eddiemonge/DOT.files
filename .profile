# Path Stuff

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Local bins
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# LinuxBrew for WSL
test -d /home/linuxbrew/.linuxbrew && export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
test -d /home/linuxbrew/.linuxbrew && eval $($(brew --prefix)/bin/brew shellenv)

export GPG_TTY=$(tty)

# Set vim as default editor
export EDITOR='vim'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

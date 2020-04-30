# Default user name
DEFAULT_USER=`whoami`

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh_custom

# Set name of the theme to load
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="em-dots-custom"

# Hyphen-insensitive completion. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Partial file matching
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

# Lazy load nvm
# See https://github.com/lukechilds/zsh-nvm/tree/master#lazy-loading
export NVM_LAZY_LOAD=true

# Auto install and load the Node version specified in .nvmrc files
# See https://github.com/lukechilds/zsh-nvm/tree/master#auto-use
export NVM_AUTO_USE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins+=(git zsh-nvm)

# Make commands come after a new line to distinguish output
PS1="
$PS1
"

# Add a separator after the command to make it easier to distinguish output
preexec () {
  printf '%*s\n' $(($COLUMNS-1)) '' | tr ' ' -
}

# Loads zsh config
source $ZSH/oh-my-zsh.sh

# Load custom profile, normal profile and custom zshrc files
for file in $HOME/.{zshrc_custom,profile_custom,profile}; do
  [ -r "$file" ] && source "$file"
done

# Load aliases and things after path
for file in $HOME/.{secrets,aliases,aliases_custom,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Default user name
DEFAULT_USER="eddie"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bower git npm sublime svn svn-n)

source $ZSH/oh-my-zsh.sh

# Make commands come after a new line to distinguish output
PS1="
$PS1
"

# Add a separate after the command to make it easier to distinguish output
preexec () { 
  printf '%*s\n' $(($COLUMNS-1)) '' | tr ' ' -
}

# Customize to your needs...
source $HOME/.profile

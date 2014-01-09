# Default user name
DEFAULT_USER=`whoami`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=eddie
ZSH_CUSTOM=$HOME/.ohmyzsh-mine

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn svn-n)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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

# Load RVM into a shell session *as a function*
if which rvm > /dev/null; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

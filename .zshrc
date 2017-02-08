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
plugins=(git)

# Path to your oh-my-zsh configuration.		
ZSH=$HOME/.oh-my-zsh

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

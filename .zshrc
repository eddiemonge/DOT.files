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

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# if /usr/local/bin/rbenv --version > /dev/null; then
#   export RBENV_ROOT=/usr/local/var/rbenv
#   eval "$(/usr/local/bin/rbenv init -)"
# else
#   # Brew ruby
#   export PATH=/usr/local/opt/ruby/bin:$PATH
#   echo "Using System Ruby"
#   # You may want to add this to your PATH. After upgrades, you can run
#   #   gem pristine --all --only-executables
# fi


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

# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-2.1.0

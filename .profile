for file in ~/.{secrets,aliases,aliases_custom,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Path Stuff
# Local bins
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/git/bin/git:$PATH"
export PATH="/opt/subversion/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Android/platform-tools:$PATH"

export PHANTOMJS_BIN=$(which phantomjs)

# RVM
export PATH="/usr/local/opt/ruby/bin:$PATH" # Add Ruby/gem to PATH for scripting

# Set vim as default editor
export SVN_EDITOR=vim
export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

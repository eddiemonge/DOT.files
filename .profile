for file in ~/.{secrets,aliases,aliases_custom,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Path Stuff
# Local bins
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/opt/subversion/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Android/platform-tools:$PATH"

# RVM 
[[ -s "/Users/eddie/.rvm/scripts/rvm" ]] && source "/Users/eddie/.rvm/scripts/rvm"
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

# Set vim as default editor
export SVN_EDITOR=vim
export EDITOR=vim

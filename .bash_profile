# Secret info
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

# Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Custom Aliases on a per computer basis
if [ -f ~/.aliases_custom ]; then
	source ~/.aliases_custom
fi

# Custom Path
if [ -f ~/.bash_profile_custom ]; then
  source ~/.bash_profile_custom
fi

# Path Stuff
# Local bins
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/opt/subversion/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/Applications/Android/platform-tools:$PATH"
export PATH="/Users/eddie/.pear/bin:$PATH"
export SVN_EDITOR="mvim -f"

# RVM 
[[ -s "/Users/eddie/.rvm/scripts/rvm" ]] && source "/Users/eddie/.rvm/scripts/rvm"

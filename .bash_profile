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

# RVM 
[[ -s "/Users/eddie/.rvm/scripts/rvm" ]] && source "/Users/eddie/.rvm/scripts/rvm"

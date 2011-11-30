# Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi


# Aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi


# Path Stuff
# Local bins
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# PHP and MySQL
export PATH="/usr/local/php5/bin:/usr/local/mysql/bin:$PATH"
# Android SDK
export PATH="/Developer/android-sdk-mac_x86/platform-tools:$PATH"
# JSLint
export PATH="/usr/lib/jsl-0.3.0-mac:$PATH"
# CTags
export PATH="/usr/local/bin/ctags:$PATH"
# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
# Markdown
export PATH="/usr/lib/Markdown_1.0:$PATH"
# Dojo
export DOJO_HOME="/usr/local/lib/dojo/1.6.1"

# Custom Path
if [ -f ~/.bash_profile_custom ]; then
  source ~/.bash_profile_custom
fi

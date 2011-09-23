# Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi


# Aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi


# Path Stuff
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/php5/bin:/usr/local/mysql/bin:/Developer/android-sdk-mac_x86/platform-tools:$PATH"

# JSLint
export PATH="/usr/lib/jsl-0.3.0-mac:$PATH"


# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

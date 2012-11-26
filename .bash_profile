# load generic bash commands
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# load custom file for any non generic commands
if [ -f ~/.bash_profile_custom ]; then
    . ~/.bash_profile_custom
fi

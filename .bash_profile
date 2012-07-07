# load generic bash commands
if [ -f /etc/skel/.bash_profile ]; then
    . /etc/skel/.bash_profile
fi

# load generic bash commands
if [ -f ~/.bash_generic ]; then
    . ~/.bash_generic
fi

# load custom file for any non generic commands
if [ -f ~/.bash_profile_custom ]; then
    . ~/.bash_profile_custom
fi

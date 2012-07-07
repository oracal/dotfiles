# load default bashrc for os
if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi

# load generic bash commands
if [ -f ~/.bash_generic ]; then
    . ~/.bash_generic
fi

# load custom file for any non generic commands
if [ -f ~/.bashrc_custom ]; then
    . ~/.bashrc_custom
fi


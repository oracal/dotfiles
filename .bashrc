# load default bashrc for os
if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi

# load generic bash commands
if [ -f ~/.bashr_generic ]; then
    . ~/.bashr_generic
fi


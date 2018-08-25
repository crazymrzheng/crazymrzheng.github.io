
#Setting command line color

export  PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;33m\]@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#export PS1="\[\e[32m\][\[\e[32m\]\u\[\e[m\]@\[\e[36m\]\h:\[\e[33m\]\W\[\e[32m\]]\[\e[37m\]$\[\e[m\] "

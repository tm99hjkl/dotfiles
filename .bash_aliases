#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='exa'
alias ll='exa -alF'
alias la='exa -a'
alias l='exa'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# tm aliases
alias tm='cd /mnt/c/Users/takumi\ matsuura'
alias sql='psql -U postgres -h localhost -d meteor'
alias clip='clip.exe'
alias deln="cat | sed -z 's/\n/ /g' | clip"
alias dels="cat | sed -z 's/ *\/\/\///g' | deln"
alias fix_clock='sudo hwclock --hctosys'
alias haskell='cd ~/work/my-misc-lib/haskell'
alias k='cd ~/work/my-misc-lib/k'
alias lg='lazygit'
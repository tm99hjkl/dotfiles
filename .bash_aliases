#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
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
alias aliases='hx ~/.bash_aliases; cd ~/dotfiles'
alias bat="bat -p --theme=Nord"
alias clip='xsel -bi'
alias deln="cat | sed -z 's/\n/ /g' | clip"
alias dels="cat | sed -z 's/ *\/\/\///g' | deln"
alias e='explorer.exe'
alias emacs='emacs -nw'
alias f='fzf --cycle --height=40 --preview='\''bat {} -p --color always --theme=Nord'\'' --bind '\''enter:execute-silent(cat {} | xsel -bi && echo done)'\'' --bind '\''ctrl-d:execute(rm -i {})'\'''
alias fix_clock='sudo hwclock --hctosys'
alias hxrc='hx ~/.config/helix/config.toml'
alias lg='lazygit'
alias objdump="objdump --visualize-jumps=color"
alias pc='echo -n $(pwd) | clip'
alias py3='python3'
alias sbcl='rlwrap sbcl'
alias snip="cd ~/ghq/github.com/tm99hjkl/snip"
alias t='tree -d -L 1'
alias tc="TZ=Asia/Tokyo date +\"%Y-%m-%d\" | tr -d '\n' | clip"
alias tm='cd /mnt/c/Users/takumi\ matsuura'
alias today="TZ=Asia/Tokyo date +\"%Y-%m-%d\" | tr -d '\n'"
alias tt='tree -d -L 2'
alias ttt='tree -d -L 3'
alias unc="cat | sed -z -e 's:[\/ ]\* ::g; s: \*\/::g; s:\n: :g' | clip"

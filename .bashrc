# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -a -h -l --color=auto'
alias lsg='ls | grep'
alias lsf='ls -a -h -l *.*'
alias lsl='ls -lhFA | less'

# network
alais gg='ping google.com'
alias localhost='w3m localhost'
alias dnsup='savepoint ; cd ~/Documents/docker/pihole ; sudo docker-compose up -d ; returnsave'
alias dnsdown='savepoint ; cd ~/Documents/docker/pihole ; sudo docker-compose down ; returnsave'
alias resolvup='sudo systemctl enable systemd-resolved ; sudo systemctl start systemd-resolved ; sudo systemctl restart systemd-resolved '
alias resolvdown='sudo systemctl disable systemd-resolved ; sudo systemctl stop systemd-resolved sudo systemctl restart systemd-resolved'
alias piup='resolvdown ; dnsup '
alias pidown='dnsdown ; resolvup'
alias p8='ping -w 3 8.8.8.8'
alias vpnon=''
alias pnmap='sudo nmap -sn 192.168.0.0/24'
alias vpnoff=''
alias wireshark='sudo wireshark &'
alias pubip='curl ip.me'
alias privip='ip addr | grep 192.168 ; ip addr | grep 10.' 
alias www='w3m'
alias toron='systemctl start tor.service'
alias toroff='systemctl stop tor.service'

# files
alias savepoint='pwd > ~/.path && echo path saved to $(pwd)'
alias returnsave='cd $(cat ~/.path) && echo path returned to $(pwd)'
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias cd..='cd ..'
alias cp='echo jeffreyepstein ; sudo cp -d -r'
alias mkdir='mkdir -v'
alias mkcd='mkdircd(){ mkdir $1; cd $1; }; mkdircd'
alias cdls='cdls(){ cd $1; ls; }; cdls'
alias cdrm='cdrm(){ cd ..; rm $1; }; cdrm'
alias catg='catg(){ cat $1 | grep $2; }; catg'
alias snipe='snipe(){ savepoint ; cd $1 ; rm $2 ; returnsave }; smipe'
alias cx='chmod +x'
alias rm='sudo rm -I -v -d -r'

# docker
alias docekr='sudo docker'
alias dockr='sudo docker'
alias doker='sudo docker'
alias dokcer='sudo docker'
alias docker='sudo docker'
alias dco='docker-compose'
alias dcou='docker-compose up'
alias dcod='docker-compose down'
alias dcoud='docker-compose up -d'
alias dockercompose='sudo docker-compose'
alias docker-compose='sudo docker-compose'
alias dockercompose='sudo docker-compose'

# fun
alias unix='cowsay -f gnu "Unix is love, Unix is life" | lolcat'
alias apple='cowsay -f sheep "I love macos" | lolcat'
alias cowquote='fortune | cowsay | lolcat'
alias map='telnet mapscii.me'
alias countryroad='cd ~'
alias oneko='oneko &'
alias zsnes='cd ~/Downloads/rom ; zsnes &'
alias tableflip="echo '(°□°)︵ ━' | lolcat"
alias tabledown="echo '─ノ( º _ ºノ)'"
alias fuck=tableflip
alias shit=tableflip
alias animation='docker ps ; savepoint ; gotop ; cd ~ ; pwd ; cd / ; pwd ; ls ; unix ; apple ; cowquote ; sl ; p8 ; tree ; piup ; pidown ; fizzbuzz ; neofetch ; traceroute 8.8.8.8 ; curl wttr.in/Paris ; curl wttr.in/Tokyo ; curl wttr.in/Newyork ; cp ; fuck ; aptu ; cmatrix ; map ; returnsave ; quotec'
alias weather='curl wttr.in/'
alias quotec='while (true) ; do cowquote & sleep 7 ; done'
alias lmfao='echo lmfao'

# simplify
alias sd='sudo'
alias cls='clear'
alias please='sudo'
alias pls='sudo'
alias aptu='sudo apt update ; sudo apt upgrade -y ; sudo apt full-upgrade - y; sudo apt autoremove -y ; sudo remove --purge -y ; sudo apt clean ; sudo apt autoclean'
alias asearch='sudo apt search'
alias areinstall='sudo apt reinstall'
alias sys='sudo systemctl'
alias ainstall='sudo apt install -y'
alias aremove='sudo apt remove -y'
alias bye='sudo poweroff'
alias brb='sudo reboot'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias killn='pkill'
alias gerp='grep'
alias uso='sudo'
alias ps='ps auxf'
alias top='gotop'
alias tgz='tar -zxvf'
alias tbz='tar -jxvf'
alias pdw='pwd'
alias vi='sudo vim'
alias s='sudo '
alias yd='youtube-dl'
alias q='exit'
alias vim='sudo vim'

# troubleshoot
alias hisg='history | grep'
alias aliase='vim ~/.bashrc'
alias aliasg='alias | grep'
alias aliasl='alias | less'
alias his='history'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias crone='sudo vim /etc/crontab'

# video
alias listvideos='ls | egrep -i $VIDEO_TYPE | sort -h'
alias listvideosR='find . | egrep -i $VIDEO_TYPE | sort -h'
alias playvideos='listvideos | xargs -d "\n" mpv'
alias playvideosr='listvideos | sort -R | xargs -d "\n" mpv'
alias playvideosR='listvideosR | xargs -d "\n" mpv'
alias playvideosRr='listvideosR| sort -R | xargs -d "\n" mpv'

# git
alias gap='git add --patch'
alias gd='git diff'
alias gca='git commit -a'
alias gc='git clone'
alias gco='git commit'
alias gp='git push'
alias gb='git branch'
alias gs='git status'

# interview question
alias fizzbuzz='for i in {1..100}; do

    echo -n "$i"
    
    if (( i % 3 == 0 )); then # or if (( i / 3 * 3 == i )); then
        echo -ne "\\rFizz" # \r deletes the line
        three="1" # bool, divisible by 3
	sleep 1
    fi
    
    if (( i % 5 == 0 )); then
        if (( three )); then
            echo -ne "Buzz" # add to Fizz
        else
            echo -ne "\\rBuzz" # delete the line
        fi
	sleep 1
    fi
    
    echo # newline
    
    three=""

done'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

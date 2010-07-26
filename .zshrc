HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PAGER='less'
EDITOR='vim'
VISUAL='vim'
BROWSER=firefox
DISPLAY=:0
MOZ_DISABLE_PANGO=1
PATH=~/bin:$PATH
MANPAGER='/usr/bin/most -s'

autoload -U promptinit
promptinit
prompt adam2

unlimit
limit stack 8192
limit core 0
limit -s

autoload -Uz compinit
compinit
zmodload -a colors
autoload colors && colors
zmodload -a autocomplete
zmodload -a complist
autoload -U zcalc
setopt extendedglob
setopt menucomplete

setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -CF'
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'
alias df='df --human-readable'
alias du='du --human-readable'
alias grep='grep --color=auto'
alias w3m='w3m -cookie'
alias tkabber='wish8.5 ~/bin/tkabber/tkabber.tcl'

alias -s html=w3m
alias -s htm=w3m
alias -s org=w3m
alias -s txt=vim

if [ -f /usr/bin/grc ]; then
  alias ping="grc --colour=auto ping"
  alias traceroute="grc --colour=auto traceroute"
  alias make="grc --colour=auto make"
  alias diff="grc --colour=auto diff"
  alias cvs="grc --colour=auto cvs"
  alias netstat="grc --colour=auto netstat"
fi


zstyle :compinstall filename '/home/s7ang3r/.zshrc'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:killall:*' command 'ps -au $USER -o cmd'
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

xset b off
xset m 6/7 1
xrdb -load -all /home/s7ang3r/.Xdefaults


if [[ ${TERM} == "screen-bce" || ${TERM} == "screen" || ${TERM} == "linux" ]]; then
  #precmd () { print -Pn "\033k\033\134\033k%m[%1d]\033\134" }
  #preexec () { print -Pn "\033k\033\134\033k%m[$1]\033\134" }
  else
  precmd () { print -Pn "\e]0;%n@%m: %~\a" }
  preexec () { print -Pn "\e]0;%n@%m: $1\a" }
fi

if [ "$TERM" = "screen" ]; then
 clear
fi
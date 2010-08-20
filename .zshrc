source /etc/profile
################################################################################
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
PAGER='less'
EDITOR='vim'
VISUAL='vim'
BROWSER=firefox
DISPLAY=:0
MOZ_DISABLE_PANGO=1
PATH=~/bin:$PATH
MANPAGER='/usr/bin/most -s'
################################################################################
autoload -U promptinit
promptinit
prompt adam2
################################################################################
unlimit
limit stack 8192
limit core 0
limit -s
umask 022
################################################################################
autoload -Uz compinit
compinit
zmodload -a colors
autoload colors && colors
zmodload -a autocomplete
zmodload -a complist
autoload -U zcalc
setopt extendedglob
setopt menucomplete
################################################################################
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent noclobber
setopt autopushd pushdminus extendedglob rcquotes
setopt zle multibyte numeric_glob_sort histexpiredupsfirst histfindnodups
setopt hist_ignore_all_dups hist_ignore_space inc_append_history
################################################################################
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
################################################################################
alias -s html=w3m
alias -s htm=w3m
alias -s txt=$PAGER
alias -s py=python
alias -s {avi,mpeg,mpg,mov,m2v,flv,ogm,mkv}=mplayer
alias -s {ogg,mp3,wav}=mpg321
alias -s {png,gif,jpg,jpeg}=feh
alias -s {pdf,djvu}=evince
if [ -f /usr/bin/grc ]; then
    alias ping="grc --colour=auto ping"
    alias traceroute="grc --colour=auto traceroute"
    alias make="grc --colour=auto make"
    alias diff="grc --colour=auto diff"
    alias cvs="grc --colour=auto cvs"
    alias netstat="grc --colour=auto netstat"
fi
################################################################################
zstyle :compinstall filename '/home/s7ang3r/.zshrc'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:killall:*' command 'ps -au $USER -o cmd'
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
################################################################################
xset b off
xset m 6/7 1
xrdb -load -all /home/s7ang3r/.Xdefaults
################################################################################
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
################################################################################
mkd() { mkdir $1; cd $1 }
unpack()
{
    if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2)   tar xjf $1        ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1       ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1     ;;
        *.tar)       tar xf $1        ;;
        *.tbz2)      tar xjf $1      ;;
        *.tgz)       tar xzf $1       ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1    ;;
        *)           echo "Cannot unpack '$1'..." ;;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}
pack()
{
    if [ $1 ] ; then
    case $1 in
        tbz)   tar cjvf $2.tar.bz2 $2      ;;
        tgz)   tar czvf $2.tar.gz  $2   ;;
        tar)  tar cpvf $2.tar  $2       ;;
        bz2)bzip $2 ;;
        gz)gzip -c -9 -n $2 > $2.gz ;;
        zip)   zip -r $2.zip $2   ;;
        7z)    7z a $2.7z $2    ;;
        *)     echo "'$1' Cannot be packed via pack()" ;;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

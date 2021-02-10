#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
 
#===================={ Autoload }====================
autoload -Uz vcs_info #Git status for prompt
autoload -U colors && colors #load colors
autoload compinit && compinit -i #tab complementation
autoload -U select-word-style && select-word-style bash #https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
autoload colors; colors;
autoload -U add-zsh-hook #ZSH hook system for update the prompt dynamicly
autoload -U url-quote-magic #URL completion
zle -N self-insert url-quote-magic
zle -N edit-command-line
bindkey "^[m" copy-prev-shell-word
compinit
bindkey -e #For shortcuts
#set -g default-terminal "screen-256color"

#===================={  Setopt  }====================
#setopt correct #spelling correction for commands
setopt multios #implicit tees or cats when multiple redirections are attempted
setopt cdablevarS #if the argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory. 
setopt prompt_subst #turns on command substitution in the prompt
setopt long_list_jobs #Print job notifications in the long format by default.
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol #output flow control via start/stop characters (usually assigned to ^S/^Q) is disabled in the shell’s editor.
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word #If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends. 
setopt always_to_end #If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word
setopt AUTO_CD #If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory
setopt NO_BEEP #No system BEEP

#===================={ zstyle }====================
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;33=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off
#GIt
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

#===================={ export }====================
export EDITOR="vim"
export PAGER="most" #Needed for man color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=/usr/bin/vim
export GREP_COLOR=31
export PASSWORD_STORE_GENERATED_LENGTH=32
export AWS_VAULT_BACKEND=pass
export AWS_SDK_LOAD_CONFIG=true
export PATH="$HOME/.tfenv/bin:$PATH"
# Color on man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
#===================={ Prompt }====================
theme_precmd () {
        vcs_info
}

local branch='${vcs_info_msg_0_}%{$reset_color%}'
# Shell PS
PROMPT='%{$fg[yellow]%}[%*]%{$reset_color%} %{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} %{$fg[cyan]%}%1d%{$reset_color%} ${vcs_info_msg_0_} » '
#RPS1='${vcs_info_msg_0_} '
RPS1="${return_code}"
add-zsh-hook precmd theme_precmd
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
# CHANGE LS COLORS
LS_COLORS='di=1;33:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.tar=31:*.gz=31'

#===================={ Functions }====================
extract () {
    if [ -f $1 ]
    then
        case $1 in
            (*.7z) 7z x $1 ;;
            (*.lzma) unlzma $1 ;;
            (*.rar) unrar x $1 ;;
            (*.tar) tar xvf $1 ;;
            (*.tar.bz2) tar xvjf $1 ;;
            (*.bz2) bunzip2 $1 ;;
            (*.tar.gz) tar xvzf $1 ;;
            (*.gz) gunzip $1 ;;
            (*.tar.xz) tar Jxvf $1 ;;
            (*.xz) xz -d $1 ;;
            (*.tbz2) tar xvjf $1 ;;
            (*.tgz) tar xvzf $1 ;;
            (*.zip) unzip $1 ;;
            (*.Z) uncompress ;;
            (*) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "Error: '$1' is not a valid file!"
        exit 0
    fi
}

function commit {
    git commit -m "`echo "$*" | sed -e 's/^./\U&\E/g'`"
}

function checksec {
		sudo rkhunter --checkall --cronjob
		sudo chkrootkit > /tmp/chkrootkit.log
}
#===================={ alias }====================
alias co='git commit'
alias fuck='sudo !!'
alias psg='ps aux | grep'
alias t='tmux -u'
alias p='ping -c 3'
alias s='ssh'
alias d='docker'
alias l='ls -lra --color=auto'
alias v='vim'
alias c='curl'
alias ex='extract'
alias hs='history | grep'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
alias weather='curl http://wttr.in/'
alias wth='curl http://wttr.in/'
alias getip='wget -qO- ifconfig.co'
alias pubip='wget -qO- ifconfig.co'
alias python="python3"
alias py="python3"
alias pip="pip3"
alias aptu='sudo apt update && sudo apt -y upgrade && sudo apt clean'
alias apti='apt install'
alias pgps="gpg2 --clearsign"
alias pgpe="gpg2 --encrypt"
alias pgpd="gpg2 --output tmp_clear --decrypt"
alias apu="apt update && apt -y upgrade & apt clean"
alias api="apt -y install"
alias ip="ip --color"
alias i="ip --color --brief a"
alias gc="git commit -m"
alias ga="git add"
alias gpo="git push origin"
alias gs="git status"
alias gac="git add . && git commit -a -m "
alias dtrash="docker run -it --rm -v /tmp:/tmp debian:latest /bin/bash"
alias ks='ls'
alias xs='cd'
alias av='aws-vault'
alias sl='ls'
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
alias grep='grep --color=auto'
alias pr='pass generate -i'

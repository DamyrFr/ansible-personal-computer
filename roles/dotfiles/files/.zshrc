#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
#===================={  Setopt  }====================
autoload -Uz vcs_info #Git status for prompt
autoload -U colors && colors #load colors
autoload compinit && compinit -i #tab complementation
autoload -U select-word-style && select-word-style bash #https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
autoload colors; colors;
autoload -U add-zsh-hook #ZSH hook system for update the prompt dynamicly
autoload -U url-quote-magic #URL completion
autoload bashcompinit && bashcompinit #For AWS Complet
zle -N self-insert url-quote-magic
zle -N edit-command-line
bindkey "^[m" copy-prev-shell-word
compinit
bindkey -e #For shortcuts
#===================={  Setopt  }====================
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
#===================={ plugin }====================
source /usr/share/zplug/init.zsh
zplug "nnao45/zsh-kubectl-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "mattberther/zsh-pyenv"
zplug "wfxr/forgit"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
#===================={ export }====================
export EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=/usr/bin/vim
export GREP_COLORS='mt=31'
export PASSWORD_STORE_GENERATED_LENGTH=32
export AWS_VAULT_BACKEND=pass
export AWS_SDK_LOAD_CONFIG=true
export GOPATH="$HOME/go"
export PATH="/opt/nvim-linux-x86_64/bin:$HOME/.tfenv/bin:$HOME/.asdf/bin/:$HOME/.local/bin:$PATH"
#===================={ ASDF }====================
. $HOME/.asdf/asdf.sh
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
alias v='nvim'
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
alias sw="sudo su"
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
alias k='kubecolor --light-background'
alias docker='podman'
alias awsd="source _awsd"
alias tf="tofu"
alias k9ss="k9s --insecure-skip-tls-verify"
alias kb="kubectl kustomize --load-restrictor LoadRestrictionsNone  ./"
alias fs="flux get all -A --status-selector ready=false"
#===================={ completion }====================
# Kube
source <(kubectl completion zsh)
# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
#======================{ direnv }=====================
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

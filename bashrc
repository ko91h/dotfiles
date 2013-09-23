# /etc/bash/bashrc
# vim:ft=sh:fdm=marker:fdl=0:fen:
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# terminal {{{
    stty -ixon
    setterm -bfreq 0
    if [ -f ~/.dotfiles/colours ]; then
        . ~/.dotfiles/colours
    fi
# }}}
# shell {{{
    # Test for an interactive shell.  There is no need to set anything
    if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
    fi

    shopt -s checkwinsize
    shopt -s histappend
    shopt -s cmdhist
    shopt -s cdspell
    shopt -s cdable_vars
    shopt -s checkhash
    shopt -s extglob
    shopt -s histreedit
    shopt -s histverify
    shopt -s no_empty_cmd_completion
    PROMPT_COMMAND='history -a'

    if [ -r /etc/bash_completion ]; then
        . /etc/bash_completion
    else
        complete -A shopt shopt
        complete -A helptopic help
        complete -a unalias
        complete -A binding bind
        complete -d cd
        complete -c command exec type man info which
    fi
# }}}
# environment {{{
    export LANG="ru_RU.UTF-8"
    export LC_TIME="C"
    export EDITOR="vim"
    #export PAGER="vimpager"
    export PAGER="less"
    export PATH=/opt/android-sdk-linux/platform-tools:$HOME/bin:$PATH:/usr/bin/core_perl:$HOME/.dotfiles/bin
    export CDPATH=~:.:./export/home/vm/:/deby:/mnt:/root:/home/oko:/home/oko/mnt

    export HISTCONTROL="erasedups"
    export HISTFILESIZE=500000
    export HISTSIZE=100000
    export HISTFILE=~/.bash_history
    export HISTIGNORE="[   ]*:[bf]g:&:ls:pwd:exit:clear:ll:mc"
    export HISTTIMEFORMAT='%h.%d %H:%M '

    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;33'

    #export LESS_TERMCAP_mb=$'\E[01;31m'        # begin blinking
    #export LESS_TERMCAP_md=$'\E[01;31m'        # begin bold
    #export LESS_TERMCAP_me=$'\E[0m'            # end mode
    #export LESS_TERMCAP_se=$'\E[0m'            # end standout-mode
    #export LESS_TERMCAP_so=$'\E[01;44;33m'     # begin standout-mode - info box
    #export LESS_TERMCAP_ue=$'\E[0m'            # end underline
    #export LESS_TERMCAP_us=$'\E[01;32m'        # begin underline

    export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
    export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
    export LESS_TERMCAP_me=$'\E[0m'           # end mode
    export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
    export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
    export LESS_TERMCAP_ue=$'\E[0m'           # end underline
    export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
    export LESS="-R -F -X"
# }}}
# aliases {{{1
    # Расцвечиваем вывод команд {{{2
        alias cal="LC_TIME='ru_RU.UTF-8' cal"

        if [ -f /usr/bin/grc ]; then
            alias grca="grc --colour=auto"

            for c in ping traceroute make diff last cvs netstat ifconfig uptime vmstat iostat df mount uname ps route lsmod whereis ; do
                alias ${c}="grca ${c}"
            done

            alias ll="grca ls --color=force -F --group-directories-first -l"
            alias ccal="LC_TIME=ru_RU.UTF-8 grca cal"
            alias logc="grc cat"
            alias logt="grc tail"
            alias logh="grc head"
        else
            alias ll="ls -l"
        fi
    # }}}
    # Сокращения команд {{{2
        # GIT {{{3
            PRETTY="%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)[%an]%Creset %C(yellow)%d%Creset"
            alias glg="git log --color --graph --pretty=format:'$PRETTY' --abbrev-commit"
            alias  gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
            alias gls='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short -n 10'
            alias  gg='git graph'
            alias gln='glg -n20'
            alias glnn='glg -n'
            alias gs='git status '
            alias ga='git add '
            alias gb='git branch '
            alias gc='git commit '
            alias gd='git diff'
            alias go='git checkout '
            alias gu='git reset HEAD -- '
            alias got='git '
        # }}}
        # package management {{{
            alias y='sudo aptitude'
            alias yi='sudo aptitude install'
            alias ys='sudo aptitude search'
            alias yr='sudo aptitude purge'
            alias ysy='sudo aptitude update'
            alias ysu='sudo aptitude upgrade'
        # }}}
        # pip {{{
            alias p.i='pip install'
            alias p.s='pip search'
        # }}}
        # virtualenv {{{
            alias v='workon'
            alias v.deactivate='deactivate'
            alias v.mk='mkvirtualenv --no-site-packages'
            alias v.mk_withsitepackages='mkvirtualenv'
            alias v.rm='rmvirtualenv'
            alias v.switch='workon'
            alias v.add2virtualenv='add2virtualenv'
            alias v.cdsitepackages='cdsitepackages'
            alias v.cd='cdvirtualenv'
            alias v.lssitepackages='lssitepackages'
        # }}}
        # ls shortcuts {{{
            alias lll="ll -ah"
            alias lla="ll -a"
            alias llh="ll -h"
            alias lsa='ls -lur'         # atime
            alias lsd='ls -ltr'         # mtime
            alias lst='ls -lcr'         # ctime
            alias lsz='ls -lSr'         # size
            alias lse='ls -lXB'         # alphabetically
            alias lsh='ls -Al'          # all
            alias lsg='ls | grep -i'    # grep
            alias lsm='ls -al | $PAGER' # page through
            alias lsr='ls -lR'          # list recursively
        # }}}
        # android adb {{{
            alias adbi="adb install"
            alias adbis="adb install -s"
            alias adbcp="adb push"
            alias adbsh="adb shell"
            alias adbrb="adb reboot"
            alias rcd="daemon"
        # }}}
        # iptables {{{
            alias ipt="iptables"
            alias iptsave="iptables-save > ~/iptables_`date +%d.%m.%y`"
            alias il="iptables -vnL"
            alias iln="iptables -t nat -vnL"
            alias ilm="iptables -t mangle -vnL"
            alias ili="iptables -vnL INPUT"
            alias ilo="iptables -vnL OUTPUT"
            alias ilf="iptables -vnL FORWARD"
        # }}}

        alias vim="vim -p"
        alias ..="cd .."
        alias ...="cd ../.."
        alias ....="cd ../../.."
        alias ntup="sudo /usr/bin/ntpdate time-a.nist.govs"
        alias m='mplayer'
        alias G="grep"
        alias M="most"
        alias T="tail"
        alias L="| less"
        alias Tf="tail -n 30 -f"
        alias cpp="rsync --progress"
        alias cx='chmod +x'
        alias ssu="sudo -i"
        alias hg='history | grep'
        alias df='df -h --sync'
        alias f='find | grep'
        alias so='source ~/.bashrc'
        alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
        alias gr='grep -ir'
        alias grl='grep -irl'
        alias vibash="vim ~/.bashrc"
        alias cddots="cd  ~/.dotfiles/"
        alias tmux='tmux -2'
    # }}}
# }}}
# prompt {{{
    # Dreadatour
    # some kind of optimization - check if git installed only on config load
    PS1_GIT_BIN=$(which git 2>/dev/null)

    function prompt_command {
        local PS1_GIT=
        local PS1_VENV=
        local GIT_BRANCH=
        local GIT_DIRTY=
        local PWDNAME=$PWD

        # beautify working directory name
        if [[ "${HOME}" == "${PWD}" ]]; then
            PWDNAME="~"
        elif [[ "${HOME}" == "${PWD:0:${#HOME}}" ]]; then
            PWDNAME="~${PWD:${#HOME}}"
        fi

        # parse git status and get git variables
        if [[ ! -z $PS1_GIT_BIN ]]; then
            # check we are in git repo
            local CUR_DIR=$PWD
            while [[ ! -d "${CUR_DIR}/.git" ]] && [[ ! "${CUR_DIR}" == "/" ]] && [[ ! "${CUR_DIR}" == "~" ]] && [[ ! "${CUR_DIR}" == "" ]]; do CUR_DIR=${CUR_DIR%/*}; done
            if [[ -d "${CUR_DIR}/.git" ]]; then
                # 'git repo for dotfiles' fix: show git status only in home dir and other git repos
                if [[ "${CUR_DIR}" != "${HOME}" ]] || [[ "${PWD}" == "${HOME}" ]]; then
                    # get git branch
                    GIT_BRANCH=$($PS1_GIT_BIN symbolic-ref HEAD 2>/dev/null)
                    if [[ ! -z $GIT_BRANCH ]]; then
                        GIT_BRANCH=${GIT_BRANCH#refs/heads/}

                        # get git status
                        local GIT_STATUS=$($PS1_GIT_BIN status --porcelain 2>/dev/null)
                        [[ -n $GIT_STATUS ]] && GIT_DIRTY=1
                    fi
                fi
            fi
        fi

        # build b/w prompt for git and virtual env
        [[ ! -z $GIT_BRANCH ]] && PS1_GIT=" (git: ${GIT_BRANCH})"
        [[ ! -z $VIRTUAL_ENV ]] && PS1_VENV=" (venv: ${VIRTUAL_ENV#$WORKON_HOME})"

        # calculate prompt length
        local PS1_length=$((${#USER}+${#HOSTNAME}+${#PWDNAME}+${#PS1_GIT}+${#PS1_VENV}+3))
        local FILL=

        # if length is greater, than terminal width
        if [[ $PS1_length -gt $COLUMNS ]]; then
            # strip working directory name
            PWDNAME="...${PWDNAME:$(($PS1_length-$COLUMNS+3))}"
        else
            # else calculate fillsize
            local fillsize=$(($COLUMNS-$PS1_length - 9))
            FILL=$color_gray
            while [[ $fillsize -gt 0 ]]; do FILL="${FILL} "; fillsize=$(($fillsize-1)); done
            FILL="${FILL}${color_off}"
        fi

        if $color_is_on; then
            # build git status for prompt
            if [[ ! -z $GIT_BRANCH ]]; then
                if [[ -z $GIT_DIRTY ]]; then
                    PS1_GIT=" (git: ${color_green}${GIT_BRANCH}${color_off})"
                else
                    PS1_GIT=" (git: ${color_red}${GIT_BRANCH}${color_off})"
                fi
            fi

            # build python venv status for prompt
            [[ ! -z $VIRTUAL_ENV ]] && PS1_VENV=" (venv: ${color_blue}${VIRTUAL_ENV#$WORKON_HOME}${color_off})"
        fi

        # set new color prompt
        PS1="${color_user}${USER}${color_off}@${color_yellow}${HOSTNAME}${color_off}:${color_white}${PWDNAME}${color_off}${PS1_GIT}${PS1_VENV} ${FILL} $(date +%X)\n➜ "

        #echo -en "\033[6n" && read -sdR CURPOS
        #[[ ${CURPOS##*;} -gt 1 ]] && echo "${color_error}↵${color_error_off}"

        # set title
        echo -ne "\033]0;${USER}@${HOSTNAME}:${PWDNAME}"; echo -ne "\007"
    }

    # set prompt command (title update and color prompt)
    PROMPT_COMMAND=prompt_command
    # set new b/w prompt (will be overwritten in 'prompt_command' later for color prompt)
    PS1='\u@\h:\w\$ '
# }}}
# functions {{{
    # {{{ cd_func
    cd_func ()
    {
        local x2 the_new_dir adir index
        local -i cnt

        if [[ $1 ==  "--" ]]; then
            dirs -v
            return 0
        fi

        the_new_dir=$1
        [[ -z $1 ]] && the_new_dir=$HOME

        if [[ ${the_new_dir:0:1} == '-' ]]; then
            #
            # Extract dir N from dirs
            index=${the_new_dir:1}
            [[ -z $index ]] && index=1
            adir=$(dirs +$index)
            [[ -z $adir ]] && return 1
            the_new_dir=$adir
        fi

        #
        # '~' has to be substituted by ${HOME}
        [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

        #
        # Now change to the new dir and add to the top of the stack
        pushd "${the_new_dir}" > /dev/null
        [[ $? -ne 0 ]] && return 1
        the_new_dir=$(pwd)

        #
        # Trim down everything beyond 11th entry
        popd -n +11 2>/dev/null 1>/dev/null

        #
        # Remove any other occurence of this dir, skipping the top of the stack
        for ((cnt=1; cnt <= 10; cnt++)); do
            x2=$(dirs +${cnt} 2>/dev/null)
            [[ $? -ne 0 ]] && return 0
            [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
            if [[ "${x2}" == "${the_new_dir}" ]]; then
                popd -n +$cnt 2>/dev/null 1>/dev/null
                cnt=cnt-1
            fi
        done

        return 0
    }

    alias cd=cd_func
    # }}}
    # {{{ extract
    extract () {
            if [ -f $1 ] ; then
                case $1 in
                 *.tar.bz2)   tar xjf $1 ;;
                 *.tar.gz)    tar xzf $1 ;;
                 *.bz2)       bunzip2 $1 ;;
                 *.rar)       unrar e $1 ;;
                 *.gz)        gunzip $1  ;;
                 *.tar)       tar xf $1  ;;
                 *.tbz2)      tar xjf $1 ;;
                 *.tgz)       tar xzf $1 ;;
                 *.zip)       unzip $1   ;;
                 *.Z)         uncompress $1  ;;
                 *.7z)        7z x $1    ;;
                 *)           echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
    # }}}
    # {{{ compress
    compress () {
        FILE=$1
        case $FILE in
            *.tar.bz2) shift && tar cjf $FILE $* ;;
            *.tar.gz) shift && tar czf $FILE $* ;;
            *.tgz) shift && tar czf $FILE $* ;;
            *.zip) shift && zip $FILE $* ;;
            *.rar) shift && rar $FILE $* ;;
        esac
    }
    # }}}
    # {{{ gvim server
    gvimsrv () {
        VIM_SERVER=$(vim --serverlist | head -n 1)
        VIM="/usr/bin/gvim"

        if [ ! -n $VIM_SERVER ]
        then
            $VIM --servername oko-vim
        fi

        $VIM --servername oko-vim --remote-tab-silent "$@"
    }
    alias gvim=gvimsrv
    # }}}
    # {{{ one-liners
        function calc  { echo "${1}"|bc -l; }
        function sds   { sdcv -u en-ru-bars $1 | grep -v -e '-->'; }
        function sdm   { sdcv -u mueller $1 | grep -v -e '-->'; }
        function drill { cat ~/.ssh/id_rsa.pub | ssh $* "mkdir -p -m700 ~/.ssh/; cat - >> ~/.ssh/authorized_keys"; }
        function cmdfu { curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }
        function rtail { tail -f $1 | perl -pe 's/'$2'/\e[1;31;43m$&\e[0m/g'; }
        function ssmount { test -d ~/mnt/$1 || mkdir -p ~/mnt/$1; sshfs $1:/ ~/mnt/$1; }
        function mp3tags { find . -iname "*.mp3" -type f -print0 | xargs -0 mid3iconv -d -e CP1251 --remove-v1; }
        function dumpaudio { mplayer -vc null -vo null -nocorrect-pts -ao pcm:waveheader ${1}; }
        function grvim { vim $(grep -ir -l $1 $2); }
    # }}}
# }}}
# virtualenv {{{
    VENV_WRAP=$(which virtualenvwrapper.sh 2>/dev/null)
    if [[ ! -z $VENV_WRAP ]]; then
        export WORKON_HOME=$HOME/virt_envs
        source $VENV_WRAP
    fi
# }}}
# includes {{{
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi
# }}}

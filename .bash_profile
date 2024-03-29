export PS1="\[\033[0;31m\]\u\[\033[1;33m\]@\[\033[0;32m\]\h\[\033[0;36m\]:\[\033[0;34m\]\W\[\033[1;37m\]\$\[\033[00m\] "
export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

#system
alias ll='ls -l -G'
alias ls='ls -G'
alias rm='rm -i'
alias grep='grep --color'


function blue(){
    echo -e "\033[42m\033[34m"$@"\033[0m"
}

function yellow(){
    echo -e "\033[33m"$@"\033[0m"
}

function ipwd() {
    ifconfig en0 | awk -v pwd="$(pwd)" -v whoami="$(whoami)" '/inet /{ print whoami"@"$2":"pwd; }'
}

if [ -z "$TMUX" ]; then
    session_name="Cww"
    exec tmux new-session -A -s $session_name
fi

# FOR FZF: fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# FOR bash-completion: configure bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"





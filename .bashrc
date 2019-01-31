# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

PS1="\[\033[0;31m\]\u\[\033[1;33m\]@\[\033[0;32m\]\h\[\033[0;36m\]:\[\033[0;34m\]\W\[\033[1;37m\]\$\[\033[00m\] "
alias rm="rm -i"

function gkill() {
  grep_keyword=${1:-xxxxx}
  echo "keyword: $grep_keyword."
  ps --user $USER | grep ${grep_keyword} | tee /dev/tty | awk '{ print $1 }' | xargs -i kill -9 {}
}


# Install fzf first. Github: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

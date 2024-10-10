# prompt
PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]$ '

# ls
alias ll="ls -la"

# Git
alias gs="git status"
alias ga="git add ."
alias gf="git fetch --all"

# Wireguard
alias wgu="sudo wg-quick up wg0"
alias wgd="sudo wg-quick down wg0"

# Python
alias pyvenv-create="python -m venv venv"
alias pyvenv-activate="source venv/bin/activate"
alias pypip-install-requirements="pip install -Ur requirements.txt"

# Go
export PATH="$HOME/go/bin:$PATH"

[[ -f ~/.bashrc_addl ]] && . ~/.bashrc_addl

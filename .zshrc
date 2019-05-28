# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="beastmode"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vimrc="vi ~/.vimrc"
alias zshrc="vi ~/.zshrc"
alias beastmode="vi ~/.oh-my-zsh/themes/beastmode.zsh-theme"
alias dadjoke="curl -sH \"Accept: application/json\" https://icanhazdadjoke.com/ | cat | python -c \"from json import loads;from sys import stdin; print(loads(stdin.read())['joke'])\""
alias nettest="ping -a 8.8.8.8"
shrug() { echo "¯\_(ツ)_/¯" | pbcopy }
alias rackemup="rackup"
alias sp="spotify"

alias lastcommit='git log | head -1 | awk '\''{print $2}'\'''

# Node path.
export NODE_PATH=/usr/local/lib/node_modules

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git battery vi-mode)

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS="--preview 'head -100 {}'"

# Customize to your needs...
export PATH=/Users/andrew/bin:/usr/local/sbin:/usr/local/bin:/Users/andrew/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/andrew/.rvm/bin:/Users/andrew/.rvm/bin:/usr/local/share/npm/bin:

#pow
PATH=$PATH:/Users/andrew/.rvm/gems/ruby-2.3.1/bin
PATH=$PATH:/usr/local/share/python #pip python scripts.

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

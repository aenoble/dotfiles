# Baylor Rae's Prompt Theme: https://gist.github.com/BaylorRae/1499367
# based on wunjo prompt theme and modified for oh-my-zsh
 
# shows me all files and folders when I change directories
cd() { builtin cd "$@"; ls }
 
# uses ~ instead of /Users/baylorrae/
pwd() { print -D $PWD }
 
# I substituted my own so the commit times were live
my_git_info() {
  # Make sure we're in a git repo
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return

  # Get the times
  now=$(date +%s)
  last_commit=$(git log --pretty=format:'%at' -1)
  seconds_since_last_commit=$((now-last_commit))

# Commenting out minutes since it's broken in vi-mode in tmux
# minutes_since_last_commit=$((seconds_since_last_commit/60))
# 
# # Colorize the times
#   # green = < 10min
#   # yellow = < 30min
#   # red = > 30min
# if [ "$minutes_since_last_commit" -gt 30 ]; then
#   colored_time="%{$fg[red]%}"
# elif [ "$minutes_since_last_commit" -gt 10 ]; then
#   colored_time="%{$fg[yellow]%}"
# else
#   colored_time="%{$fg[green]%}"
# fi
#
# # Add the minutes and reset color
# colored_time+="%{$minutes_since_last_commit%}m"
  colored_time+="%{$reset_color%}"
  
  # Add the colored git branch
  colored_branch="%{$fg[cyan]%}${ref#refs/heads/}%{$reset_color%}"
  
  # Add it to the prompt
#  echo "($colored_branch|$colored_time)"
  echo "($colored_branch)"
}

#beastmode
PROMPT='%{$fg[blue]%}%n%{$reset_color%}:%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}$(my_git_info) %{$fg[yellow]%}$%{$reset_color%} '

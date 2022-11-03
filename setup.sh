#!/bin/bash

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install ctags htop fzf asdf tmux coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep thefuck

# FZF key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

#fonts
git clone https://github.com/powerline/fonts.git && bash ./fonts/install.sh && rm -rf fonts

# link dotfiles
ls -a1 dotfiles | grep '^\.[a-z]' | while read word; do ln -s ~/dotfiles/$word ~/$word; done
ln -s ~/dotfiles/beastmode.zsh-theme ~/.oh-my-zsh/themes/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

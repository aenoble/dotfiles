#!/bin/bash

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
ln -s ~/beastmode.zsh-theme .oh-my-zsh/themes/

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

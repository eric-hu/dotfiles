#! /bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

# keep things minimal until I need to expand this
echo "linking .vimrc"
DOTFILE=$DIRECTORY"/.vimrc"
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

echo "installing Vundle if not installed"
# Install vundler for vim and macvim
VUNDLE_HOME=~/.vim/bundle/Vundle.vim
[ ! -d $VUNDLE_HOME ] &&
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_HOME


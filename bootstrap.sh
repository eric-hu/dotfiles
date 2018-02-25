#! /bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

echo "assuming $DIRECTORY for current file path"

# keep things minimal until I need to expand this
echo "linking .vimrc"
DOTFILE=$DIRECTORY"/.vimrc"

# Only link dotfile if it exists
# Do not overwrite original dotfile
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

DOTFILE=$DIRECTORY"/.bash_profile"

# Only link dotfile if it exists
# Do not overwrite original dotfile
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

DOTFILE=$DIRECTORY"/.gitconfig"

# Only link dotfile if it exists
# Do not overwrite original dotfile
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

DOTFILE=$DIRECTORY"/.gitignore-global"

# Only link dotfile if it exists
# Do not overwrite original dotfile
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

DOTFILE=$DIRECTORY"/.inputrc"

# Only link dotfile if it exists
# Do not overwrite original dotfile
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~

echo "installing Vundle if not installed"
# Install vundler for vim and macvim
VUNDLE_HOME=~/.vim/bundle/Vundle.vim
[ ! -d $VUNDLE_HOME ] &&
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_HOME


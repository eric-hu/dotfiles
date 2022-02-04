#! /bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

echo "Assuming $DIRECTORY for current file path"

# Keep things minimal until I need to expand this

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


DOTFILE=$DIRECTORY"/init.vim"

echo "creating neovim config path"
[ -f "$DOTFILE" ] && mkdir -p ~/.config/nvim && ln -sv "$DOTFILE" ~/.config/nvim


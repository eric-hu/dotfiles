#! /bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

echo "assuming $DIRECTORY for current file path"

# keep things minimal until I need to expand this
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


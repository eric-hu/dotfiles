#! /bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

# keep things minimal until I need to expand this
DOTFILE=$DIRECTORY"/.vimrc"
[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~


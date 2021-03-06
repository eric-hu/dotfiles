# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ===============================  OS Detection ================================
# Use "if [[ $platform == 'OSX/linux' ]]" elsewhere in this script
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='OSX'
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Enable ctrl-s to forward search in history
# Disable XON/XOFF flow control so that ctrl-s doesn't map to that.
stty -ixon

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ===============================  Prompt setup ================================
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# configure grep to highlight matches
export GREP_OPTIONS='--color=auto'

# enable color support of ls and also add handy aliases
# should only do color in the terminal, and specifically not
# when piping into another app or to a file
export CLICOLOR=1

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [[ -r "/Users/Shared/.aliases" ]] && [[ -f "/Users/Shared/.aliases" ]]; then
 source "/Users/Shared/.aliases";
fi

# =============== Bash Completion ===============
# Provides tab-completion for git, among other things.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# bind history-completion to pageup and pagedown
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'

#Set the architecture flag
export ARCHFLAGS='-arch x86_64'

# ====== OS Specific settings =======
if [[ $platform == 'OSX' ]]; then
  # Set the term editor
  export VISUAL='nvim -f -c "au VimLeave * !open -a iterm"'

  # Homebrew: Load /usr/local/bin before /usr/bin
  export PATH="/usr/local/bin:$PATH"

  # Node/Homebrew
  export NODE_PATH="/usr/local/lib/node"

  # NPM
  export PATH="/usr/local/share/npm/bin:$PATH"

  # Cargo
  export PATH="/Users/erichu/.cargo/bin:$PATH"

  # Iterm2 shell integration
  # Enables:
  #   marks
  #   iterm2 command history
  #   frequency/recent directories
  #   drag/drop files to/from remote
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

  # Homebrew ruby
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

  # Yarn
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

  # Node version manager
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
fi

export PATH="$PATH:/usr/local/sbin"

# chruby
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# Prompt
# set bash prompt: color
export PS1="\[\e[32m\]\h:\[\e[35m\]\w \[\e[33m\]\u \[\e[31m\]\`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\\\\\*\ \(.+\)$/\(\\\\\\\\\1\)\ /\`\[\e[37m\]$\[\e[0m\] "

# Show the current ruby version in the prompt (when using chruby)
if [[ ! -z "$RUBY_ENGINE" ]] && [[ ! -z "$RUBY_VERSION" ]] ; then
  echo "Showing ruby prompt"
  export PS1="\[$(tput setaf 1)\]\$RUBY_ENGINE \$RUBY_VERSION\[$(tput sgr0)\] $PS1"
fi


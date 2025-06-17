#!/bin/zsh

# Using python to default to python3 (As python2 is not really used nowadays)
alias python='python3'

# Switch between bash and zsh
alias switch_to_zsh='chsh -s /bin/zsh'
alias switch_to_bash='chsh -s /bin/bash'


# Custom commands and aliases
CUSTOM_ALIASES=~/.config/zsh/aliases.zsh

alias view_custom_aliases='cat '$CUSTOM_ALIASES
alias edit_custom_aliases='vi '$CUSTOM_ALIASES
alias reload_custom_aliases='source '$CUSTOM_ALIASES
extend_aliases() {echo 'alias '$1 >> $CUSTOM_ALIASES}


alias df2="/usr/bin/git --git-dir="$HOME"/.dotfiles --work-tree="$HOME



# Maven

alias mcp="mvn clean package"
alias mp="mvn package"


# Git

alias gshow="git show --name-only --pretty=''"
alias gs="git status"
alias glog="git log"
alias gf="git fetch"
alias gp="git push"
alias gcom="git commit -m"

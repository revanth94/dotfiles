#!/bin/zsh

# Python
## Using python to default to python3 (As python2 is not really used nowadays)
alias python='python3'
alias python_format="python -m black ."

alias load_venv="source .venv/bin/activate"

# Terminals
# Switch between bash and zsh
alias switch_to_zsh='chsh -s /bin/zsh'
alias switch_to_bash='chsh -s /bin/bash'
alias pause_history='unset HISTFILE'
alias sss='unset HISTFILE'

# Custom commands and aliases
CUSTOM_ALIASES=~/.config/zsh/aliases.zsh

alias view_custom_aliases='cat '$CUSTOM_ALIASES
alias edit_custom_aliases='vi '$CUSTOM_ALIASES
alias reload_custom_aliases='source '$CUSTOM_ALIASES

function extend_aliases() {
  [[ -n "${CUSTOM_ALIASES:-}" ]] || return 1
  (( $# == 2 )) || return 1
  [[ -n "$1" && -n "$2" ]] || return 1
  print -r -- "alias ${(q)1}=${(q)2}" >> "$CUSTOM_ALIASES"
}

_extend_aliases() {
  _arguments \
    '1:alias name:_nothing' \
    '2:command:_command_names'
}
compdef _extend_aliases extend_aliases


# Dotfiles
alias df2="/usr/bin/git --git-dir="$HOME"/.dotfiles --work-tree="$HOME
compdef _git df2=git

# Add this to ~/.zshrc
chpwd_functions+=(check_dotfiles_dir)
function check_dotfiles_dir() {
  if [[ "$PWD" == "$HOME/.config"* ]]; then
    export GIT_DIR="$HOME/.dotfiles"
    export GIT_WORK_TREE="$HOME"
  else
    unset GIT_DIR
    unset GIT_WORK_TREE
  fi
}

# Maven
alias mcp="mvn clean package"
alias mp="mvn package"
alias mci="mvn clean install"

# Git
alias gshow="git show --name-only --pretty=''"
alias gs="git status"
alias glog="git log"
alias gf="git fetch"
alias gp="git push"
alias gcom="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"

# History
alias maccy_stop="defaults write org.p0deje.Maccy ignoreEvents true"
alias maccy_start="defaults write org.p0deje.Maccy ignoreEvents false"

# Shortcuts
alias obsidian="open -a 'Obsidian'"
alias cursor="oapp cursor"
alias editor="cursor"


## Recipes and health
RECIPES_FOLDER=/Users/revanth/Projects/Learning/quality_of_life
alias scrape_recipes="editor $RECIPES_FOLDER"
alias view_recipes="obsidian '$RECIPES_FOLDER/recipes'"

## Misc

alias ril="append_read_later"

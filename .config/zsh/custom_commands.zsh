#!/bin/zsh

# Using python to default to python3 (As python2 is not really used nowadays)
alias python='python3'

# Switch between bash and zsh
# alias switch_to_zsh='chsh -s /bin/zsh'
# alias switch_to_bash='chsh -s /bin/bash'


# Custom commands and aliases
CUSTOM_COMMANDS_FILE=~/.config/zsh/custom_commands.zsh

alias view_custom_commands='cat '$CUSTOM_COMMANDS_FILE
alias edit_custom_commands='vi '$CUSTOM_COMMANDS_FILE
alias reload_custom_commands='source '$CUSTOM_COMMANDS_FILE

function timer(){

  declare -i t=0;
  declare -t k=1;
  while true ; do t=$((t+k)) ; echo -ne "\r$t" ; sleep 1 ; done

}

mkcd () { mkdir "$1" && cd "$1"; }

function oapp () {
  open -a "$1" $2
}

_oapp() {
  local -a apps
  for app in "${(f)"$(ls /Applications )"}"; do
    appname="${app%.*}"
    appname="${appname##*/}"
    apps+=("$appname")
  done
  compadd -Q -- "${apps[@]}"
}


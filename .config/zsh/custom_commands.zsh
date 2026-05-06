#!/bin/zsh

# Using python to default to python3 (As python2 is not really used nowadays)
alias python='python3'

# Switch between bash and zsh
# alias switch_to_zsh='chsh -s /bin/zsh'
# alias switch_to_bash='chsh -s /bin/bash'


# Custom commands and aliases
CUSTOM_COMMANDS_FILE=~/.config/zsh/custom_commands.zsh

alias view_custom_commands='vi -R '$CUSTOM_COMMANDS_FILE
alias edit_custom_commands='vi '$CUSTOM_COMMANDS_FILE
alias reload_custom_commands='source '$CUSTOM_COMMANDS_FILE

function timer(){

  declare -i t=0;
  declare -t k=1;
  while true ; do t=$((t+k)) ; echo -ne "\r$t" ; sleep 1 ; done

}

mkcd () { mkdir "$1" && cd "$1"; }

# Open App
oapp() {
  open -a "$1" ${2:+"$2"}
}

_oapp() {
  _arguments \
    '1:application:_mac_applications' \
    '2:file or directory:_files'
}

compdef _oapp oapp

export WORK_PROJECTS="$HOME/Projects/Work"
export EXPERIMENTS="$HOME/Projects/Learning/experiments"

# Open Work

opcd() {
  cd $WORK_PROJECTS/$1
}

opw() {
  editor $WORK_PROJECTS/$1
}

opwcd() {
  cd $WORK_PROJECTS/$1 && editor .;
}

_opw() {
  _path_files -W $WORK_PROJECTS -/
}
compdef _opw opw
compdef _opw opcd
compdef _opw opwcd

# ReadItLater

append_read_later() {
  local line="${1:-$(pbpaste)}"

#  local file="$HOME/testwrite"
  local file="/Users/revanth/Library/Mobile Documents/iCloud~md~obsidian/Documents/Read Later/Unprocessed.md"
  echo "Writing $line to $file"

  printf '%s\n' "$line" >> "$file"
}

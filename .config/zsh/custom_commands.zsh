#!/bin/zsh

# Using python to default to python3 (As python2 is not really used nowadays)
alias python='python3'

# Switch between bash and zsh
alias switch_to_zsh='chsh -s /bin/zsh'
alias switch_to_bash='chsh -s /bin/bash'


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

alias python='python3'

remove_folder_if_exists () { if [ -d $1 ] ; then rm -r $1 ; fi; }


function safe() {
	remove_folder_if_exists /Users/revanth/Downloads/Brave/Pics
	remove_folder_if_exists /Users/revanth/Downloads/Brave/All
	remove_folder_if_exists /Users/revanth/Downloads/Brave/DWP
	remove_folder_if_exists /Users/revanth/Downloads/Brave/Temp
}


# File and Folder mods
function head_stripper() {
	dirname=$1
	result="${dirname%"${dirname##*[!/]}"}" # extglob-free multi-trailing-/ trim
	result="${result##*/}"                  # remove everything before the last /
	result=${result:-/}
	echo $result
}

function get_extension() {
	filename=$1
	shopt -s extglob           # enable +(...) glob syntax
	result=${filename%%+(/)}    # trim however many trailing slashes exist
	result=${result##*.}       # remove everything before the last / that still remains
	result=${result:-/}        # correct for dirname=/ case
	printf '%s\n' "$result"
}

function custom_echo () {
	echo "Folder: $1"
}

function nested_executor () {
	folder=$1
	command=$2
	for dir in $folder/*; do 
	if [ -d $dir ]; then 
	echo "Folder: $dir";
	# custom_echo $dir
	$command "$dir"
	fi; 
	done
}

function file_renamer () {
	echo "Renaming files in folder: $1"
	folder=$1
	command=$2
	tempdir=$1/renamer_temp
	mkdir $tempdir
	x=1
	folder_name=$(head_stripper $folder)
	echo "Folder Name: $folder_name"
	for file in $folder/*; do 
	if [ -f "$file" ]; then 
	
	extension=$(get_extension "$file")
	mv "$file" "$tempdir/$folder_name$x.$extension"
	x=$(expr $x + 1);

	fi; 
	done
	mv $tempdir/* $1
	rmdir $tempdir
}


function oapp () {
  open -a "$1" $2
}

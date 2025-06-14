#!/bin/zsh


function timer(){

        declare -i t=0;
        declare -t k=1;
        while true ; do t=$((t+k)) ; echo -ne "\r$t" ; sleep 1 ; done

}

# mkcd () { mkdir "$1" && cd "$1"; }


remove_folder_if_exists () { if [ -d $1 ] ; then rm -r $1 ; fi; }




#!/bin/bash

#############################################################
# Copy updated dot files to home folder
#############################################################

# Setup directory variables
dotdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Assign list of files/folders to copy to home dir
cd $dotdir
shopt -s extglob
files=( +([^.]) )

# Move dotfiles in home dir to backup directory, then copy files 
for file in "${files[@]}"; do
    if [ "$file" -nt ~/."$file" ]; then 
        echo "Updating .$file"
        cp $dotdir/$file ~/.$file
    fi
done

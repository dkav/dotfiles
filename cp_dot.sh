#!/bin/bash

#############################################################
# Backup existing dot files and copy new files to home folder
#############################################################

echo

rtime=`date +%Y%m%d%H%M%S`

# Setup directory variables
dotdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
backdir=~/.dotfiles_$rtime

# Create backup directory
echo "Creating backup folder:"
echo "$backdir"
mkdir -p "$backdir"
echo

# Assign list of files/folders to copy to home dir
cd $dotdir
shopt -s extglob
files=( +([^.]) )

# Move dotfiles in home dir to backup directory, then copy files 
echo "Backing up and/or copying the following dot files:"
for file in "${files[@]}"; do
    echo ".$file"
    mv ~/.$file $backdir
    cp $dotdir/$file ~/.$file
done

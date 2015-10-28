#!/bin/bash

#############################################################
# Backup existing dot files and copy new files to home folder
#############################################################

echo

rtime=`date +%Y%m%d%H%M%S`

# Setup directory variables
dotdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
backdir=~/.dotfiles_$rtime

# Assign list of files/folders to symlink in homedir
shopt -s extglob
files=( +([^.]) )

# Create backup directory
echo "Creating backup folder:"
echo "$backdir"

mkdir -p "$backdir"

# Change to the dotfiles directory
cd $dotdir
echo

# Move dotfiles in homedir to backup directory, then create symlinks 
echo "Backing up and/or copying the following dot files:"
for file in "${files[@]}"; do
    echo ".$file"
    mv ~/.$file $backdir
    cp $dotdir/$file ~/.$file
done

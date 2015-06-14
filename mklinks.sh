#!/bin/bash
##########################################################################
# This script creates symlinks from the home directory to dotfiles folder
##########################################################################

echo

# Setup directory variables
dotdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )  # dotfiles directory
backdir=~/.dotfiles_bak  # dotfiles backup directory

# Assign list of files/folders to symlink in homedir
files="bash_profile bashrc gitconfig gitignore_global hgignore_global hgrc inputrc 
       vimrc gvimrc zprofile zshenv zshrc"    


# Create backup directory
echo "Creating backup folder:"
echo "$backdir"
mkdir -p $backdir
echo

# Change to the dotfiles directory
echo "Changing to dotfiles directory:"
echo "$dotdir"
cd $dotdir
echo

# Move dotfiles in homedir to backup directory, then create symlinks 
echo "Backing up and creating symlinks for the following files:"
for file in $files; do
    echo ".$file"
    mv ~/.$file $backdir
    ln -s $dotdir/$file ~/.$file
done

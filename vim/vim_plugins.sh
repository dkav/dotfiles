#!/bin/bash

# Install Vim plugins #
#=====================#
echo "Installing Vim plugins:"

dotdir=$HOME/.vim
packdir=$dotdir/pack

mkdir -p $packdir

# Install Vim plugins
clone_vplugin()
{   # Function to clone Vim plugins

    # Input parameters
    local github_user=$1
    local repo=$2
    local install_dir=$3
    local start_opt=$4
    local plugin=$5

    echo " $vim_plugin ($start_opt)"
    git clone --depth=1 --quiet \
        https://github.com/$github_user/$repo.git \
        $packdir/$install_dir/$start_opt/$plugin
    rm -rf !$/.git
}

clone_vplugin vim-airline vim-airline statusline start airline
clone_vplugin vim-airline vim-airline-themes statusline start airline-themes
clone_vplugin tpope vim-fugitive git start fugitive
clone_vplugin lifepillar vim-solarized8 themes opt solarized8

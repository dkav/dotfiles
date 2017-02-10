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
    local vim_plugin=$1
    local github_user=$2
    local install_dir=$3
    local start_opt=$4

    echo " $vim_plugin ($start_opt)"
    git clone --depth=1 --quiet \
        https://github.com/$github_user/$vim_plugin.git \
        $packdir/$install_dir/$start_opt/$vim_plugin
    rm -rf !$/.git
}

# clone plugin-name github-user install-folder auto-start/manual
clone_vplugin vim-airline vim-airline airline start
clone_vplugin vim-airline-themes vim-airline airline start
clone_vplugin vim-colors-solarized altercation color-scheme start
clone_vplugin vim-fugitive tpope git start
clone_vplugin vim-flake8 nvie python opt

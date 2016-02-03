#!/bin/bash

# Install Vim plugins and manage with pathogen #
#==============================================#
echo "Installing Vim plugins"

dotdir=$HOME/.vim
autoldir=$dotdir/autoload
bundledir=$dotdir/bundle

mkdir -p $autoldir $bundledir

# Install vim-pathogen
echo "Installing vim-pathogen"
curl -LSso $autoldir/pathogen.vim https://tpo.pe/pathogen.vim

# Install Vim plugins
clone_vplugin()
{   # Function to clone Vim plugins
    local vim_plugin=$1
    local github_user=$2

    echo "Installing $vim_plugin"
    git clone --depth=1 --quiet \
        https://github.com/$github_user/$vim_plugin.git \
        $bundledir/$vim_plugin
    rm -rf !$/.git
}

clone_vplugin vim-airline vim-airline
clone_vplugin vim-airline-themes vim-airline
clone_vplugin vim-colors-solarized altercation
clone_vplugin vim-fugitive tpope
clone_vplugin vim-flake8 nvie

echo "Plugins installed"

#!/bin/bash

# Install Vim plugins #
#=====================#
echo "Installing Vim plugins:"

dotdir=$HOME/.vim
packdir=$dotdir/pack

# Make vim packdir in .vim folder
mkdir -p $packdir

clone_vplugin()
{   # Function to clone Vim plugins

    # Input parameters
    local repo=$1
    local install_dir=$packdir/$2
    local gen_doc=$3

    echo " $vim_plugin ($start_opt)"

    # Get project from Github without any version control files
    svn export https://github.com/$repo/trunk $install_dir

    # Generate helptags
    if $gen_doc ; then
        mvim -nNes -u NONE -c "helptags $install_dir/doc" -c q
    fi
}

# Install Vim plugins
clone_vplugin "vim-airline/vim-airline" "statusline/start/airline" true
clone_vplugin "vim-airline/vim-airline-themes" \
    "statusline/start/airline-themes" true
clone_vplugin "tpope/vim-fugitive" "git/start/fugitive" true
clone_vplugin "romainl/flattened" "themes/opt/flattened" false

#!/bin/zsh

# Install Vim plugins #
# ------------------- #
# Called from dotfiles makefile

echo >&2 "  installing vim plugins:"

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

    echo >&2 "    $(basename $repo)"

    # Get project from Github
    git clone --depth 1 --quiet git@github.com:/$repo.git $install_dir

    # Generate helptags
    if [ -z $gen_doc ] ; then
        mvim -nNes -u NONE -c "helptags $install_dir/doc" -c q
    fi
}

# Install Vim plugins
# -------------------
# Statusline
clone_vplugin "vim-airline/vim-airline" "statusline/start/airline"
clone_vplugin "vim-airline/vim-airline-themes" \
    "statusline/start/airline-themes"

# Themes
clone_vplugin "romainl/flattened" "themes/opt/flattened" false

# IDE
clone_vplugin "scrooloose/nerdtree" "ide/start/nerdtree"
clone_vplugin "majutsushi/tagbar" "ide/start/tagbar"
clone_vplugin "ludovicchabant/vim-gutentags" "ide/start/gutentags"
clone_vplugin "tpope/vim-fugitive" "ide/start/fugitive"
clone_vplugin "airblade/vim-gitgutter" "ide/start/gitgutter"
clone_vplugin "dense-analysis/ale" "ide/start/ale"
clone_vplugin "scrooloose/nerdcommenter" "ide/opt/nerdcommenter"
clone_vplugin "ctrlpvim/ctrlp.vim" "ide/opt/ctrlp"

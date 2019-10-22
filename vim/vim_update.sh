#!/bin/zsh

# Update Vim plugins #
# ------------------ #
packdir=$HOME/.vim/pack

update_vplugin()
{   # Function to clone Vim plugins

    # Input parameters
    local install_dir=$packdir/$1
    local gen_doc=$2

    # Get project from Github
    cd $install_dir
    git fetch --depth 1 --quiet

    head_hash=$(git rev-parse HEAD)
    upstream_hash=$(git rev-parse master@{upstream})

    if [ "$head_hash" != "$upstream_hash" ]; then
        echo "Updating $(basename $install_dir)"
        git reset --hard --quiet origin/master
        git clean -dfx  --quiet

        # Generate helptags
        if [ -z $gen_doc ] ; then
            mvim -nNes -u NONE -c "helptags $install_dir/doc" -c q
        fi
    fi
}

# Update Vim plugins
# -------------------
# Statusline
update_vplugin "statusline/start/airline"
update_vplugin "statusline/start/airline-themes"

# Themes
update_vplugin "themes/opt/flattened" false

# IDE
update_vplugin "ide/start/nerdtree"
update_vplugin "ide/start/tagbar"
update_vplugin "ide/start/gutentags"
update_vplugin "ide/start/fugitive"
update_vplugin "ide/start/gitgutter"
update_vplugin "ide/start/ale"
update_vplugin "ide/opt/nerdcommenter"
update_vplugin "ide/opt/ctrlp"

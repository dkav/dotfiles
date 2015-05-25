# PATH
# ----
# Base path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Paths to additional binaries
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export PATH

# DEVELOPEMENT
# ------------
# Python pyenv & pyenv virtualenv
if which pyenv > /dev/null; then
    export PYENV_ROOT=/usr/local/opt/pyenv
    eval "$(pyenv init -)"
fi

# Ruby rbenv
if which rbenv > /dev/null; then
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)"
fi

# Node nvm
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
  export NVM_DIR=/usr/local/var/nvm
  source $(brew --prefix nvm)/nvm.sh
fi

# Load in .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


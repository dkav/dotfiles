# PATH
# ----
# Base PATH
path=(/usr/local/bin
      /usr/bin
      /bin
      /usr/sbin
      /sbin)

# Paths to additional binaries
path+=(/Applications/Postgres.app/Contents/Versions/9.4/bin)
export PATH

# DEVELOPEMENT
# ------------
# Python pyenv & pyenv virtualenv
if which -p pyenv > /dev/null; then
    export PYENV_ROOT=/usr/local/opt/pyenv
    eval "$(pyenv init -)"
fi

# Ruby rbenv
if which -p rbenv > /dev/null; then
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)"
fi

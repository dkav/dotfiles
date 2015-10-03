# PATH
# ----
# Base PATH
path=(/usr/local/bin
      /usr/bin
      /bin
      /usr/sbin
      /sbin)

# Paths to additional binaries
path+=(/Library/Frameworks/GDAL.framework/Versions/1.11/Programs)
path+=(/Applications/Postgres.app/Contents/Versions/9.4/bin)
export PATH

# DEVELOPEMENT
# ------------
# Python pyenv & pyenv virtualenv
pydev() {
        if which -p pyenv > /dev/null; then
            export PYENV_ROOT=/usr/local/opt/pyenv
            eval "$(pyenv init -)"
            eval "$(pyenv virtualenv-init -)"
        fi
    }

# Ruby rbenv
rbdev() {
        if which -p rbenv > /dev/null; then
            export RBENV_ROOT=/usr/local/var/rbenv
            eval "$(rbenv init -)"
        fi
    }

# Node nvm
nodev() {
        if [ -f $(brew --prefix nvm)/nvm.sh ]; then
            export NVM_DIR=/usr/local/var/nvm
            source "$(brew --prefix nvm)/nvm.sh"
        fi
    }

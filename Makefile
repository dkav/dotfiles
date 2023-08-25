# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs
DELETE	  := rm -f


all: shell brew git vim python ruby npm db

clean: shell-clean \
    brew-clean \
    git-clean vim-clean \
    python-clean ruby-clean npm-clean \
    db-clean


# Shell Environments
shell: zsh alias tmux
shell-clean: zsh-clean alias-clean tmux-clean

zsh: zsh-clean
	@echo "sh \c"
	@${LINK} "${DOTFILES}/shell/zprofile" ${TARGET}/.zprofile
	@${LINK} "${DOTFILES}/shell/zshrc" ${TARGET}/.zshrc
	@${LINK} "${DOTFILES}/shell/shellcheckrc" ${TARGET}/.shellcheckrc
	@echo "configured"
zsh-clean:
	@echo "sh \c"
	@${DELETE} ${TARGET}/.zprofile
	@${DELETE} ${TARGET}/.zshrc
	@${DELETE} ${TARGET}/.shellcheckrc
	@echo "cleaned"

alias: alias-clean
	@${LINK} "${DOTFILES}/shell/aliases" ${TARGET}/.aliases
alias-clean:
	@${DELETE} ${TARGET}/.aliases

tmux: tmux-clean
	@echo "tmux \c"
	@${LINK} "${DOTFILES}/shell/tmux.conf" ${TARGET}/.tmux.conf
	@echo "configured"
tmux-clean:
	@echo "tmux \c"
	@${DELETE} ${TARGET}/.tmux.conf
	@echo "cleaned"


# Homebrew
brew: brew-clean
	@echo "Homebrew \c"
	@mkdir -p ${TARGET}/.homebrew
	@${LINK} "${DOTFILES}/homebrew/brew.env" \
		${TARGET}/.homebrew/brew.env
	@echo "configured"
brew-clean:
	@echo "Homebrew \c"
	@${DELETE} ${TARGET}/.homebrew/brew.env
	@echo "cleaned"


# Development Tools
git: git-clean
	@echo "git \c"
	@mkdir -p ${TARGET}/.config/git
	@${LINK} "${DOTFILES}/git/attributes" \
	    ${TARGET}/.config/git/attributes
	@${LINK} "${DOTFILES}/git/config" \
		${TARGET}/.config/git/config
	@${LINK} "${DOTFILES}/git/ignore" \
	    	${TARGET}/.config/git/ignore
	@echo "configured"
git-clean:
	@echo "git \c"
	@${DELETE} ${TARGET}/.config/git/attributes
	@${DELETE} ${TARGET}/.config/git/config
	@${DELETE} ${TARGET}/.config/git/ignore
	@echo "cleaned"

vim: vim-clean
	@echo "vim \c"
	@mkdir -p ${TARGET}/.vim
	@${LINK} "${DOTFILES}/vim/vimrc" ${TARGET}/.vim/vimrc
	@${LINK} "${DOTFILES}/vim/gvimrc" ${TARGET}/.vim/gvimrc
	@${LINK} "${DOTFILES}/vim/ftdetect" ${TARGET}/.vim/ftdetect
	@mkdir ${TARGET}/.vim/after
	@${LINK} "${DOTFILES}/vim/ftplugin" ${TARGET}/.vim/after/ftplugin
	@${LINK} "${DOTFILES}/vim/syntax" ${TARGET}/.vim/after/syntax
	@echo "configured"
vim-clean:
	@echo "vim \c"
	@${DELETE} ${TARGET}/.vim/vimrc
	@${DELETE} ${TARGET}/.vim/gvimrc
	@${DELETE} ${TARGET}/.vim/ftdetect
	@${DELETE} -r ${TARGET}/.vim/after
	@echo "cleaned"


# Programming Environments
python: pip pypi ipython jupyter
python-clean: pip-clean pypi-clean ipython-clean jupyter-clean

pip: pip-clean
	@echo "pip \c"
	@mkdir -p ${TARGET}/.config/pip
	@${LINK} "${DOTFILES}/python/pip.conf" ${TARGET}/.config/pip/pip.conf
	@echo "configured"
pip-clean:
	@echo "pip \c"
	@${DELETE} -r ${TARGET}/.config/pip
	@echo "cleaned"

pypi: pypi-clean
	@echo "pypi \c"
	@mkdir -p ${TARGET}/.config/pypi
	@${LINK} "${DOTFILES}/python/pypirc" ${TARGET}/.pypirc
	@echo "configured"
pypi-clean:
	@echo "pypi \c"
	@${DELETE} -r ${TARGET}/.pypirc
	@echo "cleaned"

ipython:ipython-clean
	@echo "IPython \c"
	@mkdir -p ${TARGET}/.ipython
	@${LINK} "${DOTFILES}/python/ipython_config.py" \
		${TARGET}/.ipython/profile_default/ipython_config.py
	@echo "configured"
ipython-clean:
	@echo "IPython \c"
	@${DELETE} ${TARGET}/.ipython/profile_default/ipython_config.py
	@echo "cleaned"

jupyter:jupyter-clean
	@echo "Jupyter \c"
	@mkdir -p ${TARGET}/.jupyter
	@${LINK} "${DOTFILES}/python/jupyter_notebook_config.py" \
		${TARGET}/.jupyter/jupyter_notebook_config.py
	@echo "configured"
jupyter-clean:
	@echo "Jupyter \c"
	@${DELETE} ${TARGET}/.jupyter/jupyter_notebook_config.py
	@echo "cleaned"

ruby:ruby-clean
	@ echo "Ruby \c"
	@${LINK} "${DOTFILES}/ruby/gemrc" ${TARGET}/.gemrc
	@echo "configured"
ruby-clean:
	@echo "Ruby \c"
	@${DELETE} ${TARGET}/.gemrc
	@echo "cleaned"

npm:npm-clean
	@ echo "npm \c"
	@${LINK} "${DOTFILES}/npm/npmrc" ${TARGET}/.npmrc
	@echo "configured"
npm-clean:
	@echo "npm \c"
	@${DELETE} ${TARGET}/.npmrc
	@echo "cleaned"


# Databases
db: pgsql sqlite
db-clean: pgsql-clean sqlite-clean

pgsql: pgsql-clean
	@echo "pgsql \c"
	@${LINK} "${DOTFILES}/db/psqlrc" ${TARGET}/.psqlrc
	@echo "configured"
pgsql-clean:
	@echo "pgsql \c"
	@${DELETE} ${TARGET}/.psqlrc
	@echo "cleaned"

sqlite: sqlite-clean
	@echo "sqlite \c"
	@${LINK} "${DOTFILES}/db/sqliterc" ${TARGET}/.sqliterc
	@echo "configured"
sqlite-clean:
	@echo "sqlite \c"
	@${DELETE} ${TARGET}/.sqliterc
	@echo "cleaned"

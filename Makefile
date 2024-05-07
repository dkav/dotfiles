# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
XDGCFG    := ${XDG_CONFIG_HOME}
XDGDATA   := ${XDG_DATA_HOME}
LINK	  := ln -fs
DELETE	  := rm -f


all: shell brew security git vim python ruby node db

clean: shell-clean \
    brew-clean \
    security-clean \
    git-clean vim-clean \
    python-clean ruby-clean node-clean\
    db-clean


# Shell Environments
shell: zsh shellcheck tmux
shell-clean: zsh-clean shellcheck-clean tmux-clean

zsh: zsh-clean
	@echo "Zsh \c"
	@${LINK} "${DOTFILES}/shell/zshenv" ${TARGET}/.zshenv
	@mkdir -p ${XDGCFG}/zsh
	@${LINK} "${DOTFILES}/shell/zprofile" ${XDGCFG}/zsh/.zprofile
	@${LINK} "${DOTFILES}/shell/zshrc" ${XDGCFG}/zsh/.zshrc
	@${LINK} "${DOTFILES}/shell/aliases" ${XDGCFG}/zsh/aliases
	@${LINK} "${DOTFILES}/shell/nmdirs" ${XDGCFG}/zsh/nmdirs
	@echo "configured"
zsh-clean:
	@echo "Zsh \c"
	@${DELETE} ${TARGET}/.zshenv
	@${DELETE} -r ${XDGCFG}/zsh
	@echo "cleaned"

shellcheck: shellcheck-clean
	@echo "ShellCheck \c"
	@${LINK} "${DOTFILES}/shell/shellcheckrc" ${XDGCFG}/shellcheckrc
	@echo "configured"
shellcheck-clean:
	@echo "ShellCheck \c"
	@${DELETE} ${XDGCFG}/shellcheckrc
	@echo "cleaned"

tmux: tmux-clean
	@echo "tmux \c"
	@mkdir -p ${XDGCFG}/tmux
	@${LINK} "${DOTFILES}/shell/tmux.conf" ${XDGCFG}/tmux/tmux.conf
	@echo "configured"
tmux-clean:
	@echo "tmux \c"
	@${DELETE} -r ${XDGCFG}/tmux
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


# Security
security: gpg
security-clean: gpg-clean

gpg: gpg-clean
	@echo "GnuPG \c"
	@mkdir -m 700 -p ${XDGDATA}/gnupg
	@${LINK} "${DOTFILES}/security/gpg-agent.conf" \
		${XDGDATA}/gnupg/gpg-agent.conf
	@echo "configured"
gpg-clean:
	@echo "GnuPG \c"
	@${DELETE} ${XDGDATA}/gnupg/gpg-agent.conf
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
python: pip pypi ruff ipython jupyter
python-clean: pip-clean pypi-clean ruff-clean ipython-clean jupyter-clean

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

ruff: ruff-clean
	@echo "ruff \c"
	@mkdir -p ${TARGET}/.config/ruff
	@${LINK} "${DOTFILES}/python/ruff.toml" ${TARGET}/.config/ruff/ruff.toml
	@echo "configured"
ruff-clean:
	@echo "ruff \c"
	@${DELETE} -r ${TARGET}/.config/ruff
	@echo "cleaned"

ipython:ipython-clean
	@echo "IPython \c"
	@mkdir -p ${TARGET}/.ipython/profile_default
	@${LINK} "${DOTFILES}/python/ipython_config.py" \
		${TARGET}/.ipython/profile_default/ipython_config.py
	@echo "configured"
ipython-clean:
	@echo "IPython \c"
	@${DELETE} ${TARGET}/.ipython/profile_default/ipython_config.py
	@echo "cleaned"

jupyter:jupyter-clean
	@echo "Jupyter \c"
	@mkdir -p ${XDGCFG}/jupyter
	@${LINK} "${DOTFILES}/python/jupyter_lab_config.py" \
		${XDGCFG}/jupyter/jupyter_lab_config.py
	@echo "configured"
jupyter-clean:
	@echo "Jupyter \c"
	@${DELETE} ${XDGCFG}/jupyter/jupyter_lab_config.py
	@echo "cleaned"

ruby:ruby-clean
	@ echo "Ruby \c"
	@${LINK} "${DOTFILES}/ruby/gemrc" ${TARGET}/.gemrc
	@echo "configured"
ruby-clean:
	@echo "Ruby \c"
	@${DELETE} ${TARGET}/.gemrc
	@echo "cleaned"

node:node-clean
	@ echo "Node \c"
	@mkdir -p ${XDGCFG}/npm
	@${LINK} "${DOTFILES}/Node/npmrc" ${XDGCFG}/npm/npmrc
	@echo "configured"
node-clean:
	@echo "Node \c"
	@${DELETE} -r ${XDGCFG}/npm
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

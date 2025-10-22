# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
HMDIR	  := ${HOME}
XDGCFG    := ${HOME}/.config
XDGDATA   := ${HOME}/.local/share
XDGSTATE  := ${HOME}/.local/state
LINK	  := ln -fs
DELETE	  := rm -f

all: shell brew security tool dev db

clean: shell-clean \
    brew-clean \
    security-clean \
    tool-clean \
    dev-clean\
    db-clean


# Shell Environments
shell: zsh tmux
shell-clean: zsh-clean tmux-clean

zsh: zsh-clean
	@echo "Zsh \c"
	@${LINK} "${DOTFILES}/shell/zshenv" ${HMDIR}/.zshenv
	@mkdir -p ${XDGCFG}/zsh
	@mkdir -p ${XDGSTATE}/zsh
	@${LINK} "${DOTFILES}/shell/zprofile" ${XDGCFG}/zsh/.zprofile
	@${LINK} "${DOTFILES}/shell/zshrc" ${XDGCFG}/zsh/.zshrc
	@${LINK} "${DOTFILES}/shell/aliases" ${XDGCFG}/zsh/aliases
	@${LINK} "${DOTFILES}/shell/nmdirs" ${XDGCFG}/zsh/nmdirs
	@echo "configured"
zsh-clean:
	@echo "Zsh \c"
	@${DELETE} ${HMDIR}/.zshenv
	@${DELETE} -r ${XDGCFG}/zsh
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
	@mkdir -p ${XDGCFG}/homebrew
	@${LINK} "${DOTFILES}/homebrew/brew.env" \
		${XDGCFG}/homebrew/brew.env
	@echo "configured"
brew-clean:
	@echo "Homebrew \c"
	@${DELETE} ${XDGCFG}/homebrew/brew.env
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


# CLI Tools
tool: bat fd wget
tool-clean: bat-clean fd-clean wget-clean

bat: bat-clean
	@echo "bat \c"
	@mkdir -p ${XDGCFG}/bat
	@${LINK} "${DOTFILES}/tool/bat/config" \
		${XDGCFG}/bat/config
	@echo "configured"
bat-clean:
	@echo "bat \c"
	@${DELETE} -r ${XDGCFG}/bat
	@echo "cleaned"

fd: fd-clean
	@echo "fd \c"
	@mkdir -p ${XDGCFG}/fd
	@${LINK} "${DOTFILES}/tool/fd/ignore" \
		${XDGCFG}/fd/ignore
	@echo "configured"
fd-clean:
	@echo "fd \c"
	@${DELETE} -r ${XDGCFG}/fd
	@echo "cleaned"

wget: wget-clean
	@echo "Wget \c"
	@mkdir -p ${XDGCFG}/wget
	@${LINK} "${DOTFILES}/tool/wget/wgetrc" \
		${XDGCFG}/wget
	@echo "configured"
wget-clean:
	@echo "Wget \c"
	@${DELETE} -r ${XDGCFG}/wget
	@echo "cleaned"


# Development Environment
dev: git vim mise python ruby node r
dev-clean: git-clean vim-clean mise-clean python-clean ruby-clean \
	node-clean r-clean

git: git-clean
	@echo "git \c"
	@mkdir -p ${XDGCFG}/git
	@${LINK} "${DOTFILES}/dev/git/attributes" \
	    ${XDGCFG}/git/attributes
	@${LINK} "${DOTFILES}/dev/git/config" \
		${XDGCFG}/git/config
	@${LINK} "${DOTFILES}/dev/git/ignore" \
	    	${XDGCFG}/git/ignore
	@echo "configured"
git-clean:
	@echo "git \c"
	@${DELETE} ${XDGCFG}/git/attributes
	@${DELETE} ${XDGCFG}/git/config
	@${DELETE} ${XDGCFG}/git/ignore
	@echo "cleaned"

vim: vim-clean
	@echo "Vim \c"
	@mkdir -p ${XDGCFG}/vim
	@${LINK} "${DOTFILES}/dev/vim/vimrc" ${XDGCFG}/vim/vimrc
	@${LINK} "${DOTFILES}/dev/vim/gvimrc" ${XDGCFG}/vim/gvimrc
	@${LINK} "${DOTFILES}/dev/vim/ftdetect" ${XDGCFG}/vim/ftdetect
	@mkdir ${XDGCFG}/vim/after
	@${LINK} "${DOTFILES}/dev/vim/ftplugin" ${XDGCFG}/vim/after/ftplugin
	@${LINK} "${DOTFILES}/dev/vim/syntax" ${XDGCFG}/vim/after/syntax
	@mkdir -p ${XDGSTATE}/vim/viminfo
	@mkdir -p ${XDGSTATE}/vim/undo
	@echo "configured"
vim-clean:
	@echo "Vim \c"
	@${DELETE} ${XDGCFG}/vim/vimrc
	@${DELETE} ${XDGCFG}/vim/gvimrc
	@${DELETE} ${XDGCFG}/vim/ftdetect
	@${DELETE} -r ${XDGCFG}/vim/after
	@echo "cleaned"

nvim: nvim-clean
	@echo "Neovim \c"
	@mkdir -p ${XDGCFG}/nvim
	@${LINK} "${DOTFILES}/dev/nvim/init.vim" ${XDGCFG}/nvim/init.vim
	@echo "configured"
nvim-clean:
	@echo "Neovim \c"
	@${DELETE} -r ${XDGCFG}/nvim
	@echo "cleaned"

mise: mise-clean
	@echo "mise \c"
	@mkdir -p ${XDGCFG}/mise
	@${LINK} "${DOTFILES}/dev/mise/config.toml" ${XDGCFG}/mise/config.toml
	@echo "configured"
mise-clean:
	@echo "mise \c"
	@${DELETE} ${XDGCFG}/mise/config.toml
	@echo "cleaned"


python: pyhist pip pypi \
	ruff pylint ipython jupyter conda
python-clean: pip-clean pypi-clean \
	ruff-clean pylint-clean ipython-clean jupyter-clean conda-clean

pyhist:
	@echo "Python history folder \c"
	@mkdir -p ${XDGSTATE}/python
	@echo "configured"

pip: pip-clean
	@echo "pip \c"
	@mkdir -p ${XDGCFG}/pip
	@${LINK} "${DOTFILES}/dev/python/pip.conf" ${XDGCFG}/pip/pip.conf
	@echo "configured"
pip-clean:
	@echo "pip \c"
	@${DELETE} -r ${XDGCFG}/pip
	@echo "cleaned"

pypi: pypi-clean
	@echo "pypi \c"
	@mkdir -p ${XDGCFG}/pypi
	@${LINK} "${DOTFILES}/dev/python/pypirc" ${HMDIR}/.pypirc
	@echo "configured"
pypi-clean:
	@echo "pypi \c"
	@${DELETE} -r ${HMDIR}/.pypirc
	@echo "cleaned"

ruff: ruff-clean
	@echo "ruff \c"
	@mkdir -p ${XDGCFG}/ruff
	@${LINK} "${DOTFILES}/dev/python/ruff.toml" ${XDGCFG}/ruff/ruff.toml
	@echo "configured"
ruff-clean:
	@echo "ruff \c"
	@${DELETE} -r ${XDGCFG}/ruff
	@echo "cleaned"

pylint: pylint-clean
	@echo "pylint \c"
	@${LINK} "${DOTFILES}/dev/python/pylintrc" ${XDGCFG}/pylintrc
	@echo "configured"
pylint-clean:
	@echo "pylint \c"
	@${DELETE} ${XDGCFG}/pylintrc
	@echo "cleaned"

ipython:ipython-clean
	@echo "IPython \c"
	@mkdir -p ${XDGCFG}/ipython/profile_default
	@${LINK} "${DOTFILES}/dev/python/ipython_config.py" \
		${XDGCFG}/ipython/profile_default/ipython_config.py
	@echo "configured"
ipython-clean:
	@echo "IPython \c"
	@${DELETE} ${XDGCFG}/ipython/profile_default/ipython_config.py
	@echo "cleaned"

jupyter:jupyter-clean
	@echo "Jupyter \c"
	@mkdir -p ${XDGCFG}/jupyter
	@${LINK} "${DOTFILES}/dev/python/jupyter_lab_config.py" \
		${XDGCFG}/jupyter/jupyter_lab_config.py
	@echo "configured"
jupyter-clean:
	@echo "Jupyter \c"
	@${DELETE} ${XDGCFG}/jupyter/jupyter_lab_config.py
	@echo "cleaned"

conda:conda-clean
	@echo "conda \c"
	@mkdir -p ${XDGCFG}/conda
	@${LINK} "${DOTFILES}/dev/python/condarc" \
		${XDGCFG}/conda/condarc
	@echo "configured"
conda-clean:
	@echo "conda \c"
	@${DELETE} -r ${XDGCFG}/conda
	@echo "cleaned"


ruby:ruby-clean
	@ echo "Ruby \c"
	@mkdir -p ${XDGCFG}/gem
	@${LINK} "${DOTFILES}/dev/ruby/gemrc" ${XDGCFG}/gem/gemrc
	@echo "configured"
ruby-clean:
	@echo "Ruby \c"
	@${DELETE} -r ${XDGCFG}/gem
	@echo "cleaned"

node:node-clean
	@ echo "Node \c"
	@mkdir -p ${XDGCFG}/npm
	@${LINK} "${DOTFILES}/dev/node/npmrc" ${XDGCFG}/npm/npmrc
	@echo "configured"
node-clean:
	@echo "Node \c"
	@${DELETE} -r ${XDGCFG}/npm
	@echo "cleaned"

r:r-clean
	@ echo "R \c"
	@mkdir -p ${XDGCFG}/rstudio
	@${LINK} "${DOTFILES}/dev/r/rstudio-prefs.json" \
		${XDGCFG}/rstudio/rstudio-prefs.json
	@echo "configured"
r-clean:
	@echo "R \c"
	@${DELETE} ${XDGCFG}/rstudio/rstudio-prefs.json
	@echo "cleaned"


# Databases
db: pgsql sqlite
db-clean: pgsql-clean sqlite-clean

pgsql: pgsql-clean
	@echo "PostgreSQL \c"
	@mkdir -p ${XDGCFG}/pg
	@mkdir -p ${XDGSTATE}
	@${LINK} "${DOTFILES}/db/psqlrc" ${XDGCFG}/pg/psqlrc
	@echo "configured"
pgsql-clean:
	@echo "PostgreSQL \c"
	@${DELETE} -r ${XDGCFG}/pg
	@echo "cleaned"

sqlite: sqlite-clean
	@echo "SQLite \c"
	@mkdir -p ${XDGCFG}/sqlite3
	@${LINK} "${DOTFILES}/db/sqliterc" ${XDGCFG}/sqlite3/sqliterc
	@echo "configured"
sqlite-clean:
	@echo "SQLite \c"
	@${DELETE} -r ${XDGCFG}/sqlite3
	@echo "cleaned"

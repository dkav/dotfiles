# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs
DELETE	  := rm -f


all: zsh tmux git vim pip jupyter ruby npm pgsql sqlite

clean: zsh-clean shell-clean \
    git-clean vim-clean \
    pip-clean jupyter-clean npm-clean ruby-clean \
    pgsql-clean sqlite-clean


# Shell Environments
zsh: zsh-clean shell
	@echo "zsh \c"
	@${LINK} "${DOTFILES}/shell/zprofile" ${TARGET}/.zprofile
	@${LINK} "${DOTFILES}/shell/zshrc" ${TARGET}/.zshrc
	@echo "configured"
zsh-clean:
	@echo "zsh \c"
	@${DELETE} ${TARGET}/.zprofile
	@${DELETE} ${TARGET}/.zshrc
	@echo "cleaned"

shell: shell-clean
	@${LINK} "${DOTFILES}/shell/aliases" ${TARGET}/.aliases
shell-clean:
	@${DELETE} ${TARGET}/.aliases

tmux: tmux-clean shell
	@echo "tmux \c"
	@${LINK} "${DOTFILES}/tmux/tmux.conf" ${TARGET}/.tmux.conf
	@echo "configured"
tmux-clean:
	@echo "tmux \c"
	@${DELETE} ${TARGET}/.tmux.conf
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
	@echo "vim ..."
	@mkdir ${TARGET}/.vim
	@${LINK} "${DOTFILES}/vim/vimrc" ${TARGET}/.vim/vimrc
	@${LINK} "${DOTFILES}/vim/gvimrc" ${TARGET}/.vim/gvimrc
	@${LINK} "${DOTFILES}/vim/ftdetect" ${TARGET}/.vim/ftdetect
	@mkdir ${TARGET}/.vim/after
	@${LINK} "${DOTFILES}/vim/ftplugin" ${TARGET}/.vim/after/ftplugin
	@echo "... configured"
vim-clean:
	@echo "vim \c"
	@${DELETE} -r ${TARGET}/.vim
	@echo "cleaned"


# Programming Environments
pip: pip-clean
	@echo "pip \c"
	@mkdir -p ${TARGET}/.config/pip
	@${LINK} "${DOTFILES}/pip/pip.conf" ${TARGET}/.config/pip/pip.conf
	@echo "configured"
pip-clean:
	@echo "pip \c"
	@${DELETE} -r ${TARGET}/.config/pip
	@echo "cleaned"

jupyter:jupyter-clean
	@echo "Jupyter \c"
	@mkdir -p ${TARGET}/.jupyter
	@${LINK} "${DOTFILES}/jupyter/jupyter_notebook_config.py" \
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
pgsql: pgsql-clean
	@echo "pgsql \c"
	@${LINK} "${DOTFILES}/pgsql/psqlrc" ${TARGET}/.psqlrc
	@echo "configured"
pgsql-clean:
	@echo "pgsql \c"
	@${DELETE} ${TARGET}/.psqlrc
	@echo "cleaned"

sqlite: sqlite-clean
	@echo "sqlite \c"
	@${LINK} "${DOTFILES}/sqlite/sqliterc" ${TARGET}/.sqliterc
	@echo "configured"
sqlite-clean:
	@echo "sqlite \c"
	@${DELETE} ${TARGET}/.sqliterc
	@echo "cleaned"

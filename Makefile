# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs
DELETE	  := rm -f

all: bash zsh git hg vim pgsql
clean: bash-clean zsh-clean git-clean hg-clean vim-clean pgsql-clean


bash: bash-clean
	@echo "bash \c"
	@${LINK} ${DOTFILES}/bash/bash_profile ${TARGET}/.bash_profile
	@${LINK} ${DOTFILES}/bash/bashrc ${TARGET}/.bashrc
	@${LINK} ${DOTFILES}/bash/inputrc ${TARGET}/.inputrc
	@echo "is configured"
bash-clean:
	@${DELETE} ${TARGET}/.bash_profile
	@${DELETE} ${TARGET}/.bashrc
	@${DELETE} ${TARGET}/.inputrc
	@echo "bash cleaned"

zsh: zsh-clean
	@echo "zsh \c"
	@${LINK} ${DOTFILES}/zsh/zprofile ${TARGET}/.zprofile
	@${LINK} ${DOTFILES}/zsh/zshrc ${TARGET}/.zshrc
	@${LINK} ${DOTFILES}/zsh/zshenv ${TARGET}/.zshenv
	@echo "is configured"
zsh-clean:
	@${DELETE} ${TARGET}/.zprofile
	@${DELETE} ${TARGET}/.zshrc
	@${DELETE} ${TARGET}/.zshenv
	@echo "zsh cleaned"

git: git-clean
	@echo "git \c"
	@${LINK} ${DOTFILES}/git/gitconfig ${TARGET}/.gitconfig
	@${LINK} ${DOTFILES}/git/gitignore_global ${TARGET}/.gitignore_global
	@echo "is configured"
git-clean:
	@${DELETE} ${TARGET}/.gitconfig
	@${DELETE} ${TARGET}/.gitignore_global
	@echo "git cleaned"

hg: hg-clean
	@echo "hg \c"
	@${LINK} ${DOTFILES}/hg/hgrc ${TARGET}/.hgrc
	@${LINK} ${DOTFILES}/hg/hgignore_global ${TARGET}/.hgignore_global
	@echo "is configured"
hg-clean:
	@${DELETE} ${TARGET}/.hgrc
	@${DELETE} ${TARGET}/.hgignore_global
	@echo "hg cleaned"

vim: vim-clean
	@echo "vim \c"
	@${LINK} ${DOTFILES}/vim/vimrc ${TARGET}/.vimrc
	@${LINK} ${DOTFILES}/vim/gvimrc ${TARGET}/.gvimrc
	@${DOTFILES}/vim/vim_plugins.sh >/dev/null
	@echo "is configured"
vim-clean:
	@${DELETE} ${TARGET}/.vimrc
	@${DELETE} ${TARGET}/.gvimrc
	@${DELETE} -r ${TARGET}/.vim
	@echo "vim cleaned"

pgsql: pgsql-clean
	@echo "pgsql \c"
	@${LINK} ${DOTFILES}/pgsql/psqlrc ${TARGET}/.psqlrc
	@echo "is configured"
pgsql-clean:
	@${DELETE} ${TARGET}/.psqlrc
	@echo "pgsql cleaned"


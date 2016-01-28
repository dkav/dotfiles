DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs

all: bash zsh git hg vim pgsql

.PHONY: bash
bash:
	${LINK} ${DOTFILES}/bash/bash_profile ${TARGET}/.bash_profile
	${LINK} ${DOTFILES}/bash/bashrc ${TARGET}/.bashrc
	${LINK} ${DOTFILES}/bash/inputrc ${TARGET}/.inputrc

.PHONY: zsh
zsh: 
	${LINK} ${DOTFILES}/zsh/zprofile ${TARGET}/.zprofile
	${LINK} ${DOTFILES}/zsh/zshrc ${TARGET}/.zshrc
	${LINK} ${DOTFILES}/zsh/zshenv ${TARGET}/.zshenv

.PHONY: git
git:
	${LINK} ${DOTFILES}/git/gitconfig ${TARGET}/.gitconfig
	${LINK} ${DOTFILES}/git/gitignore_global ${TARGET}/.gitignore_global

.PHONY: hg
hg:
	${LINK} ${DOTFILES}/hg/hgrc ${TARGET}/.hgrc
	${LINK} ${DOTFILES}/hg/hgignore_global ${TARGET}/.hgignore_global

.PHONY: vim
vim:
	${LINK} ${DOTFILES}/vim/vimrc ${TARGET}/.vimrc
	${LINK} ${DOTFILES}/vim/gvimrc ${TARGET}/.gvimrc
	. ${DOTFILES}/vim/vim_plugins.sh

.PHONY: pgsql
pgsql:
	${LINK} ${DOTFILES}/pgsql/psqlrc ${TARGET}/.psqlrc

# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs
DELETE	  := rm -f


all: bash zsh git vim pgsql python ruby

clean: bash-clean zsh-clean shell-clean \
    git-clean hg-clean vim-clean pgsql-clean \
    python-clean ruby-clean


bash: bash-clean shell
	@echo "bash \c"
	@${LINK} ${DOTFILES}/shell/bash_profile ${TARGET}/.bash_profile
	@${LINK} ${DOTFILES}/shell/bashrc ${TARGET}/.bashrc
	@${LINK} ${DOTFILES}/shell/inputrc ${TARGET}/.inputrc
	@echo "configured"
bash-clean:
	@echo "bash \c"
	@${DELETE} ${TARGET}/.bash_profile
	@${DELETE} ${TARGET}/.bashrc
	@${DELETE} ${TARGET}/.inputrc
	@echo "cleaned"

zsh: zsh-clean shell
	@echo "zsh \c"
	@${LINK} ${DOTFILES}/shell/zprofile ${TARGET}/.zprofile
	@${LINK} ${DOTFILES}/shell/zshrc ${TARGET}/.zshrc
	@echo "configured"
zsh-clean:
	@echo "zsh \c"
	@${DELETE} ${TARGET}/.zprofile
	@${DELETE} ${TARGET}/.zshrc
	@echo "cleaned"

shell: shell-clean
	@${LINK} ${DOTFILES}/shell/aliases ${TARGET}/.aliases
	@${LINK} ${DOTFILES}/dev/ ${TARGET}/.dev
shell-clean:
	@${DELETE} ${TARGET}/.aliases
	@${DELETE} ${TARGET}/.dev

x11: x11-clean
	@echo "X11 \c"
	@${LINK} ${DOTFILES}/x11/Xresources ${TARGET}/.Xresources
	@echo "configured"
x11-clean:
	@echo "X11 \c"
	@${DELETE} ${TARGET}/.Xresources
	@echo "cleaned"

git: git-clean
	@echo "git \c"
	@mkdir -p ${TARGET}/.config/git
	@${LINK} ${DOTFILES}/git/config ${TARGET}/.config/git/config
	@${LINK} ${DOTFILES}/git/ignore ${TARGET}/.config/git/ignore
	@echo "configured"
git-clean:
	@echo "git \c"
	@${DELETE} -r ${TARGET}/.config/git
	@echo "cleaned"

hg: hg-clean
	@echo "hg \c"
	@${LINK} ${DOTFILES}/hg/hgrc ${TARGET}/.hgrc
	@${LINK} ${DOTFILES}/hg/hgignore_global \
		${TARGET}/.hgignore_global
	@echo "configured"
hg-clean:
	@echo "hg \c"
	@${DELETE} ${TARGET}/.hgrc
	@${DELETE} ${TARGET}/.hgignore_global
	@echo "cleaned"

vim: vim-clean
	@echo "vim \c"
	@mkdir ${TARGET}/.vim
	@${LINK} ${DOTFILES}/vim/vimrc ${TARGET}/.vim/vimrc
	@${LINK} ${DOTFILES}/vim/gvimrc ${TARGET}/.vim/gvimrc
	@${DOTFILES}/vim/vim_plugins.sh >/dev/null
	@echo "configured"
vim-clean:
	@echo "vim \c"
	@${DELETE} -r ${TARGET}/.vim
	@echo "cleaned"

pgsql: pgsql-clean
	@echo "pgsql \c"
	@${LINK} ${DOTFILES}/pgsql/psqlrc ${TARGET}/.psqlrc
	@echo "configured"
pgsql-clean:
	@echo "pgsql \c"
	@${DELETE} ${TARGET}/.psqlrc
	@echo "cleaned"

python:python-clean
	@ echo "Python \c"
	@mkdir ${TARGET}/.pip
	@${LINK} ${DOTFILES}/python/pip.conf ${TARGET}/.pip/pip.conf
	@echo "configured"
python-clean:
	@echo "Python \c"
	@${DELETE} -r ${TARGET}/.pip
	@echo "cleaned"

ruby:ruby-clean
	@ echo "Ruby \c"
	@${LINK} ${DOTFILES}/ruby/gemrc ${TARGET}/.gemrc
	@echo "configured"
ruby-clean:
	@echo "Ruby \c"
	@${DELETE} ${TARGET}/.gemrc
	@echo "cleaned"

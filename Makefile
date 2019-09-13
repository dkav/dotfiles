# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile

DOTFILES  := ${PWD}
TARGET	  := ${HOME}
LINK	  := ln -fs
DELETE	  := rm -f


all: bash zsh tmux gpg git vim ruby pgsql sqlite

clean: bash-clean zsh-clean shell-clean \
    gpg-clean git-clean vim-clean \
    ruby-clean \
    pgsql-clean sqlite-clean


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
shell-clean:
	@${DELETE} ${TARGET}/.aliases

tmux: tmux-clean shell
	@echo "tmux \c"
	@${LINK} ${DOTFILES}/tmux/tmux.conf ${TARGET}/.tmux.conf
	@echo "configured"
tmux-clean:
	@echo "tmux \c"
	@${DELETE} ${TARGET}/.tmux.conf
	@echo "cleaned"


gpg: gpg-clean
	@echo "gpg \c"
	@mkdir -p ${TARGET}/.gpg
	@${LINK} ${DOTFILES}/gpg/gpg-agent.conf \
	    ${TARGET}/.gnupg/gpg-agent.conf
	@echo "configured"
gpg-clean:
	@echo "gpg \c"
	@${DELETE} ${TARGET}/.gnupg/gpg-agent.conf
	@echo "cleaned"

git: git-clean
	@echo "git \c"
	@mkdir -p ${TARGET}/.config/git
	@${LINK} ${DOTFILES}/git/attributes \
	    ${TARGET}/.config/git/attributes
	@${LINK} ${DOTFILES}/git/config \
		${TARGET}/.config/git/config
	@${LINK} ${DOTFILES}/git/ignore \
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
	@mkdir ${TARGET}/.vim
	@${LINK} ${DOTFILES}/vim/vimrc ${TARGET}/.vim/vimrc
	@${LINK} ${DOTFILES}/vim/gvimrc ${TARGET}/.vim/gvimrc
	@${LINK} ${DOTFILES}/vim/ftdetect ${TARGET}/.vim/ftdetect
	@mkdir ${TARGET}/.vim/after
	@${LINK} ${DOTFILES}/vim/ftplugin ${TARGET}/.vim/after/ftplugin
	@${DOTFILES}/vim/vim_plugins.sh >/dev/null
	@echo "configured"
vim-clean:
	@echo "vim \c"
	@${DELETE} -r ${TARGET}/.vim
	@echo "cleaned"


ruby:ruby-clean
	@ echo "Ruby \c"
	@${LINK} ${DOTFILES}/ruby/gemrc ${TARGET}/.gemrc
	@echo "configured"
ruby-clean:
	@echo "Ruby \c"
	@${DELETE} ${TARGET}/.gemrc
	@echo "cleaned"


pgsql: pgsql-clean
	@echo "pgsql \c"
	@${LINK} ${DOTFILES}/pgsql/psqlrc ${TARGET}/.psqlrc
	@echo "configured"
pgsql-clean:
	@echo "pgsql \c"
	@${DELETE} ${TARGET}/.psqlrc
	@echo "cleaned"

sqlite: sqlite-clean
	@echo "sqlite \c"
	@${LINK} ${DOTFILES}/sqlite/sqliterc ${TARGET}/.sqliterc
	@echo "configured"
sqlite-clean:
	@echo "sqlite \c"
	@${DELETE} ${TARGET}/.sqliterc
	@echo "cleaned"

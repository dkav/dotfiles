# Makefile for dotfiles
#
# Based on code from Rob Loach -
# https://github.com/RobLoach/dotfiles/blob/master/Makefile
#
# Configure targets are idempotent (ln -sfn replaces existing links).
# Clean targets remove only the links this Makefile creates, then remove the
# containing directory if it is left empty. Other files are never deleted.

DOTFILES := $(CURDIR)
HMDIR    := ${HOME}
XDGCFG   := ${HOME}/.config
XDGDATA  := ${HOME}/.local/share
XDGSTATE := ${HOME}/.local/state
LINK     := ln -sfn
DELETE   := rm -f
RMDIR    := rmdir

all: shell brew security tool ai dev db

.PHONY: all clean shell shell-clean zsh zsh-clean tmux tmux-clean \
        brew brew-clean security security-clean gpg gpg-clean \
        tool tool-clean bat bat-clean fd fd-clean wget wget-clean \
        ai ai-clean codex opencode opencode-clean \
        dev dev-clean git git-clean vim vim-clean nvim nvim-clean \
        mise mise-clean python python-clean pyhist pip pip-clean \
        pypi pypi-clean ruff ruff-clean pylint pylint-clean \
        ipython ipython-clean jupyter jupyter-clean ruby ruby-clean \
        node node-clean r r-clean db db-clean pgsql pgsql-clean \
        sqlite sqlite-clean

clean: shell-clean \
	brew-clean \
	security-clean \
	tool-clean \
	ai-clean \
	dev-clean \
	db-clean


# Shell Environments
shell: zsh tmux
shell-clean: zsh-clean tmux-clean

zsh:
	@printf 'Zsh '
	@${LINK} "${DOTFILES}/shell/zshenv" "${HMDIR}/.zshenv"
	@mkdir -p "${XDGCFG}/zsh"
	@mkdir -p "${XDGSTATE}/zsh"
	@${LINK} "${DOTFILES}/shell/zprofile" "${XDGCFG}/zsh/.zprofile"
	@${LINK} "${DOTFILES}/shell/zshrc" "${XDGCFG}/zsh/.zshrc"
	@${LINK} "${DOTFILES}/shell/aliases" "${XDGCFG}/zsh/aliases"
	@${LINK} "${DOTFILES}/shell/functions" "${XDGCFG}/zsh/functions"
	@echo "configured"
zsh-clean:
	@printf 'Zsh '
	@${DELETE} "${HMDIR}/.zshenv"
	@${DELETE} "${XDGCFG}/zsh/.zprofile"
	@${DELETE} "${XDGCFG}/zsh/.zshrc"
	@${DELETE} "${XDGCFG}/zsh/aliases"
	@${DELETE} "${XDGCFG}/zsh/functions"
	@${RMDIR} "${XDGCFG}/zsh" 2>/dev/null || true
	@echo "cleaned"

tmux:
	@printf 'tmux '
	@mkdir -p "${XDGCFG}/tmux"
	@${LINK} "${DOTFILES}/shell/tmux.conf" "${XDGCFG}/tmux/tmux.conf"
	@echo "configured"
tmux-clean:
	@printf 'tmux '
	@${DELETE} "${XDGCFG}/tmux/tmux.conf"
	@${RMDIR} "${XDGCFG}/tmux" 2>/dev/null || true
	@echo "cleaned"


# Homebrew
brew:
	@printf 'Homebrew '
	@mkdir -p "${XDGCFG}/homebrew"
	@${LINK} "${DOTFILES}/homebrew/brew.env" \
		"${XDGCFG}/homebrew/brew.env"
	@echo "configured"
brew-clean:
	@printf 'Homebrew '
	@${DELETE} "${XDGCFG}/homebrew/brew.env"
	@${RMDIR} "${XDGCFG}/homebrew" 2>/dev/null || true
	@echo "cleaned"


# Security
security: gpg
security-clean: gpg-clean

gpg:
	@printf 'GnuPG '
	@mkdir -m 700 -p "${XDGDATA}/gnupg"
	@${LINK} "${DOTFILES}/security/gpg-agent.conf" \
		"${XDGDATA}/gnupg/gpg-agent.conf"
	@echo "configured"
gpg-clean:
	@printf 'GnuPG '
	@${DELETE} "${XDGDATA}/gnupg/gpg-agent.conf"
	@echo "cleaned"


# CLI Tools
tool: bat fd wget
tool-clean: bat-clean fd-clean wget-clean

bat:
	@printf 'bat '
	@mkdir -p "${XDGCFG}/bat"
	@${LINK} "${DOTFILES}/tool/bat/config" \
		"${XDGCFG}/bat/config"
	@echo "configured"
bat-clean:
	@printf 'bat '
	@${DELETE} "${XDGCFG}/bat/config"
	@${RMDIR} "${XDGCFG}/bat" 2>/dev/null || true
	@echo "cleaned"

fd:
	@printf 'fd '
	@mkdir -p "${XDGCFG}/fd"
	@${LINK} "${DOTFILES}/tool/fd/ignore" \
		"${XDGCFG}/fd/ignore"
	@echo "configured"
fd-clean:
	@printf 'fd '
	@${DELETE} "${XDGCFG}/fd/ignore"
	@${RMDIR} "${XDGCFG}/fd" 2>/dev/null || true
	@echo "cleaned"

wget:
	@printf 'Wget '
	@mkdir -p "${XDGCFG}/wget"
	@${LINK} "${DOTFILES}/tool/wget/wgetrc" \
		"${XDGCFG}/wget/wgetrc"
	@echo "configured"
wget-clean:
	@printf 'Wget '
	@${DELETE} "${XDGCFG}/wget/wgetrc"
	@${RMDIR} "${XDGCFG}/wget" 2>/dev/null || true
	@echo "cleaned"


# AI Tools
ai: codex opencode
ai-clean: opencode-clean

codex:
	@printf 'Codex '
	@mkdir -p "${XDGCFG}/codex"
	@echo "configured"

opencode:
	@printf 'OpenCode '
	@mkdir -p "${XDGCFG}/opencode"
	@${LINK} "${DOTFILES}/ai/opencode.jsonc" \
		"${XDGCFG}/opencode/opencode.jsonc"
	@echo "configured"
opencode-clean:
	@printf 'OpenCode '
	@${DELETE} "${XDGCFG}/opencode/opencode.jsonc"
	@${RMDIR} "${XDGCFG}/opencode" 2>/dev/null || true
	@echo "cleaned"


# Development Environment
dev: git vim mise python ruby node r
dev-clean: git-clean vim-clean mise-clean python-clean ruby-clean \
	node-clean r-clean

git:
	@printf 'git '
	@mkdir -p "${XDGCFG}/git"
	@${LINK} "${DOTFILES}/dev/git/attributes" \
		"${XDGCFG}/git/attributes"
	@${LINK} "${DOTFILES}/dev/git/config" \
		"${XDGCFG}/git/config"
	@${LINK} "${DOTFILES}/dev/git/ignore" \
		"${XDGCFG}/git/ignore"
	@echo "configured"
git-clean:
	@printf 'git '
	@${DELETE} "${XDGCFG}/git/attributes"
	@${DELETE} "${XDGCFG}/git/config"
	@${DELETE} "${XDGCFG}/git/ignore"
	@${RMDIR} "${XDGCFG}/git" 2>/dev/null || true
	@echo "cleaned"

vim:
	@printf 'Vim '
	@mkdir -p "${XDGCFG}/vim"
	@${LINK} "${DOTFILES}/dev/vim/vimrc" "${XDGCFG}/vim/vimrc"
	@${LINK} "${DOTFILES}/dev/vim/gvimrc" "${XDGCFG}/vim/gvimrc"
	@${LINK} "${DOTFILES}/dev/vim/ftdetect" "${XDGCFG}/vim/ftdetect"
	@mkdir -p "${XDGCFG}/vim/after"
	@${LINK} "${DOTFILES}/dev/vim/ftplugin" "${XDGCFG}/vim/after/ftplugin"
	@${LINK} "${DOTFILES}/dev/vim/syntax" "${XDGCFG}/vim/after/syntax"
	@mkdir -p "${XDGSTATE}/vim/viminfo"
	@mkdir -p "${XDGSTATE}/vim/undo"
	@echo "configured"
vim-clean:
	@printf 'Vim '
	@${DELETE} "${XDGCFG}/vim/vimrc"
	@${DELETE} "${XDGCFG}/vim/gvimrc"
	@${DELETE} "${XDGCFG}/vim/ftdetect"
	@${DELETE} "${XDGCFG}/vim/after/ftplugin"
	@${DELETE} "${XDGCFG}/vim/after/syntax"
	@${RMDIR} "${XDGCFG}/vim/after" 2>/dev/null || true
	@${RMDIR} "${XDGCFG}/vim" 2>/dev/null || true
	@echo "cleaned"

# Not part of `dev`; run explicitly with `make nvim`.
nvim:
	@printf 'Neovim '
	@mkdir -p "${XDGCFG}/nvim"
	@${LINK} "${DOTFILES}/dev/nvim/init.vim" "${XDGCFG}/nvim/init.vim"
	@echo "configured"
nvim-clean:
	@printf 'Neovim '
	@${DELETE} "${XDGCFG}/nvim/init.vim"
	@${RMDIR} "${XDGCFG}/nvim" 2>/dev/null || true
	@echo "cleaned"

mise:
	@printf 'mise '
	@mkdir -p "${XDGCFG}/mise"
	@${LINK} "${DOTFILES}/dev/mise/config.toml" "${XDGCFG}/mise/config.toml"
	@echo "configured"
mise-clean:
	@printf 'mise '
	@${DELETE} "${XDGCFG}/mise/config.toml"
	@${RMDIR} "${XDGCFG}/mise" 2>/dev/null || true
	@echo "cleaned"


python: pyhist pip pypi \
	ruff pylint ipython jupyter
python-clean: pip-clean pypi-clean \
	ruff-clean pylint-clean ipython-clean jupyter-clean

pyhist:
	@printf 'Python history folder '
	@mkdir -p "${XDGSTATE}/python"
	@echo "configured"

pip:
	@printf 'pip '
	@mkdir -p "${XDGCFG}/pip"
	@${LINK} "${DOTFILES}/dev/python/pip.conf" "${XDGCFG}/pip/pip.conf"
	@echo "configured"
pip-clean:
	@printf 'pip '
	@${DELETE} "${XDGCFG}/pip/pip.conf"
	@${RMDIR} "${XDGCFG}/pip" 2>/dev/null || true
	@echo "cleaned"

pypi:
	@printf 'pypi '
	@${LINK} "${DOTFILES}/dev/python/pypirc" "${HMDIR}/.pypirc"
	@echo "configured"
pypi-clean:
	@printf 'pypi '
	@${DELETE} "${HMDIR}/.pypirc"
	@echo "cleaned"

ruff:
	@printf 'ruff '
	@mkdir -p "${XDGCFG}/ruff"
	@${LINK} "${DOTFILES}/dev/python/ruff.toml" "${XDGCFG}/ruff/ruff.toml"
	@echo "configured"
ruff-clean:
	@printf 'ruff '
	@${DELETE} "${XDGCFG}/ruff/ruff.toml"
	@${RMDIR} "${XDGCFG}/ruff" 2>/dev/null || true
	@echo "cleaned"

pylint:
	@printf 'pylint '
	@${LINK} "${DOTFILES}/dev/python/pylintrc" "${XDGCFG}/pylintrc"
	@echo "configured"
pylint-clean:
	@printf 'pylint '
	@${DELETE} "${XDGCFG}/pylintrc"
	@echo "cleaned"

ipython:
	@printf 'IPython '
	@mkdir -p "${XDGCFG}/ipython/profile_default"
	@${LINK} "${DOTFILES}/dev/python/ipython_config.py" \
		"${XDGCFG}/ipython/profile_default/ipython_config.py"
	@echo "configured"
ipython-clean:
	@printf 'IPython '
	@${DELETE} "${XDGCFG}/ipython/profile_default/ipython_config.py"
	@${RMDIR} "${XDGCFG}/ipython/profile_default" 2>/dev/null || true
	@${RMDIR} "${XDGCFG}/ipython" 2>/dev/null || true
	@echo "cleaned"

jupyter:
	@printf 'Jupyter '
	@mkdir -p "${XDGCFG}/jupyter"
	@${LINK} "${DOTFILES}/dev/python/jupyter_lab_config.py" \
		"${XDGCFG}/jupyter/jupyter_lab_config.py"
	@echo "configured"
jupyter-clean:
	@printf 'Jupyter '
	@${DELETE} "${XDGCFG}/jupyter/jupyter_lab_config.py"
	@${RMDIR} "${XDGCFG}/jupyter" 2>/dev/null || true
	@echo "cleaned"


ruby:
	@printf 'Ruby '
	@mkdir -p "${XDGCFG}/gem"
	@${LINK} "${DOTFILES}/dev/ruby/gemrc" "${XDGCFG}/gem/gemrc"
	@echo "configured"
ruby-clean:
	@printf 'Ruby '
	@${DELETE} "${XDGCFG}/gem/gemrc"
	@${RMDIR} "${XDGCFG}/gem" 2>/dev/null || true
	@echo "cleaned"

node:
	@printf 'Node '
	@mkdir -p "${XDGCFG}/npm"
	@${LINK} "${DOTFILES}/dev/node/npmrc" "${XDGCFG}/npm/npmrc"
	@echo "configured"
node-clean:
	@printf 'Node '
	@${DELETE} "${XDGCFG}/npm/npmrc"
	@${RMDIR} "${XDGCFG}/npm" 2>/dev/null || true
	@echo "cleaned"

r:
	@printf 'R '
	@mkdir -p "${XDGCFG}/r"
	@mkdir -p "${XDGSTATE}/r"
	@${LINK} "${DOTFILES}/dev/r/rprofile" \
		"${XDGCFG}/r/rprofile"
	@mkdir -p "${XDGCFG}/rstudio"
	@${LINK} "${DOTFILES}/dev/r/rstudio-prefs.json" \
		"${XDGCFG}/rstudio/rstudio-prefs.json"
	@echo "configured"
r-clean:
	@printf 'R '
	@${DELETE} "${XDGCFG}/r/rprofile"
	@${DELETE} "${XDGCFG}/rstudio/rstudio-prefs.json"
	@${RMDIR} "${XDGCFG}/r" 2>/dev/null || true
	@${RMDIR} "${XDGCFG}/rstudio" 2>/dev/null || true
	@echo "cleaned"


# Databases
db: pgsql sqlite
db-clean: pgsql-clean sqlite-clean

pgsql:
	@printf 'PostgreSQL '
	@mkdir -p "${XDGCFG}/pg"
	@mkdir -p "${XDGSTATE}"
	@${LINK} "${DOTFILES}/db/psqlrc" "${XDGCFG}/pg/psqlrc"
	@echo "configured"
pgsql-clean:
	@printf 'PostgreSQL '
	@${DELETE} "${XDGCFG}/pg/psqlrc"
	@${RMDIR} "${XDGCFG}/pg" 2>/dev/null || true
	@echo "cleaned"

sqlite:
	@printf 'SQLite '
	@mkdir -p "${XDGCFG}/sqlite3"
	@${LINK} "${DOTFILES}/db/sqliterc" "${XDGCFG}/sqlite3/sqliterc"
	@echo "configured"
sqlite-clean:
	@printf 'SQLite '
	@${DELETE} "${XDGCFG}/sqlite3/sqliterc"
	@${RMDIR} "${XDGCFG}/sqlite3" 2>/dev/null || true
	@echo "cleaned"

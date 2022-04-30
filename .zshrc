# Path to your oh-my-zsh installation.
ZSH="/home/${USER}/.oh-my-zsh"

if [ ! -d $ZSH ]; then
  # bootstrap oh-my-zsh installation
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

export ZSH

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker-compose fasd fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

set -o vi

###########
# Exports #
###########
export GPG_TTY=$(tty)
export TERM=xterm-256color
export EDITOR=vim

# Source alias file if it exists
[[ -f ~/.alias ]] && source ~/.alias

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
  eval "$("$BASE16_SHELL/profile_helper.sh")"

if ! command -v starship >/dev/null; then
  echo "Installing starship prompt..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# GPG signing for git commits
export GPG_TTY=$(tty)

command -v starship >/dev/null && eval "$(starship init zsh)"

export BW_SESSION="wErB0tkp6/CIj2VpAoyr20BaCWjy1nxtiASrimXx5eAG+iluQ/q2YPdFI84aFQ6UtMgpsuESySBbOYM6p0c/vA=="

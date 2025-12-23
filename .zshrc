# -----------------------------------------------------------------------------
# Coder Dotfiles - ZSH Configuration
# -----------------------------------------------------------------------------

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme - simple and fast
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  docker
  kubectl
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------

# Editor
export EDITOR="code --wait"
export VISUAL="$EDITOR"

# fnm (Fast Node Manager) - installed in /opt/fnm
export FNM_DIR=/opt/fnm
export PATH="/opt/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# Pulumi - installed in /opt/pulumi
export PATH="/opt/pulumi/bin:$PATH"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
[[ -f ~/.aliases ]] && source ~/.aliases

# -----------------------------------------------------------------------------
# Project-specific
# -----------------------------------------------------------------------------

# Auto-cd to workspace on new shell (if exists)
if [ -d "/workspaces/travelspirit" ] && [ "$PWD" = "$HOME" ]; then
  cd /workspaces/travelspirit
fi

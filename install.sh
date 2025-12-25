#!/bin/bash
# Coder Dotfiles Bootstrap Script
# This script is automatically run by `coder dotfiles` command
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing dotfiles from $DOTFILES_DIR..."

# -----------------------------------------------------------------------------
# Oh My Zsh
# -----------------------------------------------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh-autosuggestions plugin
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

# Install zsh-syntax-highlighting plugin
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

# -----------------------------------------------------------------------------
# Tmux Plugin Manager
# -----------------------------------------------------------------------------
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# -----------------------------------------------------------------------------
# Claude Code
# -----------------------------------------------------------------------------
if ! command -v claude &> /dev/null; then
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

# -----------------------------------------------------------------------------
# Symlink Dotfiles
# -----------------------------------------------------------------------------
echo "Symlinking dotfiles..."

# Function to safely symlink (backup existing files)
link_file() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  Backing up existing $dst to $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  if [ -L "$dst" ]; then
    rm "$dst"
  fi

  ln -sf "$src" "$dst"
  echo "  Linked $dst -> $src"
}

link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.aliases" "$HOME/.aliases"

# Git config (merge, don't replace - preserves user.email/name set by Coder)
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
  echo "  Applying git config..."
  # Include our gitconfig from the main one
  git config --global include.path "$DOTFILES_DIR/.gitconfig"
fi

# -----------------------------------------------------------------------------
# Set Zsh as default shell (if not already)
# -----------------------------------------------------------------------------
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting zsh as default shell..."
  sudo chsh -s "$(which zsh)" "$(whoami)" 2>/dev/null || true
fi

echo "Dotfiles installation complete!"
echo "Run 'source ~/.zshrc' or start a new shell to apply changes."

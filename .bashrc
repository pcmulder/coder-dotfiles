# Coder workspace .bashrc
# This file is sourced by bash on interactive login

# Switch to zsh if available (bash is default in Coder, but we prefer zsh)
if [ -x /bin/zsh ] && [ -z "$ZSH_VERSION" ]; then
  exec /bin/zsh -l
fi

# If we're still in bash (zsh not available), set up basic environment
export PATH="$HOME/.local/bin:$PATH"

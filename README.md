# Coder Dotfiles

Personal dotfiles for Coder cloud development workspaces.

## Usage

Set your dotfiles repository in Coder workspace settings:

```
https://github.com/pcmulder/coder-dotfiles
```

Or via CLI:

```bash
coder dotfiles https://github.com/pcmulder/coder-dotfiles -y
```

## What's Included

- **Zsh** with Oh My Zsh, autosuggestions, and syntax highlighting
- **Tmux** with sensible defaults, mouse support, and session persistence
- **Git** aliases and improved defaults
- **Shell aliases** for git, nx, docker, kubectl, and common tasks

## Structure

```
.
├── install.sh      # Bootstrap script (run automatically by Coder)
├── .zshrc          # Zsh configuration
├── .tmux.conf      # Tmux configuration
├── .aliases        # Shell aliases
├── .gitconfig      # Git configuration (included, not replaced)
└── README.md
```

## Customization

Fork this repo and modify to your preferences. The `install.sh` script:

1. Installs Oh My Zsh and plugins
2. Installs Tmux Plugin Manager
3. Symlinks dotfiles to home directory
4. Includes gitconfig (preserves Coder-set user.name/email)

## Tmux Keybindings

| Key | Action |
|-----|--------|
| `C-a` | Prefix (instead of C-b) |
| `C-a \|` | Split pane horizontally |
| `C-a -` | Split pane vertically |
| `C-a r` | Reload config |
| `Alt+Arrow` | Switch panes |

## Key Aliases

| Alias | Command |
|-------|---------|
| `ws` | `cd /workspaces/travelspirit` |
| `vtb-api` | `npx nx serve visual-tour-builder-api` |
| `vtb-fe` | `npx nx serve visual-tour-builder-frontend` |
| `ts-api` | `npx nx serve travelspirit-api` |
| `k` | `kubectl` |
| `g` | `git` |
| `gs` | `git status` |
| `psql-dev` | Connect to workspace PostgreSQL |

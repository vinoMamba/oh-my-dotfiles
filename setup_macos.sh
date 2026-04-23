#!/bin/bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

info()  { echo -e "\033[1;34m[INFO]\033[0m  $*"; }
ok()    { echo -e "\033[1;32m[OK]\033[0m    $*"; }
warn()  { echo -e "\033[1;33m[WARN]\033[0m  $*"; }

# ── Homebrew ────────────────────────────────────────────────
if command -v brew &>/dev/null; then
  ok "Homebrew already installed"
else
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to PATH for Apple Silicon Macs
  if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  ok "Homebrew installed"
fi

# ── Packages ────────────────────────────────────────────────
info "Installing packages via Homebrew..."

brew install --formula ghostty
brew install --formula zsh
brew install --formula neovim
brew install --formula fzf
brew install --formula zoxide
brew install --formula mise
brew install --formula yazi
brew install --formula fastfetch
brew install --formula lazygit
brew install --cask font-maple-mono-nerd-font

ok "All packages installed"

# ── Symlink configs ─────────────────────────────────────────
info "Setting up config symlinks..."

# Ghostty
mkdir -p ~/.config/ghostty
ln -snf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config
ok "Ghostty config linked"

# Git
ln -snf "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig
ok "Git config linked"

# Neovim
# Remove existing nvim config dir if it's a plain directory (not a symlink)
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
  warn "Existing ~/.config/nvim directory found, backing up to ~/.config/nvim.bak"
  mv ~/.config/nvim ~/.config/nvim.bak
fi
ln -snf "$DOTFILES_DIR/nvim" ~/.config/nvim
ok "Neovim config linked"

# Zsh
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
  warn "Existing ~/.zshrc found, backing up to ~/.zshrc.bak"
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -snf "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc

if [ -f ~/.p10k.zsh ] && [ ! -L ~/.p10k.zsh ]; then
  warn "Existing ~/.p10k.zsh found, backing up to ~/.p10k.zsh.bak"
  mv ~/.p10k.zsh ~/.p10k.zsh.bak
fi
ln -snf "$DOTFILES_DIR/zsh/p10k.zsh" ~/.p10k.zsh
ok "Zsh config linked"

# Mise (dev environment)
mkdir -p ~/.config/mise
if [ -f ~/.config/mise/config.toml ] && [ ! -L ~/.config/mise/config.toml ]; then
  warn "Existing mise config found, backing up to ~/.config/mise/config.toml.bak"
  mv ~/.config/mise/config.toml ~/.config/mise/config.toml.bak
fi
ln -snf "$DOTFILES_DIR/mise/config.toml" ~/.config/mise/config.toml
ok "Mise config linked"

info "Installing dev tools via mise (go, node, bun, python)..."
mise trust "$DOTFILES_DIR/mise/config.toml"
mise install -y
ok "Dev tools installed"

# ── Done ────────────────────────────────────────────────────
echo ""
echo -e "\033[1;32mAll done!\033[0m Open Ghostty and start editing."

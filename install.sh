#!/bin/bash

set -e

echo "▶ dotfiles setup start"

DOTFILES_DIR="$HOME/dotfiles"

# --- backup function ---
backup() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    echo "Backup $1 -> $1.backup"
    mv "$1" "$1.backup"
  fi
}

# --- symlink function ---
link() {
  echo "Link $1 -> $2"
  ln -sf "$1" "$2"
}

# --- zshrc ---
backup "$HOME/.zshrc"
link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

# --- gitconfig ---
backup "$HOME/.gitconfig"
link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

# --- vscode settings ---
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_DIR"

backup "$VSCODE_DIR/settings.json"
link "$DOTFILES_DIR/vscode-settings.json" "$VSCODE_DIR/settings.json"

echo "▶ done!"

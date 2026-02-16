#!/usr/bin/env bash

set -e

DOTFILES="$HOME/Projects/dotfiles"

echo "Linking zsh..."
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.aliases" "$HOME/.aliases" 2>/dev/null || true
ln -sf "$DOTFILES/zsh/.functions" "$HOME/.functions" 2>/dev/null || true
ln -sf "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh" 2>/dev/null || true

echo "Linking fish..."
mkdir -p "$HOME/.config/fish"
ln -sf "$DOTFILES/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "$DOTFILES/fish/fish_plugins" "$HOME/.config/fish/fish_plugins" 2>/dev/null || true

echo "Linking git..."
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "Done."


#!/bin/bash

DOTFILES_DIR="$HOME/.config/dotfiles"

CONFIGS=(
  "fastfetch"
  "ghostty"
  "hypr"
  "mako"
  "rofi"
  "tmux"
  "waybar"
)

for config in "${CONFIGS[@]}"; do
  source_path="$HOME/.config/$config"
  target_path="$DOTFILES_DIR/$config"

  if [ -d "$source_path" ]; then
    echo "🔄 Обновляю $config..."
    rsync -a --delete --exclude='.git' "$source_path/" "$target_path/"
  else
    echo "❌ Источник $source_path не найден!"
  fi
done

echo "✅ Все конфиги обновлены."

#!/bin/bash

#-- Debugging: Verificar el directorio y los archivos --#

echo "Buscando imágenes en: $HOME/.config/wallpapers"

#-- Random Wallpaper --#

wallpaper=$(find "$HOME/.config/wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

#-- Set wallpaper --#

swww img -t fade "$wallpaper"

#-- Set palette --#

wal -i "$wallpaper"  # Aplicar el wallpaper y la paleta

killall waybar && waybar &

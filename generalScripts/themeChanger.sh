#!/bin/bash

#--Array of themes--#

declare -A themeMap
for theme in "$HOME/.config/hyprDots/themes/"*; do
    themeName=$(basename "$theme")
    themeMap["$themeName"]="$theme"
done

#--Wofi selection--#

selectedTheme=$(echo -e "${!themeMap[@]}" | wofi --dmenu --prompt "choose theme :)")
if [[ -z "$selectedTheme" ]]; then
    echo "No theme selected. Exiting..."
    exit 1
fi

selectedThemePath="${themeMap[$selectedTheme]}"

#--Changing symlinks--#

if [[ -d "$selectedThemePath" ]]; then
    ln -sf "$selectedThemePath/hyprland" "$HOME/.config/hypr"
    ln -sf "$selectedThemePath/waybar" "$HOME/.config/waybar"
    ln -sf "$selectedThemePath/wofi" "$HOME/.config/wofi"
    ln -sf "$selectedThemePath/wallpapers" "$HOME/.config/wallpapers"
else
    echo "Selected theme path does not exist. Exiting..."
    exit 1
fi

#--Setting random wallpaper--#

$HOME/.config/hyprDots/generalScripts/wallpaperChanger.sh


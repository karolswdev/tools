#!/bin/bash

# Create a directory for the fonts
FONT_DIR="$HOME/.local/share/fonts/NerdFonts"
mkdir -p "$FONT_DIR"

# Download URL
BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download"

# Get the latest version dynamically
LATEST_VERSION=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

# List of Nerd Fonts to download
fonts=("Agave" "AnonymousPro" "Arimo" "AurulentSansMono" "BigBlueTerminal" "BitstreamVeraSansMono" "CascadiaCode" "Cousine" "DroidSansMono" "FantasqueSansMono" "FiraCode" "FiraMono" "Go-Mono" "Hack" "Hasklug" "HeavyData" "Hermit" "iA-Writer" "IBMPlexMono" "Inconsolata" "InconsolataGo" "InconsolataLGC" "Iosevka" "JetBrainsMono" "Lekton" "LiberationMono" "Lilex" "Meslo" "Monofur" "Monoid" "Mononoki" "MPlus" "Noto" "OpenDyslexic" "Overpass" "ProFont" "ProggyClean" "RobotoMono" "ShareTechMono" "SourceCodePro" "SpaceMono" "Terminus" "Tinos" "Ubuntu" "UbuntuMono" "VictorMono")

# Download and extract each font
for font in "${fonts[@]}"; do
    echo "Downloading $font..."
    wget -q --show-progress "${BASE_URL}/${LATEST_VERSION}/${font}.zip" -O "${FONT_DIR}/${font}.zip"
    echo "Extracting $font..."
    unzip -o -q "${FONT_DIR}/${font}.zip" -d "$FONT_DIR"  # -o option to overwrite files without prompting
    rm "${FONT_DIR}/${font}.zip"
done

# Refresh the font cache
echo "Refreshing font cache..."
fc-cache -fv

echo "All Nerd Fonts have been installed successfully!"


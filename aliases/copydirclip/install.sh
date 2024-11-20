#!/bin/bash

# Installation script
echo "Installing copydirclip alias..."

# Add the alias to shell configuration
shell_config="${HOME}/.$(basename $SHELL)rc"
if ! grep -q "alias copydirclip" "$shell_config"; then
    echo "alias copydirclip='$(pwd)/copydirclip.sh'" >> "$shell_config"
    echo "✅ Alias installed in $shell_config"
else
    echo "⚠️  Alias already exists in $shell_config"
fi

# Reload shell config
source "$shell_config"
echo "🚀 Installation complete. Use 'copydirclip' to copy directory contents!"


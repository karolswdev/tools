
#!/bin/bash

# Resolve the script's location
script_dir=$(dirname "$(realpath "$0")")

echo "Installing copydirclip alias..."

# Add the alias to shell configuration
shell_config="${HOME}/.$(basename $SHELL)rc"
if ! grep -q "alias copydirclip" "$shell_config"; then
    echo "alias copydirclip='$script_dir/copydirclip.sh'" >> "$shell_config"
    echo "✅ Alias installed in $shell_config"
else
    echo "⚠️  Alias already exists in $shell_config"
fi

# Reload the shell configuration based on the detected shell
if [ "$SHELL" = "/bin/zsh" ]; then
    zsh -c "source $shell_config"
elif [ "$SHELL" = "/bin/bash" ]; then
    bash -c "source $shell_config"
fi

echo "🚀 Installation complete. Use 'copydirclip' to copy directory contents!"


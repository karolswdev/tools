#!/bin/bash

# Function to copy directory content to clipboard
copy_to_clipboard() {
    local recursive=false
    local glob="*"

    while getopts "rg:" opt; do
        case $opt in
            r) recursive=true ;;
            g) glob="$OPTARG" ;;
            *) echo "Usage: copydirclip [-r] [-g <glob_pattern>]" && return 1 ;;
        esac
    done

    # Create buffer for output
    buffer=""

    if $recursive; then
        # Include tree output if recursive
        buffer+="🌲 Directory Tree:\n"
        buffer+="$(tree -l)\n\n"
    fi

    # Loop through matching files and add to buffer
    for file in $(find . -maxdepth $($recursive && echo 999 || echo 1) -name "$glob" -type f); do
        local path="$file"
        local relative_path=$(basename "$file")
        buffer+="📄 This is ${relative_path}[$($recursive && echo "$path" || echo "top-level")]:\n"
        buffer+="$(cat "$file")\n\n"
    done

    # Copy to clipboard
    echo -e "$buffer" | xclip -selection clipboard
    echo "✅ Directory contents copied to clipboard!"
}

copy_to_clipboard "$@"

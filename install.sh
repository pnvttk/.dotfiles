#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        resp="y" # empty is Yes
    fi
    # Convert response to lowercase
    response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
    if [[ "$response_lc" == "y" || "$response_lc" == "yes" ]]; then
        return 0  # Yes
    elif [[ "$response_lc" == "n" || "$response_lc" == "no" ]]; then
        return 1  # No
    else
        echo "Invalid response. Defaulting to 'Yes'."
        return 0  # Default to Yes
    fi
}

# Create symlink function
function create_symlink() {
    source_file="$1"
    target_file="$2"
    if [ -e "$target_file" ]; then
        echo "$target_file already exists. Overwrite? (Y/n)"
        if ! ask; then
            echo "Skipping $source_file."
            return
        fi
    fi
    echo "Creating symlink $source_file -> $target_file"
    ln -sfn "$source_file" "$target_file" # -f to force overwrite, -n to not dereference existing symlinks
}

# Directory for configs
CONFIG_DIR="$HOME/.config"
# Create necessary directories if they do not exist
mkdir -p "$CONFIG_DIR/alacritty"
mkdir -p "$CONFIG_DIR/mpv"

# Bash conf
if ask "Do you want to install bash config?"; then
    for file in .bashrc .bash_prompt .bash_profile .aliases .inputrc .path .exports .functions .extra; do
        if [ -f "$file" ]; then
            create_symlink "$PWD/$file" "$HOME/$(basename "$file")"
        fi
    done
fi

# Alacritty conf
if ask "Do you want to install alacritty.toml?"; then
    create_symlink "$PWD/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
fi

# Tmux conf
if ask "Do you want to install .tmux.conf?"; then
    create_symlink "$PWD/.tmux.conf" "$HOME/.tmux.conf"
fi

# Vim conf
if ask "Do you want to install .vimrc?"; then
    create_symlink "$PWD/.vimrc" "$HOME/.vimrc"
fi

# Mpv conf
if ask "Do you want to install mpv.conf?"; then
    create_symlink "$PWD/mpv.conf" "$CONFIG_DIR/mpv/mpv.conf"
fi

# Set bash as the default shell
if ask "Do you want to change your default shell to Bash?"; then
    # Check if the shell is already set
    current_shell=$(basename "$SHELL")
    if [ "$current_shell" != "bash" ]; then
        echo "Changing default shell to Bash..."
        chsh -s /bin/bash
    else
        echo "Bash is already set as the default shell."
    fi
fi
#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        # case insensitive
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
    fi

    [ "$response_lc" = "y" ]
}

# Check what shell is being used
SH="${HOME}/.bashrc"
# ZSHRC="${HOME}/.zshrc"
# if [ -f "$ZSHRC" ]; then
# 	SH="$ZSHRC"
# fi
# echo >> $SH

# # Ask which files should be sourced
# echo "Do you want $SH to source: "
# for file in shell/*; do
#     if [ -f "$file" ]; then
#         filename=$(basename "$file")
#         if ask "${filename}?"; then
#             echo "source $(realpath "$file")" >> "$SH"
#         fi
#     fi
# done

# Bash conf
if ask "Do you want to install bash config?"; then
    for file in .{bashrc,bash_prompt,bash_profile,aliases,inputrc,path,exports,functions,extra}; do
        if [ -r "$file" ] && [ -f "$file" ]; then
            echo "Creating symlink $PWD/$file ~/$(basename $file)"
            ln -s "$PWD/$file" ~/$(basename "$file")
        fi
    done
    unset file;
fi

# Alacritty conf
if ask "Do you want to install alacritty.toml?"; then
    echo "Creating symlink $PWD/alacritty.toml ~/.config/alacritty/alacritty.toml"
    ln -s "$PWD/alacritty.toml" ~/.config/alacritty/$(basename "alacritty.toml")
fi

# Tmux conf
if ask "Do you want to install .tmux.conf?"; then
    echo "Creating symlink $PWD/.tmux.conf ~/.tmux.conf"
    ln -s "$PWD/.tmux.conf" ~/$(basename ".tmux.conf")
fi

# Vim conf
if ask "Do you want to install .vimrc?"; then
    echo "Creating symlink $PWD/.vimrc ~/.vimrc"
    ln -s "$PWD/.vimrc" ~/$(basename ".vimrc")
fi

# Set bash as default shell
if ask "Do you want to change Bash as default shell?"; then
    chsh -s /bin/bash
fi
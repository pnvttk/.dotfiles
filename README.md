# .dotfiles

## Prerequire
- [git](https://git-scm.com/) - version control
- [alacritty](https://github.com/alacritty/alacritty) - cross-platform terminal emulator
- [vim/nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim) - text editor
- [tmux](https://github.com/tmux/tmux/wiki) - multiplexer
- chruby
- nvm
- vscodium

## Setup Instructions

1. Clone the Repository

```bash
git clone https://github.com/pnvttk/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run `clear_symlink.sh` (optional)
```
bash clear_symlink.sh
```

3. Run `install.sh`

```
bash install.sh
```
## Configuration Details

## `.bashrc`
- Purpose: Contains shell configuration and environment variables.
- Key Points:
  - Adds ~/bin to the $PATH.
  - Sources other configuration files.
  - Sets the shell to use vi mode.
  - Configures tools such as chruby, nvm, Homebrew, and Bun.

## `.bash_profile`
- Purpose: Configures environment variables and sources .bashrc.
- Key Points:
  - Mutes macOS notification about Zsh interactive shell.
  - Sources .bashrc if it exists.

## `.bash_prompt`
- Clean and compact displays the current directory and Git branch with a dirty status indicator.

## `.aliases`
- For defines custom command aliases.

## `.export`
- For Sets locale-related environment variables.

## `.inputrc`
- Configures readline behavior for interactive shell sessions.
- Enables mode display in the prompt.
- Configures case-insensitive completion.

## `.path`
- Configures the system PATH and environment for various tools.

## Customization
Feel free to modify these dotfiles to suit your needs. For instance, you can:
- Add or change aliases in .aliases.
- Adjust the prompt format in .bash_prompt.
- Add or remove environment variables in .export and .path.

# Other tools
- htop
- nmap
- yt-dlp
- ffmpeg
- android-platform-tools

<!--
## vim plugin
- [vim-plug](https://github.com/junegunn/vim-plug) - vim plugin management
- [comment-gc](https://github.com/tpope/vim-commentary) - comment plugin -->

  <!-- ## tmux plugin
  - [tpm](https://github.com/tmux-plugins/tpm/blob/master/README.md) - tmux package-manager -->
<!-- - [catppuccin](https://github.com/catppuccin/tmux/blob/main/README.md) - theme
- [tmux-vim](https://github.com/christoomey/vim-tmux-navigator) - tmux vim keymap navigation
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - tmux yank to clipboard -->


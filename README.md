## .dotfiles

[Example tutorial](https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds/blob/master/README.md)

or sumary

### Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:pnvttk/.dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/pnvttk/.dotfiles.git ~/.dotfiles
```

3. Create symlinks in the Home directory to the real files in the repo.

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.config
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.dotfiles/kitty-theme.conf ~/.config/kitty/current-theme.conf
```

4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```

## Pre-require

to set brewfile for tracking use this code

```
brew bundle dump --describe
```

- [git](https://git-scm.com/) - version control
<!-- - [iterm2](https://iterm2.com/) - macos terminal emulator -->
- [kitty](https://github.com/kovidgoyal/kitty) - cross-platform terminal emulator
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) - shell
- [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim) - text editor
- [tmux](https://github.com/tmux/tmux/wiki) - multiplexer

## zsh setup

- [pure](https://github.com/sindresorhus/pure/blob/main/readme.md) - minial theme (manual install)
- [oh-my-zsh](https://ohmyz.sh/#install) - startup config framework

## tmux setup

- [tpm](https://github.com/tmux-plugins/tpm/blob/master/README.md) - tmux package-manager
- [catppuccin](https://github.com/catppuccin/tmux/blob/main/README.md) - theme
- [tmux-vim](https://github.com/christoomey/vim-tmux-navigator) - tmux vim keymap navigation
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - tmux yank to clipboard

## neovim setup

- [vim-plug](https://github.com/junegunn/vim-plug) - vim plugin management
- [catppuccin](https://github.com/catppuccin/nvim) - neovim theme
<!-- - [NvChad](https://nvchad.com/docs/quickstart/install) - framework config -->
- [comment-gc](https://github.com/tpope/vim-commentary) - comment plugin

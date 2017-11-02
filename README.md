# Vimrc

## Prerequisites
- Git
- Neovim
- ctags
- ag
- ack

### Mac:

- [Homebrew][homebrew] - `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
- [NeoVim][macvim] - `brew install nvim`
- [ctags][ctags] - `brew install ctags-exuberant`

## Installation

### Setup vim
```
# install plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Assuming you haven't already done this.
# Otherwise you may need to clear the symlink
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

### Install plugins
```
ESC :PlugInstall
```

NOTE: the below stuff is incomplete for now, will fix soon.

# Vim

Overview of my vim setup. Currently this is setup for neovim but I'm sure with
a few tweaks it can support vanilla vim (just haven't gotten around to doing
this).

## Mappings

Reference to vim mappings.

### General

- ` ,           ` keyleader.
- ` ;   ` Comment/Uncoment Code.
- ` <Leader>tw  ` Set text wrapping toggles.
- ` <Leader>ts  ` Turn on spell check mode.
- ` <Enter>     ` Turn off search highlighting.
- ` <spacebar>  ` spacebar create/open/close folding.
- ` <TAB>       ` Indent a line
- ` +/-         ` Easy increment/decrement.

### Plugins

- ` <Leader>b  ` easybuffer
- ` <Leader>nt ` NERDTree
- ` <Leader>tb  ` Tagbar
- ` <C-l>`  Open up fzf search list relative vim working directory.
- ` <C-p>`  Open up fzf search list relative git project.
- ` <C-k>`  Open up fzf search list for tags.
- ` <C-Space>  ` Display completion preview window
- ` <Tab>      ` Ultisnips: Expand snippers
- ` <C-Tab>    ` Ultisnips: Display list of snippers

## Commands

- `:w!` Sudo write!

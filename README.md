# Installation

## Prerequisites
- Git
- Neovim
- ctags
- ag
- ack

### Mac:

- [Homebrew][homebrew] - `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
- [MacVim][macvim] - `brew install macvim`
- [ctags][ctags] - `brew install ctags-exuberant`

# Vim

Overview of my vim setup. Sensible defaults!

## Mappings

Reference to vim mappings.

### General

- ` ,           ` keyleader.
- ` <Leader>cl  ` Calculate the value in one line.
- ` <Leader>cd  ` Switch to the directory of the open buffer.
- ` <Leader>cfg ` Fast editing of .vimrc.
- ` <Leader>L   ` Enable/Disable list.
- ` <Leader>/   ` Comment/Uncoment Code.
- ` <Leader>d   ` Enable/Disable dual mode view.
- ` <Leader>al  ` Quick aligning to left.
- ` <Leader>ar  ` Quick aligning to right.
- ` <Leader>ac  ` Quick aligning to center.
- ` <Leader>ff  ` Toggle indention mode.
- ` <Leader>ss  ` Toggle Spell checking
- ` <Leader>sn  ` Spell checking (Next word)
- ` <Leader>sp  ` Spell checking (Previews word)
- ` <Leader>s?  ` Spell checking (Show list)
- ` <Leader>tw  ` Set text wrapping toggles.
- ` <Enter>     ` Turn off search highlighting.
- ` <spacebar>  ` spacebar create/open/close folding.
- ` <C-TAB>     ` Move to next buffer
- ` <S-C-TAB>   ` Move to previews buffer
- ` <TAB>       ` Indent a line
- ` <S-TAB>     ` Back-Indent a line
- ` <S-TAB>     ` Back-Indent a line
- ` +/-         ` Easy increment/decrement.

### Plugins

- ` <Leader>B  ` buffergator
- ` <Leader>ca ` calendar
- ` <Leader>m  ` CtrlPMRU
- ` <Leader>b  ` CtrlPBuffer
- ` <Leader>u  ` Gundo
- ` <Leader>nt ` NERDTree
- ` <Leader>T  ` Tagbar
- ` <C-e>      ` Emmet
- ` <C-Space>  ` YouCompleteMe: Display preview window
- ` <Tab>      ` Ultisnips: Expand snippers
- ` <C-Tab>    ` Ultisnips: Display list of snippers

## Commands

- `:w!` Sudo write!

## Plug-Ins
hotoo/calendar-vim
Lokaltog/vim-easymotion
Stormherz/tablify
bling/vim-airline
chrisbra/NrrwRgn
kris89/vim-multiple-cursors
mbbill/undotree
mhinz/vim-startify
tpope/vim-commentary
tpope/vim-fugitive
tpope/vim-repeat
tpope/vim-surround
tpope/vim-vinegar
troydm/easybuffer.vim
yonchu/accelerated-smooth-scroll
ervandew/supertab
mileszs/ack.vim
xolox/vim-misc
xolox/vim-easytags
Valloric/YouCompleteMe
SirVer/ultisnips
honza/vim-snippets
AzizLight/TaskList.vim
Chiel92/vim-autoformat
Raimondi/delimitMate
scrooloose/nerdtree
Yggdroot/indentLine
gcmt/wildfire.vim
godlygeek/tabular
jbnicolai/rainbow_parentheses.vim
scrooloose/nerdcommenter
rizzatti/dash.vim
mhinz/vim-signify
plasticboy/vim-markdown
sheerun/vim-polyglot
othree/html5.vim
pangloss/vim-javascript
othree/javascript-libraries-syntax.vim
ap/vim-css-color
davidhalter/jedi-vim
tpope/vim-rails
vim-ruby/vim-ruby
morhetz/gruvbox
altercation/vim-colors-solarized
sjl/badwolf
chriskempson/base16-vim
vim-airline/vim-airline-themes
mhinz/vim-grepper
junegunn/fzf
neomake/neomake
junegunn/fzf.vim
andrew749/vim-bufpaste

majutsushi/tagbar

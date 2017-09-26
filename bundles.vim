call plug#begin('~/.vim/plugged')
" PLUGINS BUNDLE

" GENERAL
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Stormherz/tablify'
Plug 'bling/vim-airline'
Plug 'kris89/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'troydm/easybuffer.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'ervandew/supertab'
"replace tools
if executable('ack')
  Plug 'mileszs/ack.vim'
endif
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" DEVELOPER
Plug 'SirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-signify'

" LANGUAGES
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" COLORSCHEME
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

if (has('nvim'))
    Plug 'mhinz/vim-grepper'
    Plug 'junegunn/fzf'
    Plug 'neomake/neomake'
    Plug 'junegunn/fzf.vim'
endif

Plug 'andrew749/vim-bufpaste'
Plug 'majutsushi/tagbar'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" automatically load filetype plugins
filetype plugin indent on

call plug#end()

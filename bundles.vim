call plug#begin('~/.vim/plugged')
" PLUGINS BUNDLE

" GENERAL
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Stormherz/tablify'
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
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'
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
Plug 'fatih/vim-go'

" COLORSCHEME
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'

" Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

if (has('nvim'))
    Plug 'neomake/neomake'
endif

Plug 'andrew749/vim-bufpaste'
Plug 'majutsushi/tagbar'

" automatically load filetype plugins
filetype plugin indent on

call plug#end()

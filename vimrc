" GLOBAL {{{
  " Select OS {{{
    if has("win32") || has("win32unix")
      let g:OS#name = "win"
      let g:OS#win = 1
      let g:OS#mac = 0
      let g:OS#unix = 0
    elseif has("mac")
      let g:OS#name = "mac"
      let g:OS#mac = 1
      let g:OS#win = 0
      let g:OS#unix = 0
    elseif has("unix")
      let g:OS#name = "unix"
      let g:OS#unix = 1
      let g:OS#win = 0
      let g:OS#mac = 0
    endif
    if has("gui_running")
      let g:OS#gui = 1
    else
      let g:OS#gui = 0
    endif
  "}}}
  " General {{{
    set nocompatible                   " explicitly get out of vi-compatible mode
    set title                          " change the terminal's title
    set history=300                    " keep 100 lines of command line history
    if g:OS#unix
      set clipboard=unnamedplus        " on Linux use + register for copy-paste
    else
      set clipboard=unnamed            " one mac and windows, use * register for copy-paste
    endif
    set backspace=2                    " make backspace work normal
    set nostartofline                  " don't jump to first character when paging
    set report=0                       " tell us when anything is changed via :...0
    set hid                            " you can change buffers without saving
    set autowrite                      " Auto save before commands like next and make
    set autoread                       " Set to auto read when a file is changed from the outside
    set fileformats=unix,mac,dos       " support all three, in this order
    set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)
    set diffopt=filler                 " Add vertical spaces to keep right and left aligned
    set diffopt+=iwhite                " Ignore whitespace changes (focus on code changes)
    set esckeys                        " Allow cursor keys in insert mode.
    set ttyfast                        " smoother changes
    set gdefault                       " regex /g by default
    set switchbuf=useopen              " reveal already opened files from the quickfix window instead of opening new buffers
    set viminfo='20,\"80               " read/write a .viminfo file, don't store more
    " vertical/horizontal scroll off settings "{{{
      set scrolloff=3
      set sidescrolloff=7
      set sidescroll=1
    "}}}
    " When vimrc is edited, reload it "{{{
      autocmd! bufwritepost .vimrc source %
    "}}}
    " Suffixes that get lower priority when doing tab completion for filenames "{{{
    " These are files we are not likely to want to edit or read.
      set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe
    "}}}
    " No bell or flash wanted "{{{
      set novisualbell " No blinking
      set noerrorbells " No noise.
      set vb t_vb=     " disable any beeps or flashes on error
    "}}}
    " Enable mouse "{{{
      if has("mouse")
        set mouse=a
        set mousemodel=popup
        set mousehide
      endif
    "}}}
    " Multiplatform compatibility "{{{
      if g:OS#win
        " Make windows use ~/.vim too, I don't want to use _vimfiles
        set runtimepath^=~/.vim
      endif
    " }}}
  "}}}
  " Plugins Manager {{{
    " To disable a plugin, add it's bundle name to the following list
    filetype off                 " deactivate filetype auto detection before loading bundles to force a reload
    call pathogen#runtime_append_all_bundles()
    filetype plugin indent on    " automatically load filetypeplugins
  "}}}
  " Editor Settings {{{
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set lazyredraw           " do not redraw while running macros (much faster) (Lazy Redraw)
    set equalalways          " Close a split window in Vim without resizing other windows
    set guitablabel=%t
    set number               " turn on line numbers
    set linespace=0          " space it out a little more (easier to read)
    set cmdheight=1          " the command bar is 1 high
    set laststatus=2         " always show statusline
    set guicursor=a:blinkon0 " cursor-blinking off!!
    set showmode             " If in Insert, Replace or Visual mode put a message on the last line.
    set encoding=utf-8
    set fileencodings=utf-8
    set completeopt=menu,preview,longest
    " wildmode {{{
      set wildmenu           " nice tab-completion on the command line
      set wildchar=9         " tab as completion character
      set wildmode=longest:full,list:full
      set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.app,*/.git/*,*/.hg/*,*/.svn/*
    "}}}
    " chars to show for list {{{
      set listchars=tab:→\ ,eol:·
      set listchars+=extends:»,precedes:«
    "}}}
  "}}}
  " Appearance Settings {{{
    " switch syntax highlighting on, when the terminal has colors {{{
      if &t_Co > 2 || g:OS#gui
        syntax on
      endif
    "}}}
    " default colorscheme {{{
      if &t_Co >= 256 || g:OS#gui
        set t_Co=256
        set background=dark
        "colorscheme molokai
        colorscheme badwolf
        "colorscheme hickop
        "let g:lucius_style = "dark_dim"
        "colorscheme lucius
        "colorscheme solarized
      else
        set t_Co=8
        set t_Sf=^[[3%p1%dm
        set t_Sb=^[[4%p1%dm
        colorscheme robokai
      endif
    "}}}
    " GUI options {{{
      if g:OS#gui
        " guioptions "{{{
        " m = Menubar
        " T = Toolbar
        " t = tearoff menus
        " a = autoselect
        " A = -"- only for modeless
        " c = use console dialogs
        " f = foreground
        " g = Grey Menu Items
        " i = Icon
        " v = buttons are vertical
        " e = tabs in gui
        " This has to be set early
        " r = show right scroll bar
        " L = show left scrollbar on split
        " i = icon
        set guioptions=ac
        "}}}
        " Linux "{{{
        if g:OS#unix
          set guioptions-=m
          nmap <F8> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
          set gfn=DejaVu\ Sans\ Mono\ 9
        endif
        "}}}
        " Mac "{{{
        if g:OS#mac
          set guifont=Menlo:h11
        endif
        "}}}
        set lines=999 columns=999
      else
        set lines=50 columns=88
      endif
    "}}}
  "}}}
  " Language Settings {{{
    highlight SpellBad term=underline gui=undercurl guisp=Orange
    " the following line makes vim ignore camelCase and CamelCase words
    " so they are not highlighted as spelling mistakes
    au Syntax * syn match CamelCase "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained
  "}}}
  " Files, backups and undo {{{
  " Turn backup off, since most stuff are in git anyway...
    set nobackup
    set nowb
    set noswapfile
    " enable persistent undo {{{
      if has('persistent_undo')
        set undodir=$HOME/.vim/.undofile
        set undofile
        set undolevels=100   "maximum number of changes that can be undone
        set undoreload=10000 "maximum number lines to save for undo on a buffer reload
        if ! isdirectory(&undodir)
          call mkdir(&undodir, 'p')
        endif
      endif
    "}}}
  "}}}
  " Text, tab and indent related {{{
    set shiftwidth=2 " number of spaces for autoindentation
    set tabstop=2
    set smarttab     " insert spaces only at the beginning of the line
    set smartindent  " always set smartindenting on
    set autoindent   " always set autoindenting on
    set expandtab    " use space when <tab> is pressed
    " Highlight problematic whitespace (spaces before tabs) {{{
      hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold
      match RedundantSpaces / \+\ze\t/
    " }}}
  "}}}
  " Wrap {{{
    set nowrap                   " word wrap
    set wrapscan                 " Searches wrap around end of file
    set display=lastline         " don't display @ with long paragraphs
    set lbr                      " line break
    let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    set textwidth=79
    set formatoptions=tcqor	     " t=text, c=comments, q=format with gq command, o,r=autoinsert comment leader
  "}}}
  " Search config {{{
    set ignorecase      " select case-insenitiv search
    set smartcase       " No ignorecase if Uppercase chars in search
    set magic           " change the way backslashes are used in search patterns
    set showmatch       " jump to matches during entering the pattern
    set matchtime=2     " How many tenths of a second to blink
    set matchpairs+=<:> " these tokens belong together
    set hlsearch        " highlight all matches...
    set incsearch       " ...and also during entering the pattern
    nohlsearch          " avoid highlighting when reloading vimrc
  "}}}
  " Folding {{{
    set foldenable            " enable folding
    set foldcolumn=2          " add a fold column
    set foldmethod=marker     " detect triple-{ style fold markers
    set foldlevelstart=0      " start out with everything folded
    set foldtext=MyFoldText() " Which command trigger auto-unfold
    set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
  "}}}
"}}}
" KEYMAPPINGS {{{
  " Set mapleader
  let mapleader=","
  let g:mapleader=","
  " F2 = Paste Toggle
  set pastetoggle=<F2>
  " calculate the value in one line
  map <silent><Leader>cl :call CalcLine(".")<CR>
  " spacebar create/open/close folding
  nmap <silent> <Space> za
  vmap <silent> <Space> zf
  " Fast editing of .vimrc
  map <leader>cfg :e! ~/.vimrc <cr>
  " enable/disable list
  nmap <silent> <leader>L :set nolist!<CR>
  " ,/ turn off search highlighting
  nmap <leader>/ :nohl<CR>
  " Map escape key to jj or <Leader>e
  imap jj <esc>
  imap <Leader>e <esc>
  " Sudo to write
  cmap w!! :w !sudo tee % >/dev/null
  " Quick alignment of text
  nmap <leader>al :left<CR>
  nmap <leader>ar :right<CR>
  nmap <leader>ac :center<CR>
  " Spell commands
  map <leader>sn ]s
  map <leader>sp [s
  map <leader>sa zg
  map <leader>s? z=
  " Use tab to indent a line
  vmap <TAB> >gv
  vmap <S-TAB> <gv
  vmap < <gv
  vmap > >gv
  " move between buffers
  nmap <C-S-TAB> :bprev<CR>
  nmap <C-TAB> :bnext<CR>
  " Moving Between Windows
  nmap <Leader>h <C-w>h
  nmap <Leader>l <C-w>l
  nmap <Leader>j <C-w>j
  nmap <Leader>k <C-w>k
  " switch to the directory of the open buffer
  map <leader>cd :cd %:p:h<cr>
  " copy/cut/paste
  vmap <Leader>d "+x
  vmap <Leader>y "+y
  imap <Leader>p <C-R>*
  cmap <Leader>p <C-R>+
  " set text wrapping toggles
  nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>
  " Creating underline/overline headings for markup languages
  " Inspired by http://sphinx.pocoo.org/rest.html#sections
  nmap <leader>1 yyPVr=jyypVr=
  nmap <leader>2 yyPVr-jyypVr-
  nmap <leader>3 yypVr=
  nmap <leader>4 yypVr-
"}}}
" PLUGINS BUNDLE {{{
  " Automatically install vundle if not installed
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
  " Bundle Groups
  " List only the plugin groups you will use
  if !exists('g:bundle_groups')
    let g:bundle_groups=['general', 'programming', 'php', 'javascript', 'html', 'markdown', 'colorscheme']
  endif
  " Bundles here:
  " General {{{
    if count(g:bundle_groups, 'general')
      Bundle 'buftabs'
      "Bundle 'gregsexton/VimCalc'
      "Bundle 'hotoo/calendar-vim'
      Bundle 'jeetsukumaran/vim-buffergator'
      Bundle 'kien/ctrlp.vim'
      Bundle 'Lokaltog/vim-easymotion'
      Bundle 'Lokaltog/vim-powerline'
      Bundle 'scrooloose/nerdtree'
      Bundle 'jistr/vim-nerdtree-tabs'
      "Bundle 'sjl/gundo.vim'
      "Bundle 'YankRing.vim'
      Bundle 'godlygeek/csapprox'
      Bundle 'matchit.zip'
      if executable('ack')
        Bundle 'mileszs/ack.vim'
      endif
    endif
  "}}}
  " Programming {{{
    if count(g:bundle_groups, 'programming')
      " Snipmate "{{{
      "Bundle 'garbas/vim-snipmate'
      "Bundle 'tomtom/tlib_vim'
      "Bundle 'MarcWeber/vim-addon-mw-utils'
      Bundle 'honza/snipmate-snippets'
      "}}}
      Bundle 'godlygeek/tabular'
      Bundle 'jiangmiao/auto-pairs'
      Bundle 'scrooloose/nerdcommenter'
      Bundle 'scrooloose/syntastic'
      Bundle 'Shougo/neocomplcache'
      Bundle 'Shougo/neosnippet'
      Bundle 'tpope/vim-fugitive'
      Bundle 'tpope/vim-surround'
      Bundle 'xolox/vim-easytags'
      if executable('ctags')
        Bundle 'majutsushi/tagbar'
      endif
    endif
  "}}}
  " PHP {{{
    if count(g:bundle_groups, 'php')
      Bundle 'paulyg/Vim-PHP-Stuff'
    endif
  "}}}
  " Javascript {{{
    if count(g:bundle_groups, 'javascript')
      Bundle 'leshill/vim-json'
      Bundle 'groenewege/vim-less'
      Bundle 'taxilian/vim-web-indent'
    endif
  "}}}
  " HTML {{{
    if count(g:bundle_groups, 'html')
      Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
    endif
  "}}}
  " Markdown {{{
    if count(g:bundle_groups, 'markdown')
      Bundle 'mkitt/markdown-preview.vim'
      Bundle 'tpope/vim-markdown'
    endif
  "}}}
  " colorscheme {{{
    if count(g:bundle_groups, 'colorscheme')
      Bundle 'altercation/vim-colors-solarized'
      Bundle 'jelera/vim-gummybears-colorscheme'
      Bundle 'sjl/badwolf'
      Bundle 'tomasr/molokai'
    endif
  "}}}
  if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
  endif
"}}}
" PLUGINS CONFIG {{{
  " buftabs {{{
    let g:buftabs_active_highlight_group="WarningMsg"
    let g:buftabs_inactive_highlight_group="Visual"
    let g:buftabs_only_basename=1
  "}}}
  " buftergator {{{
    let g:buffergator_autoexpand_on_split=0
    let g:buffergator_viewport_split_policy="R"
    let g:buffergator_suppress_keymaps=1
    nmap <leader>b :BuffergatorToggle<CR>
  "}}}
  " calendar {{{
    "map <leader>ca :Calendar<CR>
    "let g:calendar_list = [
    "\   {'name': 'Tasks', 'path': $HOME.'/.vim/.tasks', 'ext': 'task'},
    "\   {'name': 'Diary', 'path': $HOME.'/.vim/.diary', 'ext': 'diary'},
    "\ ]
    "let g:calendar_current_idx = 1
  "}}}
  " ctrlp {{{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_max_height = 15
    "let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_match_window_bottom = 0

    nmap <leader>pb :CtrlPBuffer<CR>
    nmap <leader>pm :CtrlPMRUFiles<CR>

    let g:ctrlp_custom_ignore = {
          \ 'dir':  '\.git$\|\.hg$\|\.svn$',
          \ 'file': '\.exe$\|\.so$\|\.dll$',
          \ 'link': 'some_bad_symbolic_links',
          \ }
  "}}}
  " easymotion {{{
    let g:EasyMotion_leader_key = '<Leader>m'
    hi link EasyMotionTarget ErrorMsg
    hi link EasyMotionShade  Comment
  "}}}
  " easytags {{{
    if g:OS#mac
      let g:easytags_cmd = '/usr/local/bin/ctags'
    end
    let g:easytags_file = $HOME.'/.vim/.tags'
    set tags=./.tags;
    let g:easytags_dynamic_files = 1
  "}}}
  " fugitive {{{
    nmap <silent> <leader>gs :Gstatus<CR>
    nmap <silent> <leader>gd :Gdiff<CR>
    nmap <silent> <leader>gc :Gcommit<CR>
    nmap <silent> <leader>gb :Gblame<CR>
    nmap <silent> <leader>gl :Glog<CR>
    nmap <silent> <leader>gp :Git push<CR>
  "}}}
  " gundo {{{
    "nmap <leader>u :GundoToggle<CR>
    "let g:gundo_width = 50
    "let g:gundo_right = 1
  "}}}
  " markdown preview {{{
    nmap <silent><leader>p :MDP<CR>
    let g:MarkdownPreviewTMP = $HOME.'/Sites/'
  "}}}
  " NERDTree {{{
    nmap <silent><Leader>nt :NERDTreeMirrorToggle<CR>
    let g:NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeChDirMode = 1
    let g:NERDTreeWinPos = "right"
    let g:NERDTreeWinSize = 45
    let g:NERDTreeChristmasTree = 1
    let g:NERDTreeCaseSensitiveSort = 1
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeIgnore=[
          \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
          \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:nerdtree_tabs_open_on_console_startup=0
  "}}}
  " neocomplcache {{{
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_auto_select = 0
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_auto_completion_start_length = 2
    let g:neocomplcache_force_overwrite_completefunc = 1

    let g:neocomplcache_snippets_dir = $HOME.'/.vim/bundle/snipmate-snippets/snippets/'
    let g:neocomplcache_temporary_dir = $HOME.'/.vim/.neocon'

    " Plugin key-mappings.
    if g:OS#gui
      imap <C-Space> <Plug>(neocomplcache_snippets_expand)
      smap <C-Space> <Plug>(neocomplcache_snippets_expand)
    else
      imap <C-@> <Plug>(neocomplcache_snippets_expand)
      smap <C-@> <Plug>(neocomplcache_snippets_expand)
    endif

    " Recommended key-mappings.
    imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    imap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Enable omni completion.
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    au FileType c set omnifunc=ccomplete#Complete
    au FileType java set omnifunc=javacomplete#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
  "}}}
  " powerline {{{
    if &t_Co >= 256 || g:OS#gui
      let g:Powerline_symbols = 'fancy'
      "let g:Powerline_cache_file = ""
    endif
  "}}}
  " tabularize {{{
    if exists(":Tabularize")
      vmap <Leader>t=  :Tabularize /=<CR>
      vmap <Leader>t3  :Tabularize /#<CR>
      vmap <Leader>t'  :Tabularize /'<CR>
      vmap <Leader>t'' :Tabularize /"<CR>
      vmap <Leader>t0  :Tabularize /)/r1c1l0<CR>
      vmap <Leader>t== :Tabularize /=/r1c1l0<CR>
      vmap <Leader>t:  :Tabularize /:\zs<CR>
    endif
  "}}}
  " tagbar {{{
    if g:OS#mac
      "how to install ctag mac https://weblion.psu.edu/trac/weblion/wiki/MacVim
      let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    end
    let g:tagbar_width = 30
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_expand = 0
    nmap <silent><leader>T :TagbarToggle<CR>
  "}}}
  " syntastic {{{
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2
    let g:syntastic_auto_jump=0
  "}}}
  " yankring {{{
    "nmap <silent><Leader>yr :YRShow<cr>
    "let g:yankring_replace_n_pkey = '<m-p>'
    "let g:yankring_replace_n_nkey = '<m-n>'
    "let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@'
    "let g:yankring_history_file = '/.vim/.yankring_history'
  "}}}
"}}}
" FUNCTIONS {{{
  "function! ToggleSpell() {{{
    function! ToggleSpell()
      if &spell
        if &spelllang == "pt"
          set spelllang=pt,en
          echo "toggle spell" &spelllang
        elseif &spelllang == "pt,en"
          set spelllang=en
          echo "toggle spell" &spelllang
        else
          set spell!
          echo "toggle spell off"
        endif
      else
        set spelllang=pt
        set spell!
        echo "toogle spell" &spelllang
      endif
    endfunction
    " Toggle Spellcheck
    nmap <silent><Leader>ss :call ToggleSpell()<CR>
  "}}}
  "function! ScreenMovement {{{
    function! ScreenMovement(movement)
      if &wrap
        return "g" . a:movement
      else
        return a:movement
      endif
    endfunction
    omap <silent> <expr> j ScreenMovement("j")
    omap <silent> <expr> k ScreenMovement("k")
    omap <silent> <expr> 0 ScreenMovement("0")
    omap <silent> <expr> ^ ScreenMovement("^")
    omap <silent> <expr> $ ScreenMovement("$")
    nmap <silent> <expr> j ScreenMovement("j")
    nmap <silent> <expr> k ScreenMovement("k")
    nmap <silent> <expr> 0 ScreenMovement("0")
    nmap <silent> <expr> ^ ScreenMovement("^")
    nmap <silent> <expr> $ ScreenMovement("$")
  "}}}
  "function! Replace {{{
    " Tip #382: Search for <cword> and replace with input() in all open buffers
    fun! Replace()
      let s:word = input("Replace " . expand('<cword>') . " with:")
      :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
      :unlet! s:word
    endfun
    vmap <C-h> :call Replace()<CR>
  "}}}
  "function! TwiddleCase(str) {{{
  "press ~ to convert the text to UPPER CASE, then to lower case, then to Title Case.
    function! TwiddleCase(str)
      if a:str ==# toupper(a:str)
        let result = tolower(a:str)
      elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
      else
        let result = toupper(a:str)
      endif
      return result
    endfunction
    vmap ~ ygv"=TwiddleCase(@")<CR>Pgv
  "}}}
  "function! FullScreenEditor {{{
    function! FullScreenEditor()
      only
      vsplit
      split
    endfunction
    function! DefaultEditor()
      only
    endfunction
    " Vertically split window and select it
    nmap <Leader>w :call FullScreenEditor()<CR>
    nmap <Leader>W :call DefaultEditor()<CR>
  "}}}
  "function! LastModified() {{{
    function! LastModified()
      if &modified
        let save_cursor = getpos(".")
        let n = min([20, line("$")])
        exe '1,' . n . 's#^\(.\{,10}Last Change:\).*#\1'
              \ strftime("%a %d/%b/%Y hs %H:%M") . '#e'
        call setpos('.', save_cursor)
      endif
    endfun
    autocmd BufWritePre * call LastModified()
  "}}}
  "function! MyFoldText() {{{
    function! MyFoldText()
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
      return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
    endfunction
  "}}}
"}}}
" AUTOCOMMANDS {{{
  if has("autocmd")
    " augroup filetypesettings {{{
      augroup filetypesettings
        autocmd!
        au FileType c,cpp,h,java        setlocal formatoptions=croql cindent nowrap
        au FileType debchangelog        setlocal expandtab spell spelllang=en
        au FileType mail                setlocal formatoptions=ltcrqna
        au FileType txt                 setlocal formatoptions=ltcrqno2
        au FileType asciidoc,mkd,tex    setlocal wrap
        au filetype html,xml            setlocal shiftwidth=2 tabstop=2 filetype=htmlm4
        au FileType ruby                setlocal shiftwidth=2
        au FileType help                setlocal nolist textwidth=0
        au FileType org                 setlocal foldminlines=0 foldlevel=1
        au FileType python              setlocal expandtab shiftwidth=4 softtabstop=4
        au filetype css,sass,scss,less  setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

        " when enabling diff for a buffer it should be disabled when the
        " buffer is not visible anymore
        au BufHidden * if &diff == 1 | diffoff | setlocal nowrap | endif

        " Special handling of Makefiles
        au FileType automake,make setlocal list noexpandtab

        " insert a prompt for every changed file in the commit message
        "au FileType svn :1![ -f "%" ] && awk '/^[MDA]/ { print $2 ":\n - " }' %
      augroup END
    "}}}
    " Mark as error two identical words separated by space {{{
      syntax match DoubleWordErr "\c\<\(\a\+\)\_s\+\1\>"
    "}}}
    " Automatically removing all trailing whitespace {{{
      autocmd BufWritePre * :%s/\s\+$//e
    "}}}
    " Jump to the last position when reopening a file {{{
      augroup JumpCursorOnEdit
        au!
        autocmd BufReadPost *
              \ if expand("<afile>:p:h") !=? $TEMP |
              \ if line("'\"") > 1 && line("'\"") <= line("$") |
              \ let JumpCursorOnEdit_foo = line("'\"") |
              \ let b:doopenfold = 1 |
              \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
              \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
              \ let b:doopenfold = 2 |
              \ endif |
              \ exe JumpCursorOnEdit_foo |
              \ endif |
              \ endif
        " Need to postpone using "zv" until after reading the modelines.
        autocmd BufWinEnter *
              \ if exists("b:doopenfold") |
              \ exe "normal zv" |
              \ if(b:doopenfold > 1) |
              \ exe "+".1 |
              \ endif |
              \ unlet b:doopenfold |
              \ endif
      augroup END
    "}}}
  endif
"}}}

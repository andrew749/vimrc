" PLUGINS CONFIG
"
" airline
let g:airline#extensions#enable#branch=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme='base16'
set guifont=Liberation\ Mono\ for\ Powerline\ 12
if GUI()
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  "unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  if !exists('g:airline_powerline_fonts')
    "let g:airline_left_sep = ''
    "let g:airline_right_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.linenr = ''
  endif
endif

" buffergator
nmap <silent><Leader>b :EasyBufferHorizontal<CR>
let g:easybuffer_horizontal_height = '15'

" easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" better searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" easytags
let g:easytags_file = $HOME.'/.vim/.tags'
let g:easytags_async = 1
let g:easytags_dynamic_files = 1

" fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
nmap <silent> <leader>gr :Gread<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nmap <silent> <leader>gi :Git add -p %<CR>
nmap <silent> <leader>gg :SignifyToggle<CR>

" indent guides
let g:indentLine_char = '│'
let g:indentLine_faster = 1

" NERDCommenter
nmap ; <Plug>NERDCommenterToggle
vmap ; <Plug>NERDCommenterToggle

" NERDTree
let g:netrw_liststyle=3
nmap <silent><Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeChristmasTree = 0
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 2
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeIgnore=[
      \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

" less
nmap <Leader>css :w <BAR> !lessc % > %:t:r.css<CR><space>

" signify
let g:signify_sign_overwrite = 1
let g:signify_sign_add = '+'
let g:signify_sign_change = '!'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '-'

" tabularize
vmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a#  :Tabularize /#<CR>
vmap <Leader>a'  :Tabularize /'<CR>
vmap <Leader>a"  :Tabularize /"<CR>
vmap <Leader>a)  :Tabularize /)/r1c1l0<CR>
vmap <Leader>a== :Tabularize /=/r1c1l0<CR>
vmap <Leader>a:  :Tabularize /:<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a,  :Tabularize /,<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a\| :Tabularize /\|<CR>

"fzf
map <C-p> :GFiles<CR>
map <C-l> :Files<CR>
nnoremap <C-k> :Tags<CR>

" tagbar
nmap <Leader>tb :Tagbar <CR>

" undotree
nmap <silent>U :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsListSnippets="<C-Tab>"
"" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"let g:ycm_use_ultisnips_completer = 1
"let g:ycm_path_to_python_interpreter = '/usr/local/bin/python2'
"if GUI()
  "let g:ycm_key_invoke_completion = '<C-Space>'
"else
  "let g:ycm_key_invoke_completion = '<C-@>'
"endif
"Deoplete
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-c>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Neomake configuration
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_python_enable_makers = ['flake8']

" Mimic :grep and make ag the default tool.
let g:grepper = {
            \ 'tools'      : ['ag', 'git', 'grep'],
            \ }
map <Leader>/ :Grepper<CR>

" Markdown preview
let g:mkdp_path_to_chrome = "open -a \"Google Chrome\""
let g:mkdp_refresh_slow = 1

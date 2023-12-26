" Plug initialization {{{
autocmd! bufwritepost .vimrc source %

" no vi-compatible
set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-misc'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'
Plug 'zhaocai/GoldenView.Vim'
Plug 'tpope/vim-vinegar'
Plug 'farmergreg/vim-lastplace'
Plug 'sheerun/vim-polyglot'

" Prompts
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'

" Color themes
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'arzg/vim-colors-xcode'
call plug#end()

let g:python3_host_prog = '/home/jalmazan/miniconda3/bin/python'
let g:python_host_prog = '/usr/bin/python2'

filetype plugin on
filetype indent on
" }}}

" Colors {{{
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
    set t_8b=[48;2;%lu;%lu;%lum
    set t_8f=[38;2;%lu;%lu;%lum
endif
syntax on
set background=dark
" set background=light        " for the light version

" let g:one_allow_italics = 1 " I love italic for comments
" colorscheme one

" The configuration options should be placed before `colorscheme edge`.
" let g:edge_style = 'aura'
let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1
colorscheme edge

" let g:onedark_hide_endofbuffer=1
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
" colorscheme onedark

" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai

" Set contrast. This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'hard'
" colorscheme everforest

" colorscheme xcodedark

" }}}

" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set mouse=a
set fileformat=unix
set shortmess+=c
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothing is found anymore

nnoremap <F5> :make<CR>

set history=1000  " remember more commands and search history

set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning

set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
" }}}
" Spaces & Tabs {{{
set expandtab           " use spaces for tabs
set tabstop=4           " 4 space tab
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline          " highlight current line
set wildmode=longest,list,full
set wildmenu
let python_highlight_all=1

set noerrorbells  " remove bells (i think this is default in neovim)
set visualbell

set scrolloff=3 " keep three lines between the cursor and the edge of the screen
" set t_vb=
" set relativenumber
"set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set cpoptions+=x  " stay at seach item when <esc>
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
 
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :OpenSession<CR>
" nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
"nnoremap <leader>d :Make! 
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>

" manipulate system register
noremap <silent> <C-x> "+x
noremap <silent> <C-c> "+y
noremap <silent> <S-Insert> "+gP
imap <silent> <S-Insert> <MiddleMouse>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohd<CR>
" inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" Tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map tc :tabclose<CR>
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" Navigate windows with ctrl+arrows
map <C-Right> <c-w>l
map <C-Left> <c-w>h
map <C-Up> <c-w>k
map <C-Down> <c-w>j
imap <C-Right> <ESC><c-w>l
imap <C-Left> <ESC><c-w>h
imap <C-Up> <ESC><c-w>k
imap <C-Down> <ESC><c-w>j

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

set pastetoggle=<F2>
" }}}
" Tmux {{{
if exists('$TMUX') " allows cursor change in tmux mode
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" MacVim {{{
set guioptions-=r 
set guioptions-=L
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Backups {{{
set backup 
set backupdir=~/.vim/dirs/backups " where to put backup files
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set writebackup
" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! RunTestFile()
    if(&ft=='python')
        exec ":!" . ". venv/bin/activate; nosetests " .bufname('%') . " --stop"
    endif
endfunction

function! RunGoFile()
    if(&ft=='go')
        exec ":new|0read ! go run " . bufname('%')
    endif
endfunction

function! RunTestsInFile()
    if(&ft=='php')
        :execute "!" . "/Users/dblack/pear/bin/phpunit -d memory_limit=512M -c /usr/local/twilio/src/php/tests/config.xml --bootstrap /usr/local/twilio/src/php/tests/bootstrap.php " . bufname('%') . ' \| grep -v Configuration \| egrep -v "^$" '
    elseif(&ft=='go')
        exec ":!gp test"
    elseif(&ft=='python')
        exec ":read !" . ". venv/bin/activate; nosetests " . bufname('%') . " --nocapture"
    endif
endfunction

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
 
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
 
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif
 
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
" }}}
" Python-mode {{{
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_python = 'python3'
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = ["E501", "E402", "W","C901"]
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'
" }}}
" FZF {{{
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>a :Ag<Space>
" }}}
" Vim-Session {{{
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
" }}}
" vim-airline {{{
" set laststatus=2
" set showtabline=2
" set noshowmode
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline_powerline_fonts = 1
" let g:airline_theme='one'
" }}}
" lightine {{{
set laststatus=2
set showtabline=0
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'edge',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" }}}
" Tmuxline {{{
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : '#(whoami)',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'nightly_fox'
" }}}
" NERDcommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_python = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"}}}
" vim:foldmethod=marker:foldlevel=0
" Vimtex {{{
let g:vimtex_latexmk_enabled = 0
" }}}
" GoldenView {{{
let g:goldenview__enable_default_mapping = 0
" }}}

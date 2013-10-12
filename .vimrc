"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Spell checking
"    -> Diff options
"    -> Misc
"    -> Helper functions
"    -> Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" System clipboard, no need of "+
set clipboard=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep 7 lines distance when scrolling
set scrolloff=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.git\*,.hg\*,.svn\*

" Always show current position
set ruler

" Show line number
set number

" A buffer becomes hidden when it is abandoned
set hidden

" Allow for cursor beyond last character
set virtualedit=onemore

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Allowed especified keys to cross line boundaries
set whichwrap+=b,s,h,l,<,>,[,]

" Ignore case when searching
set ignorecase

" No ignore case when pattern has uppercase
set smartcase

" Highlight search results
set hlsearch

" Highlight match while typing search pattern
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set vb t_vb=
set t_vb=

" Highlight problematic whitespaces
set list
set listchars=tab:▸\ ,trail:.,extends:#,nbsp:.

" Remap join to merge comment lines
set formatoptions+=j

" Avoid escape key delay
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Dark background
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowritebackup
set noswapfile

" Persistent undo
set undofile
set undodir=~/.vim/tmp/undodir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand tab with spaces
set expandtab

" Smart tab size
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Tablength exceptions
"autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Linebreak on 78 characters
set textwidth=78
set colorcolumn=80

" Indent options
set autoindent
set smartindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Smart way to move between windows
map <C-l> <c-w>l
map <C-h> <c-w>h
map <C-k> <c-w>k
map <C-j> <c-w>j

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Tab navigation
map tm :tabm
map tt :tabnew<CR>
map X :tabn<CR>
map Z :tabp<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display incomplete commands
set showcmd

" Remap VIM 0 to first non-blank character
map 0 ^

" Remap H and L as the beginning and end of line, respectively.
map H ^
map L g_

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Fast saving
nmap <leader>w :update<cr>

" Fast quiting
nmap <leader>q :quit<cr>

" Fast sorting
vnoremap <leader>s :sort<cr>

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" I don't have insert key. It's usefull for switching between replace and
" insert mode.
inoremap <C-z> <Insert>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell check in spanish by default
set spelllang=es

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Diff options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore changes in the amount of white spaces
set diffopt+=iwhite


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
set pastetoggle=<F12>

" For when you forget to sudo.. Really Write the file.
ca w!! w !sudo tee "%" > /dev/null

" Disable highlight when <leader>/ is pressed
map <silent> <leader>/ :noh<CR>

" Remove trailing spaces on save
autocmd BufWritePre * mark z | %s/\s\+$//e | 'z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" Required for Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" Required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Code checker
Bundle 'scrooloose/syntastic'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Zen coding
Bundle 'mattn/emmet-vim'
" Fugitive - Git integration
Bundle 'tpope/vim-fugitive'
" Gitk clone, compatible with fugitive
Bundle 'gregsexton/gitv'
" Airline
Bundle 'bling/vim-airline'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Raimondi/delimitMate'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Python autocompletition and documentation
Bundle 'davidhalter/jedi-vim'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Autocompletion
Bundle 'Shougo/neocomplcache.vim'
" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'
" Seamless navigation between tmux panes and vim splits
Bundle 'christoomey/vim-tmux-navigator'

" Bundles from vim-scripts repos

" UltiSnips Code Completition
Bundle 'UltiSnips'
" XML/HTML tags navigation
Bundle 'matchit.zip'

" Colorschemes
" Hybrid theme, based on tomorrow, jellybeans and solarized
Bundle 'w0ng/vim-hybrid'
Bundle 'nanotech/jellybeans.vim'
" Harlequin theme, based on badwolf and molokai
Bundle 'nielsmadan/harlequin'
Bundle 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'jnurmine/Zenburn'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


""""""""""""""""""""""""""""""
" => Colorschemes
""""""""""""""""""""""""""""""
" Solarized colorscheme settings
let g:solarized_termcolors = 256
let g:solarized_contrast = 'high'

" Set colorscheme
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    colorscheme hybrid
else
    colorscheme delek
endif


""""""""""""""""""""""""""""""
" => Ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


""""""""""""""""""""""""""""""
" => Fixedtasklist
""""""""""""""""""""""""""""""
" Show pending tasks list
map <F2> :TaskList<CR>


""""""""""""""""""""""""""""""
" => Nerdtree
""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
map <F10> :SyntasticToggleMode<CR>
" Better :sign interface symbols
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_closure_compiler_path = '/usr/share/java/closure-compiler/closure-compiler.jar'
" let g:syntastic_javascript_checkers = ["jslint", "closurecompiler"]
" let g:syntastic_python_checkers=["flake8", "pep257", "py3kwarn"]


""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""
" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" Go up a level to open the parent tree with '..'
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


""""""""""""""""""""""""""""""
" => Gitv
""""""""""""""""""""""""""""""
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>


""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_map = ',e'
nmap ,f :CtrlPLine<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }


""""""""""""""""""""""""""""""
" => Python-mode
""""""""""""""""""""""""""""""
" Disable python folding
let g:pymode_folding = 0
" Disable code checking
let g:pymode_lint = 0
" Disable rope plugin
let g:pymode_rope = 0


""""""""""""""""""""""""""""""
" => Nerdcommenter
""""""""""""""""""""""""""""""
" Agrega espacios entre los delimitadores de los comentarios
let NERDSpaceDelims = 1


""""""""""""""""""""""""""""""
" => Gitgutter
""""""""""""""""""""""""""""""
" Fix some problems with gitgutter and jedi-vim
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0  "


""""""""""""""""""""""""""""""
" => Jedi-vim
""""""""""""""""""""""""""""""
" To avoid interfering with the autocompletition
let g:jedi#popup_on_dot = 0


""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'tomorrow'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 0
" Vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'"


""""""""""""""""""""""""""""""
" => Neocomplcache
""""""""""""""""""""""""""""""
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions['python'] = 'jedi#completions'

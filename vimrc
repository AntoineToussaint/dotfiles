execute pathogen#infect()


set nocompatible               " be iMproved
filetype off                   " required!
"set rtp+=~/tools/powerline/powerline/bindings/vim
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

let g:vundle_default_git_proto='git'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:vundle_default_git_proto='git'
"let g:golang_root = '/usr/local/bin'
let g:ycm_confirm_extra_conf = 0

" Vundle
Plugin 'gmarik/Vundle.vim'

" Git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'

Plugin 'tomasr/molokai'
Plugin 'tpope/vim-repeat'
"
" Fuzzy search
Plugin 'kien/ctrlp.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

Plugin 'plasticboy/vim-markdown'

Plugin 'sjl/gundo.vim'
"
" Code completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

" Syntax checking
" Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'Gundo'
Plugin 'reedes/vim-wordy'
"
" Display powerline
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
" Swap buffers
Plugin 'wesQ3/vim-windowswap'

" Switch to C++ companion files
Plugin 'derekwyatt/vim-fswitch'


Plugin 'nathanaelkane/vim-indent-guides'

"Plugin 'rkulla/pydiction'

call vundle#end()
"
" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=5             " Keep 5 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=2              " <tab> inserts 4 spaces
set shiftwidth=2           " an indent level is 4 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=120            " Lines are automatically wrapped after 120 columns
set linespace=3             " The spacing between lines is a little roomier

"""" Reading/Writing
set autowrite               " Stop complaining about unsaved buffers
set autowriteall            " I'm serious...
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set gdefault                " Replace all instances by default

""" copy/paste
set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim

" Left arrow at beginning of line should go to end of previous line
" and same for right arrow...
set whichwrap+=<,>

:let mapleader=","

" Cycle through open buffers with Control + Spacebar
map <C-space> :bn <CR>
map <C-M-space> :bp <CR>

" I bet 90% of vim users have the following two lines in their .vimrc...
syntax on
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"auto reload vimrc once changed
" Don't create swapfiles
" set noswapfile

" Allow for undo even after closing and re-opening a file
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Make diffs *really* obvious
hi DiffText gui=underline guibg=red guifg=black

" syntastic: show errors from all linters at once
let g:syntastic_aggregate_errors = 1


" Set CtrlP to search by filename rather than path
let g:ctrlp_by_filename = 0

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

""" SHORTCUTS ""

" Save the shift
nnoremap ; :

" Write all files 
imap ww <Esc>:wa<CR> " write all files and command mode

" When creating a new file, create the directories if needed
"command -nargs=1 E execute('set wildmode=longest:full,full! silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

" Fast Esc mode
imap jj <Esc>
imap kk <Esc>

" Python 'self'
iabbrev adn and

let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" No arrows!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Jumps to the next row in the editor (much more natural):

nnoremap j gj
nnoremap k gk

" Easy window navigation

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" clang-format shortcut
map <C-I> :pyf /Users/antoine/.vim/clang-format.py<cr>
imap <C-I> <c-o>:pyf /Users/antoine/.vim/clang-format.py<cr>

" NERDTree Ignore
let NERDTreeIgnore = ['\.pyc$', '__$[[dir]]', '__init__.py']


" Disable highlight of search
nnoremap <space> :noh<CR><CR>

" Run programs
au BufEnter,BufNew *.cpp map <F8> :!clang++ --std=c++14 % && ./a.out <CR>
au BufEnter,BufNew *.py map <F8> :!python3 % <CR>

" to do sudo after
cmap w!! w !sudo tee % >/dev/null

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

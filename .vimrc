set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/EasyGrep'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/paredit.vim'
Plugin 'klen/python-mode'
"Plugin 'luochen1990/rainbow'
Plugin 'junegunn/seoul256.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
"Plugin 'guns/vim-clojure-static'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'gmarik/Vundle.vim'
Plugin 'jimenezrick/vimerl'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on
filetype plugin on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" ignore case for search
set ignorecase

" Show Page Numbers
"set number

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands


" ************************
"  Control-P Configuration
" ************************
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <C-b> :CtrlPBuffer<CR>


" *************
"  Color Scheme 
" *************
"colorscheme desert
"let g:rehash256 = 1
"set background=dark
"colorscheme solarized
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif
let g:seoul256_background = 233
colo seoul256
set guifont=Monaco:h12

" *************
"  Goyo 
" *************
map <F2> :Limelight!!<CR>
nnoremap <Leader><Space> :Goyo<CR> \| :Limelight<CR>


" **************************
" Navigation between Splits  
" **************************
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set shortmess+=A

" nerdcommenter
" Command/ to invert comment on the current line/selection
nmap <D-/> :call NERDComment(0, "invert")<cr>
vmap <D-/> :call NERDComment(0, "invert")<cr>

"Ack mapping 
nmap <D-F> :Ack<space>

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

""""""""""""""""""
" Moving around
""""""""""""""""""
"Hybrid line number # requires vim >= 7.4
set relativenumber 
set number
setglobal relativenumber

" Don't use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"Toggling between relative and absolute line number
"function! NumberToggle()
  "if(&relativenumber == 1)
    "set number
  "else
    "set relativenumber
  "endif
"endfunc

"nnoremap <C-l> :call NumberToggle()<cr>

" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Remove swap files
set noswapfile
set nobackup
set nowritebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 1 to first non-blank character
map ! ^
" Remap VIM 0 to last non-blank character
map ) $

" ;; maps to :w
noremap ;; <Esc>:w<CR>

" Enter to go to the command line with :
"nmap <cr> :

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"TagBar settings
nmap <S-f> :TagbarToggle<CR>
" ************************
"  NERDTree Configuration
" ************************
" Open NerdTree by default if file name not specified with vim
autocmd vimenter * if !argc() | NERDTree | endif

" Shortcut for opening NerdTree
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

"-------------------------------
" Fix constant spelling mistakes
"-------------------------------

iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab bianries   binaries
iab Bianry     Binary
iab bianry     binary
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Exmaple    Example
iab exmaple    example
iab Exmaples   Examples
iab exmaples   examples
iab Seperate   Separate
iab seperate   separate
iab Shoudl     Should
iab shoudl     should
iab Taht       That
iab taht       that
iab Teh        The
iab teh        the

" set visual bell -- i hate that damned beeping
set vb

" Mapping command shift to maximize or minimize the current split
nnoremap <D-S-CR> :MaximizerToggle<CR>
vnoremap <D-S-CR> :MaximizerToggle<CR>gv
inoremap <D-S-CR> <C-o>:MaximizerToggle<CR>

let g:multi_cursor_next_key='<C-s>'
let g:multi_cursor_prev_key='<C-d>'
let g:multi_cursor_skip_key='<C-f>'
let g:multi_cursor_quit_key='<Esc>'

" Clone Paragraph with cp
noremap cp yap<S-}>p

" Align Current Paragraph with Leader + a
noremap <leader>a =ip

" Toggle Paste Mode
set pastetoggle=<leader>z

" Shift + Direction to Change Tabs
noremap <S-l> gt
noremap <S-h> gT

nmap zz yygccp
vmap zz V&lt;Esc>gvygvgc`>p
" Initializing Rainbow Parantheses
"let g:rainbow_active = 1

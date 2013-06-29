"Pathogen config
execute pathogen#infect()
syntax on
filetype plugin indent on
filetype plugin on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

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
map <C-z> :CtrlPBuffer<CR>


" *************
"  Color Scheme 
" *************
"colorscheme desert
"let g:rehash256 = 1
"set background=dark
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
set guifont=Monaco:h12


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
"Relative line number 
set relativenumber
setglobal relativenumber

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 1 to first non-blank character
map ! ^
" Remap VIM 0 to last non-blank character
map ) $


" Enter to go to the command line with :
nmap <cr> :

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

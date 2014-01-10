" If I wanted Vi, I'd be running it
set nocompatible

" How is this not default
set hidden

" Better command-line completion
set wildmenu

" Pathogen FTW
call pathogen#infect()

" Tabs and whatnot
set tabstop=2
set shiftwidth=2
set expandtab

" Indentation
set smartindent
set autoindent
set cindent
filetype plugin indent on

" Show line numbers
set number

" Syntax highlighting
syntax on

" Use case-insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent / line breaks / start of insert action
set backspace=indent,eol,start

" Raise dialogue instead of failing command
set confirm

" Less cowbell
set visualbell

" Show the matching bracket for the last {
set showmatch

" 256 colors
set t_Co=256

" Backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Highlighted search
set hlsearch
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Use %% magic to open files in the same dir as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Remap split screens
noremap WW <C-w>v
noremap WD <C-w>w
noremap WS <C-w>s
noremap WE <C-w>q

" Remap <Esc>
inoremap jj <Esc>

" Hash rocket shortcut
inoremap ii =>

" Tomorrow Night Bright color scheme
colorscheme Tomorrow-Night-Bright

" Trailing whitespace is an error
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Highlight Clojure's builtins
let vimclojure#HighlightBuiltins=1

" Rainbow parens FTW
let vimclojure#ParenRainbow=1

" Syntax highlighting for SCSS
au BufRead,BufNewFile *.scss set filetype=scss

" Syntax highlighting for .ru files
au BufRead,BufNewFile *.ru set filetype=ruby


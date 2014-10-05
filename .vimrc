" Vim > Vi
set nocompatible

" Why isn't this default
set hidden

" Better command-line completion
set wildmenu

" Let Vim use the system clipboard
set clipboard=autoselect

" Pathogen FTW
execute pathogen#infect()

" Tabs, &c
set tabstop=2
set shiftwidth=2
set expandtab

" Trailing whitespace is an error
match ErrorMsg '\s\+$'

" Indentation
set smartindent
set autoindent
set cindent
filetype plugin indent on

" Show & use tabs if there are any
if filereadable(bufname("%"))
  for line in readfile(bufname("%"), '')
    if line =~ '\t'
      au Bufread,BufNewFile * set list
      au Bufread,BufNewFile * set noexpandtab
    endif
  endfor
endif

" Indent if we're at the beginning of a line.
" Otherwise, autocomplete! (Stolen from Gary Bernhardt)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Jump to the last line we were on when
" we last looked at the current file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Show line numbers
set number

" Syntax highlighting
syntax on

" Use case-insensitive search, except when using caps
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

" Treat HTML tags like { and (
set matchpairs+=<:>

" 256 colors
set t_Co=256

" Remap leader
let mapleader = ','

" Highlighted search
set hlsearch
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Remap split screens
noremap WW <C-w>v
noremap WD <C-w>w
noremap WS <C-w>s
noremap WE <C-w>q

" Remap <Esc>
inoremap jj <Esc>

" Open NERDTree with mm
map mm :NERDTreeToggle<CR>

" Use ee for EasyMotion
let g:EasyMotion_leader_key = 'ee'

" Tomorrow Night Bright color scheme
colorscheme Tomorrow-Night-Bright

" Syntax highlighting for SCSS
au BufRead,BufNewFile *.scss set filetype=scss

" Syntax highlighting for Ruby-ish things
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.pryrc set filetype=ruby
au BufRead,BufNewFile *.rake set filetype=ruby

" Highlight Clojure's builtins
let vimclojure#HighlightBuiltins=1

" Rainbow parens FTW
let vimclojure#ParenRainbow=1

" Same syntax for ClojureScript as for Clojure
au BufRead,BufNewFile *.cljs set filetype=clojure

" Syntax highlighting for Markdown files
au Bufread,BufNewFile *.md set filetype=markdown

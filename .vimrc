" Pathogen FTW (for plugin management)
execute pathogen#infect()

" Filetype detection
filetype plugin indent on

" Syntax highlighting
syntax on

" Vim > Vi
set nocompatible

" Hide abandoned buffers rather than unload them
set hidden

" Better command-line completion
set wildmenu

" Let Vim use the system clipboard
set clipboard=autoselect

" Tabs, &c
set tabstop=2
set shiftwidth=2
set expandtab

" Path magicks
set path=$PWD/**

" Indentation
set smartindent
set autoindent
set cindent

" Show line numbers
set number

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

" Trailing whitespace is an error
match ErrorMsg '\s\+$'

" Show & use tabs if there are any (mostly so I can destroy them)
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

" Remap split screens
noremap WW <C-w>v
noremap WD <C-w>w
noremap WS <C-w>s
noremap WE <C-w>q

" Remap <Esc>
inoremap jj <Esc>

" Automatically map `tt` to run
" rspec on the current test file
map tt :!rspec --color "%:t"<CR>

" Open NERDTree with mm
map mm :NERDTreeToggle<CR>

" Fix NERDTree delimiter on macos
let g:NERDTreeNodeDelimiter = "\u00a0"

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
au Bufread,BufNewFile *.cr set filetype=ruby

" Make replacing :foo => 'bar' with foo: 'bar' easier
:map HR :%s/:\([^=,'"]*\) =>/\1:/gc

" Highlight Clojure's builtins
let vimclojure#HighlightBuiltins=1

" Rainbow parens FTW
let vimclojure#ParenRainbow=1

" Same syntax for ClojureScript as for Clojure
au BufRead,BufNewFile *.cljs set filetype=clojure

" Syntax highlighting for Markdown files
au Bufread,BufNewFile *.md set filetype=markdown

" Syntax highlighting for Arduino
au Bufread,BufNewFile *.ino set filetype=cpp

" Same syntax for TypeScript as for JavaScript
au Bufread,BufNewFile *.ts set filetype=javascript

" Automatically open quickfix window if ShellCheck
" finds any problems with my shell scripts
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

" Fuzzy finder via Homebrew
set rtp+=/usr/local/opt/fzf

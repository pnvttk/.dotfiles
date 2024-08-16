" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
if &compatible
  set nocompatible
endif

" set cursor mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set background=dark
colorscheme slate

runtime macros/matchit.vim
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop=4         " Tab key indents by 4 spaces.
set shiftwidth=4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace=indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus=2         " Always show statusline.
set display=lastline  " Show as much as possible of the last line.

set clipboard=unnamed      " Use the OS clipboard by default (on versions compiled with `+clipboard`)

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set wildmenu               " Enhance command-line completion
set esckeys                " Allow cursor keys in insert mode

set number
set ignorecase             " Ignore case searchs
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report=0		   " Always report changed lines.
set synmaxcol=200	   " Only highlight the first 200 columns.

" Don’t add empty newlines at the end of files
set binary
set noeol
set nofixeol
set nofixendofline

"-- FOLDING --  
"set foldmethod=syntax "syntax highlighting items specify folds  
"set foldcolumn=1 "defines 1 col at window left, to indicate folding  
"let javaScript_fold=1 "activate folding by JS syntax  
"set foldlevelstart=99 "start file with all folds opened

syntax enable
colorscheme badwolf             " Download this colorcheme from https://github.com/sjl/badwolf
set clipboard=unnamed
set number relativenumber
set incsearch                   " search as characters are entered
set hlsearch                    " Highlight search terms
set showmatch                   " highlight matching [{()}]
set cursorline                  " highlight current line 
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of  spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every two columns
set softtabstop=2               " Let backspace delete indent

let mapleader=","               " leader is comma

set wildmenu                    " Display all matching files when we tab complete
set wildmode=list:longest,full
set path+=**                    " Search down into subdictories

" find all word under current cursor in **/*
nmap <Leader>fg :execute "vimgrep /" . expand("<cword>") . "/j **/*"<Bar>cw<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

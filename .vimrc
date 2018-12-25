colorscheme peaksea

set clipboard=unnamed
set number relativenumber
set hlsearch                    " Highlight search terms
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent


" force use <CTRL>c
inoremap <ESC> <Nop>
" find all word under current cursor in **/*
nmap <Leader>fg :execute "vimgrep /" . expand("<cword>") . "/j **/*"<Bar>cw<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk



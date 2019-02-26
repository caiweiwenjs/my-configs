syntax enable
colorscheme delek
set nocompatible
set clipboard=unnamed
set number relativenumber
set incsearch                   " search as characters are entered
set hlsearch                    " Highlight search terms
set showmatch                   " highlight matching [{()}]
set cursorline                  " highlight current line 
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
filetype plugin indent on
set shiftwidth=2                " Use indents of  spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every two columns
set softtabstop=2               " Let backspace delete indent
set backspace=indent,eol,start

let mapleader=","               " leader is comma

set wildmenu                    " Display all matching files when we tab complete
set wildmode=list:longest,full
set path+=**                    " Search down into subdictories

" find all word under current cursor in **/*
nmap <Leader>fg :execute "vimgrep /" . expand("<cword>") . "/j **/*"<Bar>cw<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" Edit my vim rc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Toggle relative number
nnoremap <leader>trn :setlocal relativenumber!<cr>
" Toggle number
nnoremap <leader>tn :setlocal number!<cr>

" Abbreviation for my email address
iabbrev @@ caiweiwen@163.com

augroup filetype_comment
  autocmd!
  autocmd FileType cpp :nnoremap <buffer> <leader>/ I//<esc>
  autocmd FileType sh :nnoremap <buffer> <leader>/ I#<esc>
augroup END

augroup folding
  autocmd!
  autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
  autocmd Syntax c,cpp,vim,xml,html,xhtml normal! zR 
augroup END

" Install Vim-Plug first. Github: https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
" Should install the_silver_searcher
Plug 'rking/ag.vim'

" Initialize plugin system
call plug#end()

" key map for fzf
nnoremap <silent> <C-p> :FZF -m<cr>
nnoremap <silent> <space> :Buffers<cr>
nnoremap <silent> <C-h> :History:<cr>
nmap ; :Tags<CR>

nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" CTAGS
function! CreateCppTags(root)
                let l:tags_path = a:root . "/tags"
                let l:include_path = a:root . "/xxx"
    let l:excludes=" --exclude=*.a --exclude=*.o --exclude=*.so --exclude=*.pb.cc --exclude=*.pb.h " . l:include_path . "/build " . l:include_path . "/logs "
    exec ':!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ' . l:excludes . ' -o ' . l:tags_path . ' ' . l:include_path
endfunction
nmap <silent> <F4> :call CreateCppTags("path")<CR>




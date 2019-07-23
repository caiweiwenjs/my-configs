syntax enable
colorscheme delek
set nocompatible
set clipboard=unnamed
set number relativenumber
set incsearch                   " search as characters are entered
set hlsearch                    " Highlight search terms
hi Search ctermfg=Black
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
" Toggle paste
nnoremap <leader>p :set paste!<cr>
" Toggle list mode
nnoremap <leader>l :set list!<cr>
" Vertical resize 
nnoremap <leader>> :vertical resize +10<cr>
nnoremap <leader>< :vertical resize -10<cr>
" auto insert }
inoremap {<CR> {<CR>  <CR>}<up><right>
" move line
nnoremap <C-K> ddkP
nnoremap <C-J> ddp

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
" require the_silver_searcher installed
Plug 'rking/ag.vim'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
" require clang-format command (3.4 or later) installed
Plug 'rhysd/vim-clang-format'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'


" Initialize plugin system
call plug#end()

" key map for fugitive
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gm :Gcommit --amend<cr>
nnoremap <leader>ga :Gadd -p<cr>
nnoremap <leader>gf :Gdiff<cr>
nnoremap <leader>gd :Git diff<cr>

" key map for fzf
nnoremap <silent> <C-p> :FZF -m<cr>
nnoremap <silent> <space> :Buffers<cr>
nnoremap <silent> <C-h> :History:<cr>
nmap ; :Tags<CR>

" key map for NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" key map for vim-clang-format
nnoremap <silent> <leader>cf :ClangFormat<CR>

" ALE
nnoremap <silent> <leader>at :ALEToggle<CR>
nnoremap <silent> <leader>ad :ALEDetail<CR>
nnoremap <silent> <leader>ai :ALEInfo<CR>
"nnoremap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <C-i> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \   'cpp': ['clang']
      \}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_cpp_clang_options = '
      \ -std=c++14 -Wall
      \ -I ./'

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" AG
" override ag.vim's g:ag_prg, search for Cpp, Shell, Python and Markdown only
cabbrev Ag Ag!
let g:ag_prg = 'ag --vimgrep --cpp --shell --python --md'

" CTAGS
function! CreateCppTags(root)
                let l:tags_path = a:root . "/tags"
                let l:include_path = a:root . "/xxx"
    let l:excludes=" --exclude=*.a --exclude=*.o --exclude=*.so --exclude=*.pb.cc --exclude=*.pb.h " . l:include_path . "/build " . l:include_path . "/logs "
    exec ':!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ' . l:excludes . ' -o ' . l:tags_path . ' ' . l:include_path
endfunction
nmap <silent> <F4> :call CreateCppTags("path")<CR>



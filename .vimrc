" --- vim-plug settings ---
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
Plug 'thinca/vim-quickrun'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
" --- vim-plug settings ---

" --- general settings ---
" color scheme
set background=light
colorscheme papercolor
" line numbers
set number
set relativenumber
" indenting 
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set softtabstop=4
" copy and paste to and from Vim
set clipboard=unnamed
" remove error bells
set noerrorbells
set vb t_vb = 
set belloff=all
" removes backup
set nobackup
set undodir=~/.vim/undodir
set undofile
" begin search as you type
set incsearch
" disables auto comments after newline of original comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" natural splits
set splitbelow
set splitright
" resize split when resize terminal 
autocmd VimResized * wincmd = 
" indented text wrapping when whitespace
set breakindent
set breakindentopt=shift:2
set linebreak
" set leader key
let mapleader = " "
" auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()
" Reformat file and retain current position
nnoremap g= mmgg=G`m
set backspace=indent,eol,start
" Shows the file name in the title bar
set title
" Remove swp files
set noswapfile
" Always show sign column
set signcolumn=yes
" --- general settings ---

" --- fzf settings ---
" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" --- fzf settings ---

" --- template settings ---
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
" --- template settings ---

" --- compile run settings --- 
" <leader>m to test for errors
" <leader>r to show output
" Java
autocmd FileType java nnoremap <leader>m :w <bar> :set makeprg=javac\ %<CR>:Make<CR>
autocmd FileType java nnoremap <leader>n :w <bar> :ter java -cp %:p:h %:t:r <CR>
" C++
autocmd FileType cpp nnoremap <leader>m :w <bar> :set makeprg=g++\ %\ -o\ %<<CR>:Make<CR>
autocmd FileType cpp nnoremap <leader>n :w <bar> :ter ./%< <CR>
" --- compile run settings --- 

nnoremap <leader>t :let $VIM_DIR=expand('%:p:h')<bar>:let $FILE_NAME=expand('%')<CR>:terminal<CR>cd $VIM_DIR

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


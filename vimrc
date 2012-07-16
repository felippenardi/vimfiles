set nocompatible               " be iMproved
filetype off                   " required!

" ==========================================
" Vundle configs ---------------------------
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-ragtag.git'
" ==========================================


filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
filetype indent on    " Enable filetype-specific indenting
syntax on             " Enable syntax highlighting

set nocompatible

" status-line setup
set statusline=%m\      " file is modified
set statusline+=%f      " tail of the filename
set statusline+=%=      " left/right separator
set statusline+=%y\     " filetype
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set laststatus=2        " always show status-line
set showcmd             " show (partial) command in the last line of the screen

" Toggle column with line numbers
map <Leader>ln :set number!<CR>
" Toggle column with distance in lines
map <Leader>lr :set relativenumber!<CR>
" Initialize showing line numbers
set number            " Show line number

set encoding=utf-8    " Define file to utf-8
"Add utf-8 shebang line
noremap <D-1> :0put = '#-*- coding: utf-8 -*-'<CR>

set nowrap
set autoindent
set expandtab                             " Convert tabs char to spaces.
set tabstop=2 shiftwidth=2 softtabstop=2  " Set default tab size to 2

" RagTag init.
let g:ragtag_global_maps = 1

" Custom tab format, basend on languange conventions.
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing spaces                        "    this also shows visual selection info

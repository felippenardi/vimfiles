set t_Co=256
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
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-ragtag.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'vim-scripts/Railscasts-Theme-GUIand256color'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-ragtag'
Bundle 'lukaszb/vim-web-indent'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mbbill/undotree'
"Bundle 'FredKSchott/CoVim'
Bundle 'airblade/vim-gitgutter'
Bundle 'mikewest/vimroom'
" ==========================================

" Fast window resizing http://vim.wikia.com/wiki/Fast_window_resizing_with_plus/minus_keys
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

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
let mapleader = ","
set history=1000
set ignorecase
set smartcase
set scrolloff=1
set hidden

" Better  window split
" by Jonathan Palardy
" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
nmap <leader>swl  :topleft  vnew<CR>
nmap <leader>swh  :botright vnew<CR>
nmap <leader>swk  :topleft  new<CR>
nmap <leader>swj  :botright new<CR>
" Better buffer split
nmap <leader>sl   :leftabove  vnew<CR>
nmap <leader>sh   :rightbelow vnew<CR>
nmap <leader>sk   :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>

" Toggle Git Gutter
nmap <leader>git :GitGutterToggle<CR>

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

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing spaces

"NERDTree Toggle using \][ keymap
noremap <Leader>as :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2 "This changes current dir, so sync CommandT to look the same path as NERDTree is.

set undofile

colorscheme railscasts


" Quick expand current buffer
" gg = Maximize
" ss = Minimize
nmap <Leader>gg :NERDTreeClose<CR><C-W>_<C-W><Bar>
nmap <Leader>ss :NERDTreeFocus<CR><C-W>=<C-W>p

" Undotree Toggle
nmap <Leader><C-z> :UndotreeToggle<cr>

" Avoid closing window when you just inted to cancel manage window command
nmap <C-w><C-c> <ESC>

" Clean closed buffers
" Usage: :call CloseHiddenBuffers
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that's loaded and not visible
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      exe 'bd ' . b
    endif
  endfor
endfun

"Toggle auto-indenting for code paste
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F2>

"Folding automatically on ident
"Use za to toggle fold on and off
"set foldmethod=indent
"set foldnestmax=4
" making fold looking nice
:hi Folded ctermfg=236
:hi Folded ctermbg=234

" highlight search
:set hls
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Identation Guide (3 levels)
" http://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim
:match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Line and Column hilight
:set cuc cul
:hi CursorLine gui=NONE guibg=#333333
:hi! link CursorColumn CursorLine

" Toggle Vimroom - Writeroom
nnoremap <silent> <Leader>ww <Plug>VimroomToggle

set nocompatible              " be iMproved, required
filetype off                  " required

" Istall Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'groenewege/vim-less'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'moll/vim-node'
Plugin 'sjl/gundo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Zen of GUI
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollba
set guioptions-=L  "remove left-hand scroll barr

if has("gui_running")
    :set colorcolumn=80
endif

" Font and theme of GUI
if has("gui_running")
    set guifont=Input\ 11
    " set guifont=Ubuntu\ Mono\ 10
    " set guifont=Source\ Code\ Pro\ 10

    " Monokai (dark) theme
    colorscheme monokai

    " Solarized (light) theme
    " colorscheme solarized
    " set background=light
endif

" Vim-airline
if has("gui_running")
    set laststatus=2 "always show statusbar
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
endif

" Hide native mode indication 
if has("gui_running")
    set noshowmode
endif

" Tab
set tabstop=4
set shiftwidth=4
set expandtab

"Switch between buffers without saving
set hidden

set nowrap

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']

" Hide line numbers
set nonumber

" NERDTree
if has("gui_running")
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif
let NERDTreeShowHidden=1

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Игнорировать регистр букв при поиске
set ignorecase
set smartcase

" Хитро удалить буфер, но оставить окно
nmap ,d :b#<bar>bd#<bar>b<CR>

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" nnoremap <Leader>m :w <BAR> !lessc % > %:r.css<CR><space>

" Compiling Less Files from Vim every save action
function LessToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !lessc " . current_file . " " . filename . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_width = 30
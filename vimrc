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
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Zen of GUI
set guioptions-=m  " no menu bar
set guioptions-=T  " no toolbar
set guioptions-=r  " no scrollbar
set guioptions-=L  " remove left-hand scroll barr

if has("gui_running")
    :set colorcolumn=80
endif

" Font and theme of GUI
if has("gui_running")
    set guifont=Input\ Mono\ 11
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
let NERDTreeIgnore = ['\.pyc$']

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

" File Types
au FileType html setl tabstop=2 shiftwidth=2 et
au FileType css setl tabstop=2 shiftwidth=2 et
au FileType javascript setl tabstop=2 shiftwidth=2 et
au FileType coffee setl tabstop=2 shiftwidth=2 et
au FileType htmldjango setl tabstop=2 shiftwidth=2 et

" Git gutter
let g:gitgutter_max_signs = 2000

" Flake8
let g:flake8_show_in_file = 1

" Identation in python
let g:pyindent_open_paren = '&sw' " default &sw * 2 

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py,*.js,*.coffee :call <SID>StripTrailingWhitespaces()

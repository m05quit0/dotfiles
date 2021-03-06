set nocompatible              " be iMproved, required
set backspace=indent,eol,start " correct backspace work
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

" Common plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'craigemery/vim-autotag'
Plugin 'SuperTab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'

" Filetype specific plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'moll/vim-node'
Plugin 'shawncplus/phpcomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax highlighting
syntax on

" Tab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set hidden " Switch between buffers without saving
set nowrap " No wrap lines
set nonumber " Hide line numbers

" Список кодировок файлов для автоопределения
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Игнорировать регистр букв при поиске
set ignorecase
set smartcase

" Хитро удалить буфер, но оставить окно
nmap ,d :b#<bar>bd#<bar>b<CR>

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set noundofile       " no new format backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.pyc$', '^\.git$', '^tags$', '^\.vagrant$', '__pycache__', '\.cache', '^\.idea$', '^\.svn$']
let NERDTreeMouseMode = 3
let NERDTreeMinimalUI = 1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Zen of GUI
if has("gui_running")
    set guioptions-=m  " no menu bar
    set guioptions-=T  " no toolbar
    set guioptions-=r  " no scrollbar
    set guioptions-=L  " remove left-hand scrollbar

    " Set font face and font size
    set guifont=Input\ 10
endif

" Ruler
set colorcolumn=120

" Color scheme
colorscheme gruvbox
set background=dark

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Vim-airline
set laststatus=2 "always show statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1


" Hide native mode indication
set noshowmode

" Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=120"
let g:syntastic_javascript_checkers = ['jshint']

" Git gutter
let g:gitgutter_max_signs = 2000
highlight clear SignColumn " fix dark gutter background with solarized light theme

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
autocmd BufWritePre *.py,*.js,*.coffee,*.html,*.css,*.less,*.php :call <SID>StripTrailingWhitespaces()

" Jedi-vim
autocmd FileType python setlocal completeopt-=preview

" Filetypes
au FileType yaml setl sw=2 sts=2 et

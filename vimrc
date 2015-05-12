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

" Common plugins
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/ZoomWin'

" Filetype specific plugins
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'moll/vim-node'
Plugin 'kchmck/vim-coffee-script'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'shawncplus/phpcomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" Netrw mode
let g:netrw_list_hide = '.*\.swp$,.*\.pyc$,^\.git/$,^tags$,^\.vagrant/$'

" Zen of GUI
set guioptions-=m  " no menu bar
set guioptions-=T  " no toolbar
set guioptions-=r  " no scrollbar
set guioptions-=L  " remove left-hand scrollbar

" Ruler
if has("gui_running")
    :set colorcolumn=120
endif

" Font and theme of GUI
if has("gui_running")
    set guifont=Input\ Mono\ 11
    " set guifont=Ubuntu\ Mono\ 10
    " set guifont=Source\ Code\ Pro\ 10

    " Monokai (dark) theme
    " colorscheme monokai

    " Solarized (light) theme
    colorscheme solarized
    set background=light
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

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=120"
let g:syntastic_javascript_checkers = ['jshint']

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
autocmd BufWritePre *.py,*.js,*.coffee :call <SID>StripTrailingWhitespaces()

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>

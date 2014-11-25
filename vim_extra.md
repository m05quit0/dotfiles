## Vundle
Установить Vundle

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## YouCompleteMe
Установить YouCompleteMe с помощью Vundle.

    Plugin 'Valloric/YouCompleteMe'

Установить зависимости

    sudo apt-get install vim-youcompleteme cmake

Скомпилировать YouCompleteMe

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh
    Или ./install.sh —clang-completer, если нужна поддержка C-семейства ЯП.

## Airline
Использование шрифтов powerline для отображения дополнительных символов в airline.
https://powerline.readthedocs.org/en/master/installation/linux.html#fontconfig

    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

## gVim
Цвет отступов от рабочей области в полноэкранном режиме (справа и снизу).
Создать файл ~/.gtkrc-2.0 cо следующим содержимым:

    style "vimfix" {
      bg[NORMAL] = "#202020" # this matches my gvim theme 'Normal' bg color.
    }
    widget "vim-main-window.*GtkForm" style "vimfix"

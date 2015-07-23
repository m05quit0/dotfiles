# DotFiles

Конфигурационные файлы моего рабочего окружения для разработки.

## Установка
Склонировать этот репозиторий.

    git clone https://github.com/m05quit0/dotfiles.git ~/Dev/etc/dotfiles

Добавить ссылки на конфиги в соответствующих местах.

    ln -s ~/Dev/etc/dotfiles/vimrc ~/.vimrc
    ln -s ~/Dev/etc/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/Dev/etc/dotfiles/jshintrc ~/.jshintrc

## Vundle
Установить Vundle.

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Установить все плагины.

    :PluginUpdate

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
    mkdir ~/.fonts/
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

## CTags
Для работы tagbar понадобится ctags.

    sudo apt-get install exuberant-ctags

## Markdown preview
Установить markdown.

    sudo apt-get install markdown

Установить xdotool.

    sudo apt-get install xdotool

Раскомментирвать превью по сохранению .md файла и закомментировать хоткей ctrl+p - в конце скрипта.

    vim ~/.vim/bundle/vim-markdown-preview/plugin/vim-markdown-preview.vim

## gVim
Цвет отступов от рабочей области в полноэкранном режиме (справа и снизу).
Создать файл ~/.gtkrc-2.0 cо следующим содержимым:

    style "vimfix" {
      bg[NORMAL] = "#202020" # this matches my gvim theme 'Normal' bg color.
    }
    widget "vim-main-window.*GtkForm" style "vimfix"

## Flake8
    
    sudo pip install flake8

## Less

    sudo apt-get install node-less

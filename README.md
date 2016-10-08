# DotFiles

Конфигурационные файлы рабочего окружения.

## Установка
Склонировать этот репозиторий.

    git clone git@github.com:m05quit0/dotfiles.git ~/Dev/etc/dotfiles

Добавить ссылки на конфиги в соответствующих местах.

    ln -s ~/Dev/etc/dotfiles/vimrc ~/.vimrc
    ln -s ~/Dev/etc/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/Dev/etc/dotfiles/jshintrc ~/.jshintrc

## VIM

### Vundle
Установить Vundle.

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Установить все плагины.

    :PluginUpdate

### Flake8
    
    sudo pip install flake8

### Jedi
    
    sudo pip install jedi

### Less
    sudo apt install node-legacy
    sudo apt install node-less

### CTags
Для работы tagbar понадобится ctags.

    sudo apt install exuberant-ctags

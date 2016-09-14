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

Установка на Windows: https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows

## CTags
Для работы tagbar понадобится ctags.

    sudo apt-get install exuberant-ctags

## Flake8
    
    sudo pip install flake8

## Jedi
    
    sudo pip install jedi

## Less

    sudo apt-get install node-less

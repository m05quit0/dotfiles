# DotFiles

Конфигурационные файлы моего рабочего окружения для разработки.

## Установка
Склонировать этот репозиторий.

    git clone https://github.com/m05quit0/dotfiles.git ~/Dev/etc/dotfiles

Добавить ссылки на конфиги в соответствующих местах.

    ln -s ~/Dev/etc/dotfiles/vimrc ~/.vimrc
    ln -s ~/Dev/etc/dotfiles/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    ln -s ~/Dev/etc/dotfiles/Default.sublime-theme ~/.config/sublime-text-3/Packages/User/Default.sublime-theme
    ln -s ~/Dev/etc/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/Dev/etc/dotfiles/jshintrc ~/.jshintrc

## VIM

### Vundle
Установить Vundle.

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Установить все плагины.

    :PluginUpdate

Установка на Windows: https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows

### CTags
Для работы tagbar понадобится ctags.

    sudo apt-get install exuberant-ctags

### Flake8
    
    sudo pip install flake8

### Jedi
    
    sudo pip install jedi

### Less

    sudo apt-get install node-less

## Sublime Text 3

Установить Package Control https://packagecontrol.io
#!/bin/sh

ln -s ~/Dev/etc/dotfiles/vimrc ~/.vimrc
ln -s ~/Dev/etc/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/Dev/etc/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dev/etc/dotfiles/jshintrc ~/.jshintrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

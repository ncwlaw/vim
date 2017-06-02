Setup
===============

MacVim
-------------

- Make sure you have Xcode instaleld
- brew install macvim --with-override-system-vim
- brew install CMake

Vim-Plug
-------------

- Pull git@github.com:junegunn/vim-plug.git
- mkdir ~/.vim/autoload -p- mkdir ~/.vim/autoload
- cp ./plug.vim ~/.vim/autoload

Dotfile
-------------

- cp .vimrc ~/.vimrc 

Vim
-------------

- :PlugInstall
- cd ~/vim/plugged/YouCompleteMe
- ./install.py --all


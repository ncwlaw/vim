Setup
===============

MacVim
-------------

- Make sure you have Xcode installd
- brew install macvim --with-override-system-vim

Vim-Plug
-------------

- Pull git@github.com:junegunn/vim-plug.git
- mkdir -p ~/.vim/autoload
- cp ./plug.vim ~/.vim/autoload

Dotfile
-------------
- cp .vimrc ~/.vimrc 

YouCompleteMe
-------------
- sudo apt-get install CMake

Upgrade Vim to Newest Verison on Ubuntu
-------------
- Prerequisite Ubuntu Libraries
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

- Remove existing VIM dependencies
sudo apt-get remove vim vim-runtime gvim

- Install VIM and dependencies
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope

cd ~/vim
sudo make install

Vim
-------------
- :PlugInstall
- cd ~/vim/plugged/YouCompleteMe
- ./install.py --all

Issues
-------------
- If you have issues with rvm, just make a symbolic link from the default rvm to the /usr/lib folder


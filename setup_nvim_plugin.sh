#!/bin/bash

mkdir /home/anbu

su -c 'sh -c "$(curl -fLo /home/anbu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"' anbu

cat <<'EOF'> /home/anbu/.config/nvim/init.vim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
call plug#end()
EOF

pip3 install neovim

find /home/anbu | xargs chown anbu 
find /home/anbu | xargs chgrp anbu 
su -c 'nvim --headless +PlugInstall +qa' anbu

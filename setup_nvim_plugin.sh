#!/bin/bash

mkdir /home/anbu

su -c 'sh -c "$(curl -fLo /home/anbu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"' anbu

cat <<'EOF'> /home/anbu/.config/nvim/init.vim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug ''
call plug#end()
EOF

pip3 install neovim

find /home/anbu | xargs chown anbu 
find /home/anbu | xargs chgrp anbu 

# download fuzzy finder binary
su -c 'sh -c "$(curl -fLo /home/anbu/.local/share/nvim/plugged/fzf/bin/fzf.tar.gz --create-dirs https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz && cd /home/anbu/.local/share/nvim/plugged/fzf/bin && tar xf fzf.tar.gz && rm fzf.tar.gz)"' anbu

# to install all the plugins listed in init.vim
su -c 'nvim --headless +PlugInstall +qa' anbu

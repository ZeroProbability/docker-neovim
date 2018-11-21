#!/bin/bash

mkdir -p /home/anbu/.config/nvim

su -c 'sh -c "$(curl -fLo /home/anbu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"' anbu

cat <<'EOF'> /home/anbu/.config/nvim/init.vim

source /mnt/.vim/neovim/nvim.vim

EOF

pip3 install neovim

find /home/anbu | xargs chown anbu 
find /home/anbu | xargs chgrp anbu 

# download fuzzy finder binary
su -c 'sh -c "$(curl -fLo /home/anbu/.local/share/nvim/plugged/fzf/bin/fzf.tar.gz --create-dirs https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz && cd /home/anbu/.local/share/nvim/plugged/fzf/bin && tar xf fzf.tar.gz && rm fzf.tar.gz)"' anbu

# to install all the plugins listed in init.vim
su -c 'nvim --headless +PlugInstall +qa' anbu

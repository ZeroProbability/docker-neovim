# Commands for building the image

    docker build . -t ramselvan/neovim
    docker run -it ramselvan/neovim:latest "/bin/bash" -c "su -c /bin/zsh anbu"

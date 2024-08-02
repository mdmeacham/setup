#!/bin/bash

# start fresh
rm ~/.vimrc
rm -fr ~/.vim

# Install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create .vimrc file
cat << 'EOF' > ~/.vimrc
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
EOF

# Install plugins with vim-plug
vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"

# Install go binaries for vim-go plugin (in ~/go/bin/)
vim -es -u ~/.vimrc -i NONE -c "GoInstallBinaries" -c "qa"
exit 0



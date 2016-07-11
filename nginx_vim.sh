#!/bin/sh
mkdir -p ~/.vim/syntax
wget http://www.vim.org/scripts/download_script.php?src_id=19394 -O ~/.vim/syntax/nginx.vim
echo "au BufRead,BufNewFile */nginx*/* set ft=nginx" >> ~/.vim/filetype.vim
echo "syntax enable" >> ~/.vimrc
exit 0

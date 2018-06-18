# Mini .vimrc for testing via Vader.

vim -Nu <(cat << VIMRC
filetype off
set rtp^=~/.vim/bundle/vader.vim
set rtp+=~/.vim/bundle/behave.vim
filetype plugin indent on
syntax enable
VIMRC) -c 'Vader! tests/*.vader' > /dev/null 

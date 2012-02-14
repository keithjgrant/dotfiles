set number
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set ruler

set hidden
syntax enable
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

colorscheme zenburn


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/kgrant', "~", "g")
    return curdir
endfunction

set statusline=CWD:%{CurDir()}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%#statuslineerr#%t%*\ %c,%l\ %P\ %#statuslineerr#%*

set laststatus=2

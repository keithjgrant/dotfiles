set number
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set autoindent
set smarttab

set hidden
syntax enable
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

set gfn=Inconsolata:h14

if has('gui_running')
    set clipboard=unnamed

    colorscheme solarized
    set background=light
else
    colorscheme zenburn
    set background=dark
endif


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/kgrant', "~", "g")
    return curdir
endfunction

set statusline=CWD:%{CurDir()}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%#statuslineerr#%t%*\ %c,%l\ %P\ %#statuslineerr#%*

set laststatus=2

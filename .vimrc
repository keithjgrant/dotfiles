set number
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set autoindent
set smarttab

imap jj <Esc>
cmap W w
"map <Leader>b :bp|:db#<CR>
"command DDB :bd|:db#
"cmap nt :NERDTreeToggle
"cmap ddb :bp\|bd#

let NERDTreeIgnore=['\.pyc']
"let NERDTreeShowHidden=1
map <Leader>n :NERDTreeToggle<CR>

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
    set background=dark
else
    colorscheme zenburn
    set background=dark
endif

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/kgrant', "~", "g")
    return curdir
endfunction

set statusline=CWD:%{CurDir()}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%#statuslineerr#%t%*\ %c,%l\ %P\ %#statuslineerr#%*

set laststatus=2

call pathogen#infect()

nmap <Leader>i Oimport ipdb; ipdb.set_trace()
nmap <Leader>p Oimport pdb; pdb.set_trace()
nmap <Leader>l Oconsole.log();<Esc>hi

" enable loading the plugin files, (filetype plugin indent on) enable loading the indent file
filetype plugin on
" strip extra space off the end of lines: [commenting out, b/c these move the
" cursor on save and it is extremely annoying]
"autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
"autocmd FileType javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
set list
set listchars=trail:·,tab:▸\ ,precedes:«,extends:»

" http://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype mako setlocal ts=2 sts=2 sw=2 expandtab

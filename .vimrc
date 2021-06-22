""
"" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""
"" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
""
""

call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'



call plug#end()

" Basic settings
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
""
set nocompatible
set backspace=indent,eol,start
set history=1000
set undolevels=1000
syntax on
set hlsearch
"set textwidth=79
"set lbr
set smarttab
"set smartindent
set autoindent
set shiftround
set backspace=indent,eol,start
set number
"set relativenumber
set incsearch
set laststatus=2
"set t_Co=256
"set cindent
set hidden "dont ask about unsaved buffers
"set mouse=a
set background=dark
set wildmenu
set path+=**
colorscheme codedark
set cursorline
set colorcolumn=80

if has("gui_running")
    "set guioptions-=T
    "set guioptions-=m
    "set go=c
    " Console + X11 Clipboard
    set go=ca
    set guifont=Ubuntu\ Mono\ 13
endif

if has("win32")
    set guifont=Consolas:h11:cANSI
    set shell=powershell
    set shellcmdflag=-command
    set guicursor=a:blinkon0
    au GUIEnter * simalt ~x
endif


" Folding
"set foldmethod=indent

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1

autocmd CompleteDone * pclose
filetype plugin indent on

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Keymaps
map <leader>p "+gP
map <leader>y "+y
map <leader>r :make<CR>
map <F5> :make<CR>
map <leader>s :set spell!<CR>
map <leader>e :NERDTreeToggle<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Use Ctrl+6
nmap <C-j> :bp<CR>
imap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
imap <C-k> :bn<CR>

"map <C-]> :vsplit<CR>:execute "tag " . expand( "<cword>" )<CR>zz<C-w>p

" vim password manager
set cryptmethod=blowfish

" Make helpers
autocmd FileType spec set makeprg=rpmbuild\ -ba\ %
autocmd FileType yaml set makeprg=ansible-lint\ %
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"autocmd FileType python set makeprg=python\ %
"autocmd FileType python set makeprg=pyflakes\ %
"autocmd FileType python set errorformat=%f:%l:\ %m
"autocmd BufWritePost *.py !flake8 %

" Override default for certain filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Highlight extra stuff
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL

ab __fp Othman Madjoudj <athmane@fedoraproject.org>
ab __ms Othman Madjoudj <omadjoudj@mirantis.com>

let g:notes_directories = ['~/workspace/vim-notes']

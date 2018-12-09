" Pre-Reqs
" yum search vim
" yum -y install vim-enhanced vim-X11 vim-jedi vim-omnicppcomplete vim-nerdtree vim-syntastic-python vim-syntastic-c

""""""" SETUP
" mkdir -p ~/.vim/pack/plugins/start/ && cd ~/.vim/pack/plugins/start/ && grep -E '^"\+' ~/.vimrc | sed 's/^"+//'  | xargs -P5 -I{} bash -c "{}"
""""""" EOS

"+git clone https://github.com/athmane/pyflakes-vim
"+git clone https://github.com/itchyny/lightline.vim
"+git clone https://github.com/ap/vim-buftabline

" Optional or removed due to perf issues
"-git clone https://github.com/vim-airline/vim-airline
"-git clone https://github.com/scrooloose/nerdtree
"-git clone https://github.com/ctrlpvim/ctrlp.vim.git
"-git clone https://github.com/SirVer/ultisnips.git
"-git clone https://github.com/honza/vim-snippets.git
"-git clone https://github.com/vim-airline/vim-airline-themes
"-git clone https://github.com/jpalardy/vim-slime.git


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
set relativenumber
set incsearch
set laststatus=2
"set t_Co=256
"set cindent
set hidden "dont ask about unsaved buffers
"set mouse=a
set background=dark
set wildmenu
set path+=**
colorscheme desert

if has("gui_running")
    set cursorline
    set guioptions-=T
    "set guioptions-=m
    set guifont=Monospace\ 12
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


" fix omnicompletition / line num colors
highlight Pmenu ctermfg=black ctermbg=lightgray
highlight PmenuSel ctermfg=white ctermbg=darkblue gui=bold
highlight Pmenu guifg=black guibg=lightgray
highlight PmenuSel guifg=white guibg=darkblue gui=bold
highlight LineNr guifg=#555555
highlight LineNr ctermfg=darkgray
autocmd CompleteDone * pclose
filetype plugin indent on

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Keymaps
map <leader>p "+gP
map <leader>y "+y
map <leader>r :make<CR>
map <leader>s :set spell!<CR>
map <leader>e :NERDTreeToggle<CR>

" vim password manager
set cryptmethod=blowfish

" Buftabline and Lightline config
let g:buftabline_numbers=1
let g:buftabline_indicators=1
"let g:lightline = {'colorscheme': 'solarized',}

" Make helpers
autocmd FileType spec set makeprg=rpmbuild\ -ba\ %
autocmd FileType yaml set makeprg=ansible-lint\ %
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

ab ___ Athmane Madjoudj <athmane@fedoraproject.org>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

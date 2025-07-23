
"#### NOTE
" mkdir -p ~/.vim/pack/plugins/start/
" cd ~/.vim/pack/plugins/start/
" git clone https://github.com/vim-airline/vim-airline
" git clone https://github.com/tpope/vim-fugitive
" https://github.com/Yggdroot/indentLine
" https://github.com/dense-analysis/ale
" Python
" git clone https://github.com/davidhalter/jedi-vim
" YAML
" https://github.com/pedrohdz/vim-yaml-folds
" Golang
" #git clone https://github.com/fatih/vim-go
" FZF
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim

" Basic settings
set tabstop=4
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
set cindent
set hidden "dont ask about unsaved buffers
"set mouse=a
set background=dark
set wildmenu
set path+=**
colorscheme habamax
set cursorline
set cuc
set colorcolumn=80

if has("gui_running")
    set guioptions-=T
    "set guioptions-=m
    "set go=c
    " Console + X11 Clipboard
    "set go=ca
    "set guifont=Ubuntu\ Mono\ 12
    set guifont=Monaco:h14
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

autocmd CompleteDone * pclose
filetype plugin indent on

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"ProjectDrawer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme = ''
let g:airline_powerline_fonts = 0

" Keymaps
map <leader>p "+gP
map <leader>y "+y
map <leader>m :make<CR>
map <F5> :make<CR>
map <leader>s :set spell!<CR>
map <leader>e :Explore<CR>

autocmd FileType python map  <leader>r :!python %<CR>
autocmd FileType go map  <leader>r :GoRun<CR>
autocmd FileType go map  <leader>t :GoTest<CR>
autocmd FileType go map  <leader>b :GoBuild<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Use Ctrl+6

" Autoclose
"autocmd FileType sh,php,c,python,go,yaml inoremap " ""<left>
"autocmd FileType sh,php,c,python,go,yaml inoremap ' ''<left>
"autocmd FileType sh,php,c,python,go,yaml inoremap ( ()<left>
"autocmd FileType sh,php,c,python,go,yaml inoremap [ []<left>
"autocmd FileType sh,php,c,python,go,yaml inoremap { {}<left>
"autocmd FileType sh,php,c,python,go,yaml inoremap {<CR> {<CR>}<ESC>O
"autocmd FileType sh,php,c,python,go,yaml inoremap {;<CR> {<CR>};<ESC>O

" Make helpers
autocmd FileType spec set makeprg=rpmbuild\ -ba\ %
"autocmd FileType yaml set makeprg=ansible-lint\ %
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"autocmd FileType python set makeprg=python\ %
"autocmd FileType python set makeprg=pyflakes\ %
"autocmd FileType python set errorformat=%f:%l:\ %m
"autocmd BufWritePost *.py !flake8 %

" Override default for certain filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal noexpandtab

" Highlight extra stuff
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:indentLine_char = '⦙'

set foldlevelstart=20

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

ab __fp Othman Madjoudj <athmane@fedoraproject.org>
ab __ms Othman Madjoudj <omadjoudj@mirantis.com>

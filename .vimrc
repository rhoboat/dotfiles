set nocompatible
execute pathogen#infect()

" ================ General Config ====================
set number                     "Line numbers are good
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000               "Store lots of :cmdline history
set showcmd                    "Show incomplete cmds down the bottom
set showmode                   "Show current mode down the bottom
set gcr=a:blinkon0             "Disable cursor blink
set visualbell                 "No sounds
set autoread                   "Reload files changed outside vim

" color theme
set background=dark
colorscheme PaperColor

" allow buffers to exist in the background without being in a window
set hidden

" golang syntax highlighting
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent on
syntax on

" set mapleader to , because \ is too far away
" do it before vundle loads plugins
let mapleader=","
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" no swap files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" indentation
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap "wrap lines
set linebreak "Wrap lines at convenient points

set path=$PWD/**

" completion
set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" scrolling
set scrolloff=0 "Start scrolling when we're 2 lines away from margins
set sidescrolloff=0
set sidescroll=1

" search
set incsearch " Find the next match as we type the search
set hlsearch " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set tags=$PWD/.git/tags
runtime macros/matchit.vim

" ,ev edits ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" ,sv reloads ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" shift + enter makes a new line above cursor (not working)
nmap <S-Enter> O<Esc>

" enter makes a new line below cursor
nmap <CR> o<Esc>

" close a buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" :nt opens NERDTree
cnoreabbrev nt nt<c-\>esubstitute(getcmdline(), '^nt\>', 'NERDTree', '')<enter>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=21
let NERDTreeIgnore = ['\.keep$', '\.DS_Store$']

" makes it possible to use . operator in visual mode
xnoremap . :normal .<CR>

" swank server settings for clisp repl setup
"let g:slimv_swank_cmd='!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
" use rainbow parens
let g:lisp_rainbow=1

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .gitignore`"'
" don't fucking know how to use vim-javascript
"let javascript_enable_domhtmlcss

" a reversed cursor
hi Cursor cterm=reverse 

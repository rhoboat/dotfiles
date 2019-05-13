set nocompatible
execute pathogen#infect()

" ================ General Config ====================
set number                     "Line numbers are good
set relativenumber
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000               "Store lots of :cmdline history
set showcmd                    "Show incomplete cmds down the bottom
set showmode                   "Show current mode down the bottom
set gcr=a:blinkon0             "Disable cursor blink
set visualbell                 "No sounds
set autoread                   "Reload files changed outside vim
"set foldmethod=indent          "Creates folds at indentations

" color theme
colorscheme Tomorrow-Night-Bright

" allow buffers to exist in the background without being in a window
set hidden

" golang syntax highlighting
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent on
syntax on

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
set shiftwidth=2
autocmd Filetype java setlocal shiftwidth=4 tabstop=4 expandtab

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
hi Search ctermbg=170 " pink yay
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set tags=$PWD/.git/tags
runtime macros/matchit.vim

" set mapleader to , because \ is too far away
" do it before vundle loads plugins
let mapleader=","
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" set Esc to kj because <Esc> is too far away
inoremap kj <Esc>

" ,ev edits ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" ,sv reloads ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" enter makes a new line below cursor
nnoremap <CR> o<Esc>

" shift + enter makes a new line above cursor (not working)
nnoremap <S-CR> O<Esc>

" close a buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Autoremove trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" :nt opens NERDTree
cnoreabbrev nt nt<c-\>esubstitute(getcmdline(), '^nt\>', 'NERDTree', '')<enter>
map <C-e> :NERDTreeTabsToggle<CR>:NERDTreeMirrorOpen<CR>
"locate current file in NERDTree
map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeIgnore = ['\.keep$', '\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize = 35
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1

" makes it possible to use . operator in visual mode
xnoremap . :normal .<CR>

" swank server settings for clisp repl setup
"let g:slimv_swank_cmd='!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
" use rainbow parens
let g:lisp_rainbow=1

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_user_command = 'find %s -type f
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" a reversed cursor
hi Cursor cterm=reverse

" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String
" vim-jsx
let g:jsx_ext_required = 0
" flow
"let g:javascript_plugin_flow = 1

" fzf
set rtp+=/usr/local/opt/fzf
nnoremap ; :Buffers<CR>
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>r :Tags<CR>

" vim-tmux-navigator
nnoremap <silent> <c-j> <c-w>j<CR>
nnoremap <silent> <c-k> <c-w>k<CR>
nnoremap <silent> <c-h> <c-w>h<CR>
nnoremap <silent> <c-l> <c-w>l<CR>
nnoremap <silent> <c-\> <c-w>\<CR>

" vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" vi mode in tmux
"
" goyo for prose mode
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" ale: only run eslint linter
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'typecheck'],
\}

" ale: will try to fix with eslint javascript
let g:ale_fixers = {
\   'css': ['prettier'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'prettier'],
\}
let g:ale_javascript_prettier_use_local_config = 1

" ale: always show the lefthand gutter
let g:ale_sign_column_always = 1
" ale: fix files automatically on save
let g:ale_fix_on_save = 1

" ale: enable completion where available
let g:ale_completion_enabled = 1
" highlights background of errors and warnings
" green
highlight ALEError ctermbg=22
highlight ALEErrorSign ctermbg=22
" teal
highlight ALEWarning ctermbg=24
highlight ALEWarningSign ctermbg=24

" gitgutter
let g:gitgutter_sign_added = '・'
let g:gitgutter_sign_modified = '・'
let g:gitgutter_sign_removed = '・'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '~'

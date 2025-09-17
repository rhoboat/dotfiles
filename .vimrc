"set nocompatible
execute pathogen#infect()

" ================ General Config ====================
colorscheme Tomorrow-Night-Bright "Color theme
"colorscheme pyte                  "Light mode color theme
set modeline
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000               "Store lots of :cmdline history
set showcmd                    "Show incomplete cmds down the bottom
set showmode                   "Show current mode down the bottom
set visualbell                 "No sounds
set autoread                   "Reload files changed outside vim
set foldmethod=indent          "Creates folds at indentations
set splitright                 "Open vertical splits to the right
set splitbelow                 "Open splits to the bottom
set encoding=utf8              "Show glyphs (nerd fonts in statusline and nerdtree

" Choose a buffer quickly
nnoremap ; :buffers<CR>:buffer<Space>

" Yank from cursor to the end of line.
nnoremap Y y$

" Cursor settings
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode
set cursorline
set cursorcolumn

" allow buffers to exist in the background without being in a window
set hidden

set nobackup nowritebackup noswapfile "No swap files

" persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" golang syntax highlighting
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" hybrid line numbers with toggling
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
hi LineNr ctermfg=darkgrey "default color too dark

" indentation
"set autoindent " Turning this off defaults tabs to spaces in yaml files
set smartindent
set expandtab " use spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Display eol, tabs and trailing spaces visually
set list listchars=eol:¬,tab:▸·,trail:·

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
hi Search ctermbg=22 ctermfg=84 " green and red
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital

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
nnoremap <leader>ev :split $MYVIMRC<cr>

" ,sv reloads ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" close a buffer without closing the window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Autoremove trailing whitespace on :w
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * call TrimWhitespace()

" :nt opens NERDTree
cnoreabbrev nt nt<c-\>esubstitute(getcmdline(), '^nt\>', 'NERDTree', '')<enter>
map <leader>e :NERDTreeFind<CR>
let NERDTreeHighlightCursorline=0 "fix lag problem caused by colored icons
let NERDTreeHighlightCursorcolumn=0 "fix lag problem caused by colored icons
augroup nerdtreedisablecursorline
  autocmd!
  autocmd FileType nerdtree setlocal nocursorline
  autocmd FileType nerdtree setlocal nocursorcolumn
augroup end
let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeIgnore = ['\.keep$', '\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=3
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeCaseSensitiveFS=1
let g:NERDTreeWinSize = 35
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" open nt when vim start with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" makes it possible to use . operator in visual mode
xnoremap . :normal .<CR>

" swank server settings for clisp repl setup
"let g:slimv_swank_cmd='!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
" use rainbow parens
let g:lisp_rainbow=1

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
" MacOSX/Linux setting:
" let g:ctrlp_user_command = 'find %s -type f
let g:ctrlp_working_path_mode = 'wra'
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" a reversed cursor
hi Cursor cterm=reverse

" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String
" vim-jsx
let g:jsx_ext_required = 0

" fzf
"set rtp+=/usr/local/opt/fzf "use this line for local install of fzf
set rtp+=/opt/homebrew/opt/fzf "use this line for homebrew based install of fzf
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>r :Tags<CR>

" vim-tmux-navigator
nnoremap <silent> <c-j> <c-w>j<CR>
nnoremap <silent> <c-k> <c-w>k<CR>
nnoremap <silent> <c-h> <c-w>h<CR>
nnoremap <silent> <c-l> <c-w>l<CR>
nnoremap <silent> <c-\> <c-w>\<CR>
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" goyo for prose mode
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" ale: only run eslint linter (picks up tslint.yaml too)
" \   'go': ['gopls'], " this autofills, which is horrible
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\}

" ale: will try to fix with eslint javascript
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'css': ['prettier'],
\   'bash': ['shfmt'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'go': ['goimports'],
\   'python': ['yapf'],
\   'terraform': ['terraform'],
\   'hcl': ['terraform'],
\}
"let g:ale_javascript_prettier_use_local_config = 1
let g:ale_go_goimports_executable = 1
" vim-prettier
"let g:prettier#autoformat = 0
" Don't use ,p for prettier, it's for paste
"nmap <Leader>py <Plug>(Prettier)
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.mdx,*.json,*.graphql,*.md,*.yaml,*.html PrettierAsync

" ale: always show the lefthand gutter
let g:ale_sign_column_always = 1
" ale: fix files automatically on save
let g:ale_fix_on_save = 0

" ale: enable completion where available
let g:ale_completion_enabled = 1

let g:ale_lint_on_text_changed = 'never'

" ale trigger autocompletion manually with <C-x><C-o>
set omnifunc=ale#completion#OmniFunc

" Tsuquyomi completion
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

" Tsuquyomi settings
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" ale: highlight background of errors and warnings
" green
hi ALEError ctermbg=28 ctermfg=lightgray
hi ALEErrorSign ctermbg=28 ctermfg=lightgray
" blue
hi ALEWarning ctermbg=24 ctermfg=lightgray
hi ALEWarningSign ctermbg=24 ctermfg=lightgray

" ale: show # of warnings and errors in statusline
function! OkLinterStatus()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? 'OK' : ''
endfunction

function! WarnLinterStatus()
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:errors = l:counts.error + l:counts.style_error
  let l:warnings = l:counts.total - l:errors

  return l:warnings == 0 ? '' : printf('%dw', warnings)
endfunction

function! ErrorLinterStatus()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.error == 0 ? '' : printf('%de', counts.error)
endfunction

" Darken statusline background
hi StatusLine ctermbg=136 ctermfg=236
hi StatusLineNc ctermbg=gray ctermfg=236
hi VertSplit ctermbg=236 ctermfg=236

"set statusline=         "clear
"set statusline+=%f      "tail of the filename
"set statusline+=%y      "filetype
"set statusline+=%#ALEError# "green color (defined above)
"set statusline+=%m      "modified flag
"set statusline+=%*      "normal color
"set statusline+=%r      "read only flag
"set statusline+=%=      "left/right separator
"set statusline+=%{OkLinterStatus()}
"set statusline+=%#ALEWarning#
"set statusline+=%{WarnLinterStatus()}
"set statusline+=%*      "normal color
"set statusline+=%#ALEError#
"set statusline+=%{ErrorLinterStatus()}
"set statusline+=%*      "normal color
"
"set statusline+=\ %c,   "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set laststatus=2        "always show status line

" gitgutter
let g:gitgutter_sign_added = '・'
let g:gitgutter_sign_modified = '・'
let g:gitgutter_sign_removed = '・'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '~'

" Allow custom vim files
if filereadable(".vimrc.custom")
  so .vimrc.custom
endif

" Rust auto format
let g:rustfmt_autosave = 1

" :BufOnly will now clear all buffers but the current one
command! BufOnly execute '%bdelete|edit #|normal `"'

" vim-terraform setting
let g:terraform_fmt_on_save=1

" use vim-terragrunt to run hclfmt on hcl files
" Set this to 0 to turn it off. On by default
"let g:hcl_fmt_autosave = 1

" vim-go bundle settings
" By default it uses gopls, which I don't want.
let g:go_fmt_command = "gofmt"
" Autosave is on by default anyway
let g:go_fmt_autosave = 1
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  "\ 'goimports': '-local mycompany.com',
  \ }
" Enabled by default
"let g:go_code_completion_enabled = 1

" Support syntax highlighting for nunjucks files
au BufRead,BufNewFile *.njk setfiletype html

" light mode: https://stackoverflow.com/a/15095377/1143931
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Sets the statusbar theme
let g:airline_theme='distinguished'
" Add ability to see icons in statusline
let g:airline_powerline_fonts = 1
" Set vim font to a nerd font
set guifont=DejaVuSansMNF:h13

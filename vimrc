set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" All of your Plugins must be added before the following line
Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'groenewege/vim-less'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
" Plugin 'p0deje/vim-dispatch-vimshell'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-rvm'
Plugin 'terryma/vim-expand-region'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'mtscout6/vim-cjsx'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'romainl/flattened'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'ianks/vim-tsx'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'jremmen/vim-ripgrep'
Plugin 'rizzatti/dash.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'haya14busa/incsearch.vim'

" Plugin 'rust-lang/rust.vim'
" Plugin 'vim-ctrlspace/vim-ctrlspace'



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" filetype off
" call pathogen#infect()
" filetype plugin indent on
" set nocompatible

set encoding=utf-8
set linespace=4
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ttyscroll=3
set ruler
set display+=lastline
set backspace=indent,eol,start
set number
set relativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set incsearch
set fillchars=diff:⣿,vert:\|
set foldmethod=manual
set ignorecase
set smartcase
set hlsearch
runtime macros/matchit.vim

" Matchit support:
if exists("loaded_matchit")
  if !exists("b:match_words")
    let b:match_ignorecase = 0
    let b:match_words =
\ '\%(\%(\%(^\|[;=]\)\s*\)\@<=\%(class\|module\|while\|begin\|until\|for\|if\|unless\|def\|case\)\|\<do\)\>:' .
\ '\<\%(else\|elsif\|ensure\|rescue\|when\)\>:\%(^\|[^.]\)\@<=\<end\>'
  endif
endif

"set it if want to enable global substitution by default
"set gdefault
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set t_Co=256

set guifont=InputMonoCondensed:h18
set guioptions-=L
set guioptions-=r


set virtualedit+=block

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=10000

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again
set backupskip=/tmp/*,/private/tmp/*

" Better completerion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

set smarttab

set updatetime=250
set mouse=a
set shell=/bin/zsh
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"


" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinLeave,InsertEnter * set nocursorcolumn
  au WinEnter,InsertLeave * set cursorline
  au WinEnter,InsertLeave * set cursorcolumn
augroup END

set cursorline
set cursorcolumn

augroup twospace
  au!
  au BufRead * :set cpoptions+=J
augroup END

" augroup trailing
"   au!
"   au InsertEnter * :set listchars-=trail:⌴
"   au InsertLeave * :set listchars+=trail:⌴
" augroup END

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/chef/*
set wildignore+=*/coverage/*
set wildignore+=*/vcr_cassettes/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

" Configuration for find path
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END
set suffixesadd+=.rb

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Tabs, spaces, wrapping
set tabstop=2
set shiftwidth=2
set expandtab
set wrap
set textwidth=72
set formatoptions=qrn1j
set colorcolumn=+1

" Taking care of the trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Backups
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//


" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Color scheme

set background=light
colorscheme flattened_light
" colorscheme gruvbox

" Airline setting
let g:airline_theme = 'solarized'
let g:airline#extensions#whitespace#enabled = 0
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Nerd tree setting
let NERDTreeHighlightCursorline = 1
let NERDTreeCascadeOpenSingleChildDir = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen=1

map <D-d> :NERDTreeToggle<CR>
nnoremap <leader>l :NERDTreeFind<CR>
nnoremap <leader>P :NERDTreeFromBookmark<Space>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" autocmd VimEnter * NERDTree Bobcat
" Ctrlp setting
let g:ctrlp_clear_cache_on_exit = 0
" nmap <leader>p :CtrlPBuffer<cr>
set grepprg=ag\ --nogroup\
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .DS_Store
      \ --ignore tmp
      \ --ignore images
      \ --ignore vendor
      \ --ignore vcr
      \ --ignore "tags"
      \ --ignore vcr_cassettes
      \ --ignore "**/*.(png|jpeg|jpg|gif|bmp)"
      \ -g ""'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_prompt_mappings = {
  \ 'ToggleRegex()':        ['<F5>'],
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

" Tmuxline setting
let g:tmuxline_preset = 'powerline'
let g:tmuxline_separators = {
      \ 'left' : '▶',
      \ 'left_alt': '',
      \ 'right' : '◀',
      \ 'right_alt' : '',
      \ 'space' : ' '}
let g:tmuxline_powerline_separators = 0
" unicode symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 0

let g:airline#extensions#tabline#show_buffers = 0
" ag.vim
let g:ag_prg="ag --column --smart-case"
let g:ag_highlight=1
" taglist.vim
let Tlist_Close_On_Select = 1 "close taglist window once we selected something
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 0 "highlight current tag in taglist window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name
let Tlist_WinWidth = 50
nnoremap <c-e> :TlistToggle<cr>

" syntastic
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["haml", "less", "hrt", "erb", "eruby"] }
" let g:syntastic_ruby_checkers = ['rubocop']

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" ALE settings
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
        \ 'ruby' : ['rails', 'ruby']
        \ }

" Basic Mapping
nnoremap 0 ^
nnoremap ^ 0
nnoremap <leader>n :setlocal number!<cr>
nnoremap K :q<cr>
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <c-s> :<c-u>Update<cr>
inoremap <c-s> <esc>:Update<cr>

nnoremap <c-f> :Ag<space>
nnoremap M K
nnoremap <leader>= gg=G
" nnoremap <leader>rr :Rrunner<cr>
" vnoremap R :Rrunner<cr>
"

vnoremap // y/<C-R>"<CR>

nnoremap <leader>o O<esc>j
nnoremap S :vsplit<cr>
nnoremap H :split<cr>
nnoremap <D-r> :!ruby %<cr>
nmap ; :
vmap ; :
" Set wrap
nnoremap <leader>W :set wrap!<cr>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" use sane regexps
nnoremap / /\v
vnoremap / /\v

" Quick editting
" nnoremap <cr> :noh<cr>
" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-l> :tabnext<cr>
nnoremap <c-h> :tabprevious<cr>
noremap <leader>t :tabnew<cr>
noremap <leader>k :tabclose<cr>

map <localleader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
vmap f <Plug>(easymotion-s)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


" Fugitive key
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>


" Rails vim
nnoremap <leader>a :AS<cr>
nnoremap <leader>A :AV<cr>
nnoremap <leader>q :RS<cr>
nnoremap <leader>Q :RV<cr>

"Quickfix
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
nnoremap <c-q> :copen<cr>

" easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap <c-space> :CtrlPBuffer<cr>

let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

au BufRead,BufNewFile *.hrt  set filetype=coffee
au BufRead,BufNewFile *.es6  set filetype=javascript

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <bs> <c-w>W

" https://superuser.com/questions/755122/vim-move-to-first-non-blank-in-same-column
nnoremap <leader>j m':exec '/\%' . col(".") . 'c\S'<CR>``n
nnoremap <leader>k m':exec '?\%' . col(".") . 'c\S'<CR>``n

" https://coderwall.com/p/faceag/format-json-in-vim
nmap =j :%!python -m json.tool<CR>

"copies just the filename.
nmap <leader>cs :let @*=expand("%")<CR>
"copies the filename including its full path.
nmap <leader>cl :let @*=expand("%:p")<CR>

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

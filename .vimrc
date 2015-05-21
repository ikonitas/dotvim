" Edvinas Jurevicius aka zatan "

" Pathogen (helps managed packages on vim)
execute pathogen#infect()


set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle "pangloss/vim-javascript"
Bundle "Valloric/YouCompleteMe"
Bundle 'airblade/vim-rooter'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'tpope/vim-surround'
Bundle 'chase/vim-ansible-yaml'
Bundle 'terryma/vim-expand-region'

" Map Leader
let mapleader="\<Space>"

""""""""""""
" COMMANDS "
""""""""""""
"Command Wq or W or WQ equals to small cases
command W :w
command Wq wq
command WQ wq
" Sudo write this
cmap w!! w !sudo tee %
" ACK searching
nmap <leader>a :Rooter<CR>:Ack! --ignore-dir=migrations --ignore-dir=cache --ignore-dir=logs --type-set=DUMB="*.pyc" --nobreak --noenv -i -Q  <c-r>=expand("<cword>")<cr>


"nmap <Leader>a :Ack <c-r>=expand("<cword>")<cr>
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Save file
nnoremap <Leader>w :w<CR>

" Visual line mode
nmap <Leader><Leader> V

" Format pasted text automatically.
:nnoremap p ]p
:nnoremap <c-p> p

" Redraw screen
nmap <leader>r :redraw!<CR>

" Open existing file in Chrome
nnoremap <F12>c :exe ':!google-chrome %'<CR>

" less to css lessc is required
nnoremap <Leader>m :w <BAR> !lessc % > ../css/%:t:r.css<CR><space>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nmap <C-l> :nohlsearch<CR>
" Switch between bufers
nmap <C-e> :e#<CR>
" SWitch to next buffer
nmap <C-n> :bnext<CR>
" SWitch to previous buffer
nmap <C-p> :bprev<CR>

nmap <leader>f :CtrlP <CR>
" Syntastic go to next errors
nmap ]l :lnext<Cr>
nmap [l :lprev<Cr>

" Toggle lines numbers
:nmap \l :setlocal number!<CR>
" Toggles paste mode
:nmap \o :set paste!<CR>
" Lets search through buffer files
nmap ; :CtrlPBuffer<CR>
"Map sort function to a key
vnoremap <Leader>s :sort<CR>
" Moving between windows
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Toggles Tagbar
nmap <F8> :TagbarToggle<CR>

" Spell check
map <F9> :setlocal spell! spelllang=en_us<CR>

" Fold with space
nnoremap <leader>z za

" Esc
:imap jj <Esc>


"""""""""
" CTRLP "
"""""""""
let g:ctrlp_max_files = 10000
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


"""""""""""""
"SYNTASTIC "
"""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_exec='/usr/local/bin/jshint'

" Change config edit file /var/lib/gems/1.9.1/gems/scss-lint-0.32.0/config/default.yml
let g:syntastic_scss_lint_exec = '/usr/local/bin/scss-lint -c ~/.scss-lint.yml'
let g:syntastic_scss_checkers = ['scss_lint']

""" Do not check PEP8 on save
"let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" Display error flake 8
nmap <leader>c :SyntasticCheck<Cr>

" Ignore PEP8 rules
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=W293,E501,W391"

""""""""
" JEDI "
""""""""
" User buffers instead tabs on jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0


"""""""
" ACK "
"""""""
let g:ackprg="ack-grep"


""""""""""""""""""""""""""""""
" VIM-ROOT disable by default"
""""""""""""""""""""""""""""""
let g:rooter_manual_only = 1


syntax enable
syntax on

"filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

""""""""
" SETS "
""""""""
set autoindent              	      " always set autoindenting on
set autoread                          " Automatically reload files changed on disk.
set backspace=2             	      " Allow backspacing over autoindent, EOL, and BOL
set clipboard=unnamedplus     	      " Settings clipboard to be able copy/paste
set completeopt-=preview              " Remove preview window
set confirm                 	      " Y-N-C prompt if closing with unsaved changes.
set cursorline              	      " have a line indicate the cursor location
set dir=/tmp
set encoding=utf-8                    " The encoding displayed.
set expandtab               	      " Use spaces, not tabs, for autoindent/tab key.
set ffs=unix,dos,mac        	      " Try recognizing dos, unix, and mac line endings.
set fileencoding=utf-8                " The encoding written to file.
set foldenable                        " Enable Fold 
set foldcolumn=0            	      " show the fold column
set foldlevel=99            	      " don't fold by default
set foldlevelstart=10            	  " don't fold by default
set foldmethod=indent       	      " allow us to fold on indents
set hidden                            " Hides buffers instead of closing them
set hlsearch                	      " Highlight searches by default.
set ignorecase              	      " Default to using case insensitive searches,
set incsearch               	      " Incrementally search while typing a /regex
set laststatus=2            	      " Always show statusline, even if only 1 window.
set linebreak               	      " don't wrap textin the middle of a word
set ls=2                    	      " allways show status line
set matchpairs+=<:>         	      " show matching <> (html mainly) as well
set modeline                	      " Allow vim options to be embedded in files;
set modelines=5             	      " they must be within the first or last 5 lines.
set noautochdir                 	  " Your working directory is always the same as the file you are editing.
set noautoread              	      " Don't automatically re-read changed files.
set noautowrite             	      " Never write a file unless I request it.
set noautowriteall          	      " NEVER.
set nobackup                          " Disable stupid backups and swap files
set nostartofline           	      " Avoid moving cursor to BOL when jumping around
set noswapfile
set nowritebackup
set number        	      	      " Display line number
set numberwidth=1             	      " using only 1 column (and 1 space) while possible
set report=0                	      " : commands always print changed line count.
set ruler                   	      " show the cursor position all the time
set scrolloff=3             	      " Keep 3 context lines above and below the cursor
set shiftround              	      " rounds indent to a multiple of shiftwidth
set shiftwidth=4            	      " but an indent level is 2 spaces wide.
set shortmess+=a            	      " Use [+]/[RO]/[w] for modified/readonly/written.
set showcmd                 	      " Show incomplete normal mode commands as I type.
set showmatch               	      " Briefly jump to a paren once it's balanced
set smartcase               	      " unless uppercase letters are used in the regex.
set smartindent             	      " use smart indent if there is no indent file
set smarttab                	      " Handle tabs more intelligently
set softtabstop=4           	      " <BS> over an autoindent deletes both spaces.
set swapfile
set t_Co=256                  	      " User 256 Colors
set tabstop=4               	      " <tab> inserts 4 spaces
set title                     	      " show title in console title bar
set vb t_vb=                	      " Disable all bells.  I hate ringing/flashing.
set virtualedit=block       	      " Let cursor move past the last char in <C-v> mode
set wildignore+=*.o,*.obj,.git,*.pyc  " Ignore these files when completing
set wildmenu                  	      " Menu completion in command mode on <Tab>
set wildmode=longest,full             " <Tab> cycles between all matching choices.
set wrapmargin=0

" Search with tab
set wildcharm=<C-z>
cmap <expr> <Tab> getcmdtype() == "/" ? "<CR>/<C-r>/" : "<C-z>"

""""""""""
" PYTHON "
""""""""""
au FileType python setlocal expandtab smarttab shiftwidth=4 tabstop=4 textwidth=80 softtabstop=4 colorcolumn=80


""""""""
" HTML "
""""""""

" Different work configs

if hostname() == "ed"
    autocmd FileType xhtml,xml,css,less,javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    au FileType html,htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
    au FileType python setlocal expandtab smarttab shiftwidth=4 tabstop=4 textwidth=100 softtabstop=4 colorcolumn=100

    "Remove trailing whitespaces only after some text."
    autocmd BufWritePre *.css :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.less :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.scss :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.py :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.html :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.js :%s/\S\zs\s\+$//e
else
    autocmd FileType xhtml,xml,css,less,javascript,scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    au FileType html,htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

    "Remove trailing whitespaces."
    autocmd BufWritePre *.css :%s/\s\+$//e
    autocmd BufWritePre *.less :%s/\s\+$//e
    autocmd BufWritePre *.scss :%s/\S\zs\s\+$//e
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.html :%s/\s\+$//e
    autocmd BufWritePre *.js :%s/\s\+$//e
endif

""""""""""
" PYTHON "
""""""""""
au FileType python setlocal expandtab smarttab shiftwidth=4 tabstop=4 textwidth=100 softtabstop=4 colorcolumn=100

""""""""""""""""""""
" RE STRUCTED TEXT "
""""""""""""""""""""
au FileType rst setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=80 textwidth=80

"""""""""""""
" FUNCTIONS "
"""""""""""""
"Remember cursor position"""""""""""""""
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
if line("'\"") <= line("$")
normal! g`"
return 1
endif
endfunction

augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END
""""""""""""""""""""""""""""""""""""""""""

" Insert IPDB """""""""""""""""
function! Class()
r~/.vim/txt/ipdb.txt
endfunction
nmap <leader>p :call Class()<CR>
""""""""""""""""""""""""""""""""
colorscheme molokai

" Adds coding utf-8 coding "
autocmd BufWritePre *.py if getline(1) != '# -*- coding: utf-8 -*-' | call append(0, '# -*- coding: utf-8 -*-' ) | call append(1, '') | endif

" YouCompleteMe got to definition
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" YouCompleteMe got to Declaration
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Remap caps lock to ESC requires xorg-xmodmap package installed and hide
" output
silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' > /dev/null 2>&1

" On cursor move highligh all apearances.
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


" This autocmd changes the window-local current directory to be the same as
" the directory of the current file for example, to not change directory if the file is in /tmp.
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" javascript-libraries-syntaxlet g:used_javascript_libs =
let g:used_javascript_libs = 'angularjs,jquery'
" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Faster execution for git repositories
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif


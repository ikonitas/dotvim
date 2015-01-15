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
Bundle 'scrooloose/nerdtree'
Bundle "pangloss/vim-javascript"
Bundle "Valloric/YouCompleteMe"


" Map Leader
let mapleader=","

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
nmap <leader>a <Esc>:Ack --ignore-dir=migrations --type-set=DUMB="*.pyc" --nobreak --noenv -i -Q 
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>  	

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

" Enable NerdTree
nmap <F3> :NERDTreeToggle<Cr>

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
noremap <Space> za
" Esc
:imap jj <Esc>


"""""""""
" CTRLP "
"""""""""
let g:ctrlp_max_files = 10000
let g:ctrlp_working_path_mode = 'ra'

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


syntax enable
syntax on

"filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

""""""""
" SETS "
""""""""
set encoding=utf-8                    " The encoding displayed.
set fileencoding=utf-8                " The encoding written to file.
set t_Co=256                  	      " User 256 Colors
set clipboard=unnamedplus     	      " Settings clipboard to be able copy/paste 
set autochdir                 	      " Your working directory is always the same as the file you are editing. 
set number        	      	      " Display line number
set numberwidth=1             	      " using only 1 column (and 1 space) while possible
set title                     	      " show title in console title bar
set wildmenu                  	      " Menu completion in command mode on <Tab>
set wildmode=full             	      " <Tab> cycles between all matching choices.
set wildignore+=*.o,*.obj,.git,*.pyc  " Ignore these files when completing
set hidden                            " Hides buffers instead of closing them
set cursorline              	      " have a line indicate the cursor location
set ruler                   	      " show the cursor position all the time
set nostartofline           	      " Avoid moving cursor to BOL when jumping around
set virtualedit=block       	      " Let cursor move past the last char in <C-v> mode
set scrolloff=3             	      " Keep 3 context lines above and below the cursor
set backspace=2             	      " Allow backspacing over autoindent, EOL, and BOL
set showmatch               	      " Briefly jump to a paren once it's balanced
set linebreak               	      " don't wrap textin the middle of a word
set autoindent              	      " always set autoindenting on
set smartindent             	      " use smart indent if there is no indent file
set tabstop=4               	      " <tab> inserts 4 spaces 
set shiftwidth=4            	      " but an indent level is 2 spaces wide.
set softtabstop=4           	      " <BS> over an autoindent deletes both spaces.
set expandtab               	      " Use spaces, not tabs, for autoindent/tab key.
set shiftround              	      " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         	      " show matching <> (html mainly) as well
set foldmethod=indent       	      " allow us to fold on indents
set foldlevel=99            	      " don't fold by default
set foldcolumn=0            	      " show the fold column
set wrapmargin=0
set noautowrite             	      " Never write a file unless I request it.
set noautowriteall          	      " NEVER.
set noautoread              	      " Don't automatically re-read changed files.
set modeline                	      " Allow vim options to be embedded in files;
set modelines=5             	      " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        	      " Try recognizing dos, unix, and mac line endings.
set ls=2                    	      " allways show status line
set vb t_vb=                	      " Disable all bells.  I hate ringing/flashing.
set confirm                 	      " Y-N-C prompt if closing with unsaved changes.
set showcmd                 	      " Show incomplete normal mode commands as I type.
set report=0                	      " : commands always print changed line count.
set shortmess+=a            	      " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   	      " Show some info, even without statuslines.
set laststatus=2            	      " Always show statusline, even if only 1 window.
set ignorecase              	      " Default to using case insensitive searches,
set smartcase               	      " unless uppercase letters are used in the regex.
set smarttab                	      " Handle tabs more intelligently 
set hlsearch                	      " Highlight searches by default.
set incsearch               	      " Incrementally search while typing a /regex
set swapfile
set dir=/tmp

" Disable stupid backups and swap files
set nobackup
set nowritebackup
set noswapfile

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
else
    autocmd FileType xhtml,xml,css,less,javascript,scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    au FileType html,htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

    "Remove trailing hitespaces"
    autocmd BufWritePre *.css :%s/\s\+$//e
    autocmd BufWritePre *.less :%s/\s\+$//e
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
autocmd BufWritePre,FileWritePre *.py   ks|call LastMod()|'s
fun LastMod()
    for line in getline(1, 20)
        if line =~ "# -*-"
            return
        endif
    endfor
  if line("$") > 1
    let l = 0
  else
    let l = line("$")
  endif
  exe "0," . l ."g/#/s/#.*/#". 
  \" -*- coding: utf-8 -*-"
endfun

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

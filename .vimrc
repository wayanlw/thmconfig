"/* ─────────────────────────── Set the Leader key ─────────────────────────── */
let mapleader = " "

"/* ────────────────────────── Sets the Color Scheme ───────────────────────── */
try
    "colorscheme desert
    colorscheme murphy
endtry

"/* ────────────────────────────── abbreviations ───────────────────────────── */

abbr src source $MYVIMRC

"/* ───────────────────── allowance for spelling mistakes ──────────────────── */
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"/* ────────────────────────────────── vimrc ───────────────────────────────── */
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>

"/* ─────────────────────────────── highlights ─────────────────────────────── */
nmap <leader>h :noh<cr>

"/* ────────────────────────────── quick escape ────────────────────────────── */
inoremap <special> jk <ESC>
inoremap <special> jj <cr>

"" faster moving between lines
nnoremap <leader>j :+10<cr>
nnoremap <M-k> 10k

"" copy to the end of the line
nnoremap Y y$

"/* ──────────────────────────── Center the search ─────────────────────────── */
"" Eg. n-go to next item | zz - center to screen | zv - expand the foldsches to the middle of the screen
"" Eg. m- mark the current location | J - bring the below line up | `z - jump to the mark back so the cursor won't jump to the end of line when J is pressed
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"" create break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"/* ─────────────────────────────── Moving Text ────────────────────────────── */
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

"/* ───────────────────────────────── Splits ───────────────────────────────── */
noremap <Tab> <C-W>w
map \ <C-W>v<C-W>H<C-W><Right>
map <Bar> <C-W>s<C-W><Down>
set splitbelow "creates the new split on right
set splitright "creates the new split at bottom

"/* ─────────────────────────── moving between tabs ────────────────────────── */
noremap <leader><Tab> :tabn<CR>
noremap <leader>t :tabnew<CR>

"/* ──────────────────────── Fast saving and quitting ──────────────────────── */
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>e :q!<cr>

"/* ──────────────────── system clipboard coyping pasting ──────────────────── */
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"" :W sudo saves the file " (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7 "" Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu "" Turn on the Wild menu
set ruler "" Show the line and column number of the cursor position, separated by a comma.
set whichwrap+=<,>,h,l
set hid " A buffer becomes hidden when it is abandoned

set nocompatible "" make vim OK to not compatible with vi
set path+=** " activates subdirectory search. originally it searches current director

"" searching
set ignorecase "ignore the case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers

set lazyredraw "" Don't redraw while executing macros (good performance config)

"" highlight matching brackets
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

"" Mouse settings
set mouse=a
set mousemodel=popup

" Numbering
set number
set relativenumber

"" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Instead of failing a command because of unsaved changes, ask to save changed files
set confirm

set foldcolumn=1 "" Add a bit extra margin to the left
set magic " For regular expressions turn magic on
set cmdheight=2 "Set the command window height to 2 lines, to avoid cases of having to press <Enter> to continue

autocmd InsertEnter,InsertLeave * set cul!  "" Enables Cursorline when in insert mode
filetype plugin on " enables fuzzy finding plugin built-in to vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting
set ffs=unix,dos,mac " Use Unix as the standard file type
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)

"" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"" Linebreak on 500 characters
" set lbr
" set tw=500

"" Indenting
set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

"" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
"" => Visual mode related
""""""""""""""""""""""""""""""
"" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""
"" => Status line
""""""""""""""""""""""""""""""
"" Always show the status line
set laststatus=2

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" Shortcuts using <leader>
map <leader>sn ]s " go to next error
map <leader>sp [s " Go to previous Error
map <leader>sa zg " add to dictionary
map <leader>s? z= " Spelling Suggestions


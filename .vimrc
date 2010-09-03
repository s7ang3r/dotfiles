color oceandeep

map ^T :w!<CR>:!ispell check %<CR>:e! %<CR>

set autoindent
set wildmenu
set title
set autoread
set nocompatible
set hidden
set autoindent
set cindent
set smartindent
set history=400
set viminfo+=h
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set hlsearch
set ignorecase
set incsearch
set smartcase
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1
set spelllang=en,ru
set wcm=<Tab>
set mouse=a
set statusline=%{GitBranchInfoString()}%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2
set display+=lastline
set backspace=indent,eol,start
set ruler
set stal=1
set showcmd
set showmode
"set foldclose=all
"set foldmethod=syntax
set noequalalways
set wrap
set number
set showmatch
set winminheight=0
set winminwidth=0
set clipboard+=unnamed
set textwidth=80
set virtualedit=block
set scrolloff=5
set sidescroll=4
set sidescrolloff=10
set wildmode=longest,full
"For Python
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
let python_highlight_all = 1
set t_Co=256
autocmd FileType python set omnifunc=pythoncomplete

"Menu
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.utf-16 :e ++enc=utf16 <CR>
map <F8> :emenu Encoding.<TAB>

syntax on
filetype on
filetype plugin on
filetype indent on
set guifont=Terminus\ 10
"Tabs
:nmap <C-S-x> :tabprevious<cr>
:nmap <C-x> :tabnext<cr>
:map <C-S-x> :tabprevious<cr>
:map <C-x> :tabnext<cr>
:imap <C-S-x> <ESC>:tabprevious<cr>i
:imap <C-x> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
:map <C-w> :tabclose<cr>

"Autocompletion
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
else
return "\<c-p>"
endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t
set completeopt-=preview
set completeopt+=longest
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let g:snippetsEmu_key = "<C-j>"

"highlight SpellErrors  guibg=Red guifg=Black cterm=underline gui=underline term=reverse
"let spell_executable = "ispell"
"let spell_language_list = "russian"
nmap <F4> :w!<CR>:!ispell -d russian %<CR>:!ispell -d russian %<CR>:e! %<CR>
set background=dark
:inoremap <F5> <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>
"=====================
function! Pep8all()
  let oldGrepPrg=&grepprg
  let &grepprg='pep8 --filename="*py" .'
  execute "grep"
  let &grepprg=oldGrepPrg
  cw
endf
command! Pep8all call Pep8all()

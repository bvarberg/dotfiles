" Using thoughtbot/dotfiles vimrc as a base

" Leader
let mapleader = " "

" General
set backspace=2   " let backspace delete like normal
set ruler         " show the cursor position at all times
set history=50    " have the memory of someone who remembers 50 things
set scrolloff=1   " always show at least one line above or below cursor
set showcmd       " show incomplete commands
set incsearch     " display search matches on the fly
set laststatus=2  " always display the status line

" Line numbers
set number        " include line numbers"
set numberwidth=5 " width of the line number column
set relativenumber  " use relative line numbers

" Editor width indicators
set textwidth=80
set colorcolumn=+1

" Tabs & spaces
set tabstop=2     " tabs equivalent to 2 spaces
set shiftwidth=2  " see above...
set shiftround    " indention always a multiple of shiftwidth
set expandtab     " use spaces instead of tabs

" Display whitespace characters
set list listchars=tab:»·,trail:·,nbsp:·

" Open split panes to right and bottom
set splitbelow
set splitright

" Backup & swap files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" But actually, don't use this at all
set nobackup
set nowritebackup
set noswapfile

" Fuzzy file search
set path+=**
set wildmenu

" File directory
let g:netrw_liststyle=3

" Tab completion
" will insert tab at beginning of line and after space
" will use completion if not
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load plugin configurations, if available
if (filereadable(expand("~/vimrc.plugs")))
  source ~/.vimrc.plugs
endif

" Mappings
if filereadable(expand("~/.vimrc.mappings"))
  source ~/.vimrc.mappings
endif

" Local configuration
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


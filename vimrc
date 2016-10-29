" Using thoughtbot/dotfiles vimrc as a base

" Leader 
" --------
let mapleader = " "

" Bundles
" ---------
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Color scheme
" ---------------------
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme gotham

" General
" ---------
set backspace=2 	" let backspace delete like normal
set ruler       	" show the cursor position at all times
set showcmd       " show incomplete commands
set laststatus=2  " always display the status line
set history=50    " have the memory of someone who remembers 50 things
set scrolloff=1   " always show at least one line above or below cursor
set relativenumber  " use relative line numbers

" Backup & swap files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" But actually, don't use this at all
set nobackup
set nowritebackup
set noswapfile

" Tabs & spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab     " use spaces instead of tabstops
set autoindent    " try to indent for me on new lines

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Line numbers
set number
set numberwidth=5

" Open split panes to right and bottom
set splitbelow
set splitright

" Vim without plugins
" Fuzzy file search
" -------------------
set path+=**
set wildmenu

" File directory
" ----------------
let g:netrw_liststyle=3

" Mappings
" ----------

" For exploring the directory
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>v :Vexplore<CR>

" For switching (rotating) between splits
nnoremap <leader>w <C-w>w

" Local configuration
" ---------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


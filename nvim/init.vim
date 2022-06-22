" tab options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" sound
set noerrorbells

" line numbers
set relativenumber
set nu

" cursor to block
set guicursor=

" text wrap
set nowrap

" search
set nohlsearch
set smartcase
set ignorecase
set incsearch 

" history
set noswapfile
    " set nobackup
    " set undodir=~/.vim/undodir
    " set undofile

" navigation
set scrolloff=8

" err mesage space
set cmdheight=2

" info columns
set signcolumn=yes
set colorcolumn=80

" impoert plugins
call plug#begin()

Plug 'nvim-telescope/telescope.nvim'    " fuzzy finder
Plug 'gruvbox-community/gruvbox'        " gruvbox theme 
Plug 'tpope/vim-commentary'              " gcc and gc comments



" call plug#end()

" set theme
colorscheme gruvbox


" END

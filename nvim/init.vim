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
set mouse=a

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

" import plugins
call plug#begin('~/.vim/plugins')

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-telescope/telescope.nvim'    " fuzzy finder
Plug 'gruvbox-community/gruvbox'        " gruvbox theme 
Plug 'tpope/vim-commentary'             " gcc and gc comments

call plug#end()

" set scheme
colorscheme gruvbox

" remaps
let mapleader=" "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" END

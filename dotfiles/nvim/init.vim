call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'ntpeters/vim-better-whitespace'

Plug 'Mofiqul/vscode.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

" requires ripgrep and fd
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

call plug#end()

" -----------------------------------------------------------------------------
" Basic settings

" enable filetype detection
filetype on
" load file-specific plugins
filetype plugin on
" load file-specific indentation
filetype indent on

" do not expand tab to spaces
set noexpandtab
" how long each tabstop will appear
set tabstop=4
" amount of whitespace to be inserted/removed when the tab/backspace is pressed
set softtabstop=0
" governs indentation via >> and friends
set shiftwidth=4
set colorcolumn=88

" line endings
set fileformat=unix
" absolute line number
set number
" relative line number
set relativenumber
" encoding
set encoding=utf-8
" indendattion
set autoindent
" folding
set foldmethod=indent
set foldlevel=99
set nofoldenable
" syntax highlighting
syntax on
" show partial commands
set showcmd
" highlight search
set hlsearch
" allow opening buffer without saving current
set hidden

" netrw tree style listing
let g:netrw_liststyle = 3

" -----------------------------------------------------------------------------
" Shortcuts

let mapleader = ";"

" --- normal mode
" list and go to buffer
nnoremap gb :buffers<CR>:buffer<Space>
" delete buffer
nnoremap bd :bdelete<CR>
" replace inner word and do not update current register
nmap <silent> cp "_ciw<C-R>"<Esc>
" replace inner Word and do not update current register
nmap <silent> cP "_ciW<C-R>"<Esc>

" --- insert mode
" delete
inoremap <C-d> <Del>
" show omni completion
inoremap <C-Space> <C-x><C-o>


" --- command-line
" start of line
cnoremap <C-a> <Home>
" end of line
cnoremap <C-e> <End>
" back one character
cnoremap <C-b> <Left>
" forward one character
cnoremap <C-f> <Right>
" delete character under cursor
cnoremap <C-d> <Del>
" recall newer command-line
cnoremap <C-n> <Down>
" recall previous (older) command-line
cnoremap <C-p> <Up>
" back one word
cnoremap <M-b> <S-Left>
" forward one word
cnoremap <M-f> <S-Right>

" -----------------------------------------------------------------------------
" WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
nmap <F6> <Plug>(toggle-lsp-diag)

" -----------------------------------------------------------------------------
" ntpeters/vim-better-whitespace

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

" -----------------------------------------------------------------------------
" nvim-telescope/telescope.nvim
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" -----------------------------------------------------------------------------
" Lua

lua require("setup_colorscheme")
lua require("setup_statusline")
lua require("setup_lsp")

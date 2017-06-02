" Where to introduce all vim plugins
call plug#begin('~/vim/plugged')

" Plug 'itchyny/vim-haskell-indent'
Plug 'dag/vim2hs'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'takac/vim-hardtime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" Map <leader>
let mapleader = ","

" Rebind escape key
inoremap <C-Space> <Esc>
" Fixes issue where control space results in repeating most recent text
imap <Nul> <C-Space>
map  <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

" Increase Window Scroll
noremap <C-y> 3<C-y>
noremap <C-e> 3<C-e>

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
    else
        set rnu
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Folding
set foldmethod=syntax
set foldlevelstart=20
set foldlevel=1
" ==== Plugins ===

"" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"" vim-javascript

"" Execute HardTime at every buffer
let g:hardtime_default_on = 1

"" airline, a powerline replacement
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_solarized_bg='onedark'

"" Syntastic
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1

"" Colors and type------------------------------------------------------------
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h13

" vim-colors-solarized options
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback

syntax enable
" set background=dark
colorscheme onedark
if has('gui_running')
    set go-=T
endif

" === End ===

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

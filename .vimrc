" Where to introduce all vim plugins
call plug#begin('~/vim/plugged')

" Unused plugins
" Plug 'itchyny/vim-haskell-indent'

" Vim Helpers
Plug 'takac/vim-hardtime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-system-copy'
Plug 'heavenshell/vim-jsdoc'

" Prettify
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dag/vim2hs'
Plug 'jparise/vim-graphql'

" Linter
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'

" Core Functions
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'vimwiki/vimwiki'

" Core Themes
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

" 10ms timeout delay for mapping delays
set timeoutlen=1000 ttimeoutlen=0

" Toggle fold at current position
nnoremap <s-tab> za

" Repeat last macro
nnoremap <Enter> @@

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

" Delete current split without deleting pane
nmap <leader>bd ,bn
nnoremap <leader>bn :bn<bar>bd #<bar><cr>
nnoremap <leader>bp :bp<bar>bd #<bar><cr>

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

" Timeout for keys
set timeoutlen=1000 ttimeoutlen=0
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Copy and Paste form system clipboard
set clipboard=unnamed

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
" JsDoc
let g:jsdoc_enable_es6 = 1

" CtrlP
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \'PrtExit()': ['<esc>', '<c-g>', '<c-@>'],
    \'AcceptSelection("h")': ['<c-h>'],
    \'PrtCurLeft()': ['<left>', '<c-^>'],
    \'PrtClearCache()': ['<c-c>', '<F5>']
    \}

"" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '^'

"" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"" vim-javascript

"" Execute HardTime at every buffer
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 7

"" airline, a powerline replacement
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_solarized_bg='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"" Syntastic
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1

"" Colors and type------------------------------------------------------------
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline:h13

" vim-colors-solarized options
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback

" Ayu-vim
" let ayucolor="light"

syntax enable
set background=dark
colorscheme onedark 
if has('gui_running')
    set go-=T
endif

:" run commands
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === End ===

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

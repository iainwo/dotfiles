"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'drewtempelmeyer/palenight.vim'

" Plug 'sbdchd/neoformat' " need ot pip install yapf

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sbdchd/neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
colorscheme palenight
let g:airline_theme = "palenight"

" True colour
"if (has("nvim"))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
"if (has("termguicolors"))
"  set termguicolors
"endif

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2           "tabbing set to (4) spaces                              
set shiftwidth=2        "autoindent uses (4) spaces                             
set shiftround          "apply multiples of shiftwidth with '<' and '>'         
set autoindent          "apply indents automatically                            
set copyindent          "indent according to previous indentation               
set smarttab            "tab with shiftwidth, not tabstop, only if needed          
set expandtab

set ignorecase          "case-insensitive searching                             
set smartcase           "case-insensitive only when pattern all lowercase          
set incsearch           "show matches to search in real time                    

set history=1000        "preserve (1000) commands/search history                
set undolevels=1000     "preserve previous code, for undo                       

set wildignore=*.swp	"ignore these file extensions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" papercolor, minimalist, luna, base16
" let g:airline_theme='<theme>' " <theme> is a valid theme name

" let g:airline_theme='solarized'
" g:airline_solarized_bg='dark'


set encoding=utf8		"use UTF-8
set nowrap              "do not wrap lines                                      
set t_Co=256            " Use 256 colour terminal                               
set background=dark     "utilize colours which compliment a dark background        
set colorcolumn=80      "highlight the 80th column                              
let base16colorspace=256 "access colors present in 256 colorspace

"silent! colorscheme spacegray
"let g:spacegray_underline_search = 1
"let g:spacegray_italicize_comments = 1

set showmatch
syntax on

set hlsearch
set showmatch           "show complimenting parenthesis                         
set laststatus=2
set ruler               "display current row and column                         
set number              "display line numbers                                   

" set cursorline
set nocursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                
" Set 'action' keys!
let mapleader = ","     " LEADER Key                                            
nnoremap ; :                                                                    

" Disable up-down-left-right
let g:elite_mode=1
"map <up>    <nop>       " Unbind up arrow                                       
"map <down>  <nop>       " Unbind down arrow                                     
"map <left>  <nop>       " Unbind left arrow                                     
"map <right> <nop>       " Unbind right arrow                                    

" Re-map panel navigation                                                               
map <C-j> <C-w>j                            " Pane down                          
map <C-k> <C-w>k                            " Pane up                    
map <C-l> <C-w>l                            " Pane right                        
map <C-h> <C-w>h                            " Pane left                         

" Ctags 
map <Leader><t> <CTRL-]>

" tabbing blocks of text
vnoremap < <gv                                                                  
vnoremap > >gv                                                                  

" tab navigation                                                                
map <Leader>n <esc>:tabprevious<CR>                                             
map <Leader>m <esc>:tabnext<CR>                                                 

" resizing
if get(g:, 'elite_mode')
	nnoremap <Up>	:resize +2<CR>
	nnoremap <Down>	:resize -2<CR>
	nnoremap <Left>	:vertical resize +2<CR>
	nnoremap <Right>	:vertical resize -2<CR>
endif
                                                                            
nmap <silent> <Leader>/ :nohlsearch<CR>     " Clear search highlighting         


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>t :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree " Open NERDTree by default
"nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " auto close if only tab is nerdtree

let NERDTreeShowHidden=1 " show hidden files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
" set guifont=DroidSansMono\ Nerd\ Font\ 10

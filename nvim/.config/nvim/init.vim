filetype plugin indent on
syntax on
au FileType vim setlocal fo-=c fo-=r fo-=o
set formatoptions-=cro
set ic
set timeoutlen=1000 ttimeoutlen=10
set number
set mouse=a
set backspace=indent,eol,start
set hidden
set nocompatible              " be iMproved, required
set termguicolors
set tabstop=2
set shiftwidth=2
set clipboard+=unnamedplus

" Plugins
"-------------------------------

call plug#begin('~/.config/nvim/site/autoload/plug.vim')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'scrooloose/syntastic' " syntax checking
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'dense-analysis/ale' " syntax checking
Plug 'scrooloose/nerdtree' " side tree
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'fidian/hexmode'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'gioele/vim-autoswap' " vim swap file disable
Plug 'tell-k/vim-autopep8'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'  " auto close parentheses / quotes

call plug#end()

""" Functions
"-------------------------------

fun! StatusbarToggle()
	if &laststatus>0
		set laststatus=0
	else
		set laststatus=2
	endif
endfunction

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

""" Commands
"-------------------------------

command! Whitespace call TrimWhitespace()

""" Mappings
"-------------------------------

" Escape jj
:imap jj <Esc>
" Call Whitespace
:noremap <F5> :call TrimWhitespace()<CR>:<C-c>
" Toggle Nerdtree
nmap <F6> :NERDTreeToggle<CR>:<C-c>
" Toggle Airline
nmap <F7> :call StatusbarToggle()<CR>:<C-c>
" Hide syntastic
nmap <F8> :SyntasticToggleMode<CR>:<C-c>
" Toggle Goyo
nmap <F9> :Goyo<CR>:highlight Normal guibg=#161817<CR>:<C-c>

""" Plugin settings
"-------------------------------

""" Airline
let g:airline_theme='minimalist'

""" Colorschemes
colorscheme alduin
"colorscheme base16-ateliersavanna
"colorscheme Atelier_PlateauDark
highlight Normal guibg=#161817

""" Status bar
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

""" Autowap
let g:autoswap_detect_tmux = 1

""" UltiSnips
let g:UltiSnipsExpandTrigger="<ö>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

""" PEP8
""" g:python_pep8_indent_multiline_string
let g:autopep8_disable_show_diff=1

""" Prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

""" Ale
let g:ale_set_balloons = 1

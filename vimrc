" be iMproved, required
set nocompatible
"required
filetype on
filetype plugin on
filetype indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep plugin commands between vundle#begin/end.
" plugin on Github repoPlugin
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'


"All of your Plugins must be added before the following line
call vundle#end()

" settings
inoremap ff <esc>
inoremap nn <esc>f)a

syntax enable
syntax on
au BufRead,BufNewFile *.go set filetype=go
colorscheme solarized

set clipboard=unnamed

set number
set modifiable
set mouse=a
set ruler
set background=dark
set backspace=indent,eol,start

set encoding=utf-8
"set fileencoding=utf-8,gbk
set termencoding=utf-8
set cul

set incsearch
set hlsearch
set ignorecase

set shiftwidth=4
set tabstop=4
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2
set expandtab
set autoindent
set smartindent
"
"set foldmethod=indent
"au BufWinLeave * silent mkview
"au BufRead * silent loadview

"backup
set nobackup
set noswapfile

"
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)

    if getline('.')[col('.') - 1] == a:char

        return "\<Right>"

    else

        return a:char

    endif

endfunction

" nerdtree settings
let g:NERDTreeGlyphReadOnly = "RO"
""F2 can start or hide 
map <silent> <F2> :NERDTreeToggle<CR>
" auto close when close vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTree.isTabTree()) | q | endif
" open when vim
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
""let g:nerdtree_tabs_open_on_console_startup=1
" width
let NERDTreeWinSize=31
" show line no.
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1

"ack settings
:map <F4> :Ack -i

"syntastic settings
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_enable_highlighting = 0

let g:syntastic_enable_python_checker = 1
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_enable_ruby_checker = 1
let g:syntastic_ruby_checkers = ['rubocop']

""let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


"vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1 

"YouCompleteMe settings
" Go to definition else declaration
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 主动调用补全
let g:ycm_key_invoke_completion = '<C-a>'



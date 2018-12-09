"===============================================================================
"                               Section : Plugins                                
"===============================================================================

"----------------------------    Plugins install    ----------------------------

call plug#begin('~/.vim/plugged')

"Code completion
Plug 'Valloric/YouCompleteMe'

"Bottom line
Plug 'itchyny/lightline.vim'

" Cool color scheme
Plug 'morhetz/gruvbox'

" Twig plugin
Plug 'qbbr/vim-twig'

" match "", () etc
Plug 'tpope/vim-surround'

call plug#end()

" Plugins config

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0

runtime macros/matchit.vim

"===============================================================================
"                          Section : personnal maps
"===============================================================================

"-------------------------------    Mapleader    -------------------------------
let mapleader = "-"

"---------------------------    Usefull functions    ---------------------------

" Function which add a character c until the text of the line is centered
" The "center" is half of the limit number of characters
function! Center(c)
    exec 'norm ^d0'
    exec 'norm '.(&cc - 1 - strlen(getline('.')))/2.'I'.a:c
endfunction

" Function which add the c character until the limit number of characters is
" reached
function! FillLine(c)
    exec 'norm '.(&cc - 1 - strlen(getline('.'))).'A'.a:c
endfunction

" Function which add c character at the begining and the end of the line to
" center the text, after adding a margin number of spaces before and after:w
function! Embrace(c, margin)
    exec 'norm '.a:margin.'I '
    exec 'norm '.a:margin.'A '
    exec 'norm 0'.(&cc - 1 - strlen(getline('.')))/2.'i'.a:c
    call FillLine(a:c)
endfunction

"-----------------------------    Normal remaps    -----------------------------

" Quick access to vimrc
nnoremap <LEADER>ev :tab new ~/.vimrc <CR>

" Quick sourcing the vimrc
nnoremap <LEADER>sv :source ~/.vimrc <CR>

" Complete the line with - symbols
nnoremap <LEADER>- :call FillLine('-')<CR>

" Complete the line with # symbols
nnoremap <LEADER># :call FillLine('#')<CR>

" Complete the line with = symbols
nnoremap <LEADER>= :call FillLine('=')<CR>

" Complete the line with _ symbols
nnoremap <LEADER>_ :call FillLine('_')<CR>

" Center the current line
nnoremap <LEADER>c :call Center(' ')<CR>

" Add - around the current line with a margin of 4 spaces
nnoremap <LEADER>(b :call Embrace('-', 4)<CR>

" Add a blank line behind the current one
nnoremap <LEADER>o mao<ESC>0d$`a

" Add a blank line on top of the current one
nnoremap <LEADER>O maO<ESC>0d$`a

" Open the file explorator in new tab
nnoremap <C-t> :tab new \| :Explore <CR>

" Search center view
nnoremap N Nzz
nnoremap n nzz

" Remove arrow keys to take good habits!
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>

"-----------------------------    Insert remaps    -----------------------------

" Shortcut to print the filename, usefull for POO
inoremap <LEADER>fn <C-R>=expand("%:t:r")<CR>

"===============================================================================
"                               Section : Vim appearance
"===============================================================================

"--------------------------------    Colors    ---------------------------------
" Enabling 256 colors
set t_Co=256

" Colors theme
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set background=dark

" I love blue
hi Comment term=bold ctermfg=blue guifg=#80a0ff gui=bold

"--------------------------------    Others    ---------------------------------

" Remove the second bottom line, which become useless with the fancy one
set noshowmode
set laststatus=2

" Use aliases from bashrc
set shellcmdflag=-ic

"===============================================================================
"                              Section : Editor
"===============================================================================

" Syntax higlight
syntax on

" Indentation stuff
set softtabstop=4 shiftwidth=4 expandtab 

" Indentation
set cindent

" Line numbers
set number

" Colon at 80 chars
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray guibg=darkgrey
set textwidth=0

" Show first occurence when search
set incsearch

" Usefull to know where the cursor is
set cursorline
"===============================================================================
"                              Section : Others
"===============================================================================

" Vi no compatible
set nocompatible

" Directory tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"Enabling :E shortcut by removing useless :ELP
let g:loaded_logipat = 1

" Commands autocomplete like bash
set wildmode=longest,list 
set wildmenu

" remove dellay when go back to normal mode
set ttimeoutlen=10

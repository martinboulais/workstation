set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'taketwo/vim-ros'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers = {
    \   'roslaunch' : ['="', '$(', '/'],
    \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
    \ }
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

set nu

" Search
set incsearch

" Leader
let mapleader="-"

" Rapid access to .vimrc
nnoremap <LEADER>ev :tab new $MYVIMRC<CR>
nnoremap <LEADER>sv :so $MYVIMRC<CR>

"Changing style, to camelStyle, underscore_separated, FULL_CAPS
"TODO Find a good solution :-D

inoremap <LEADER>fn <C-R>=expand("%:t:r")<CR>

" Indentation
set cindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"Colors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark
hi Comment term=bold ctermfg=blue guifg=#80a0ff gui=bold
set cursorline

" Fancy bar at the bottom
set laststatus=2
set noshowmode

" Vertical limit
hi ColorColumn ctermbg=darkGray guibg=darkGray
set colorcolumn=81
" No auto line break
:set textwidth=0

" Use .bashrc
set shellcmdflag=-ic

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

nnoremap <C-t> :tab new \| :Explore <CR>

" Remove the ELP command to able :E shorcut
let g:loaded_logipat = 1

" Commands autocomplete
set wildmode=longest,list 
set wildmenu

" remove dellay when go back to normal mode
set ttimeoutlen=10

"Propre au projet ros en cours, nécessite cdcm
nnoremap <F5> :wa \| :!cdcm <CR>

" Some abbreviations
ia @@ martin.boulais@itk-engineering.de
ia imain int main(int argc, char ** argv)<CR>{<CR>}<ESC>kA

" Fulfill the current line with a char, usefull for documentation
function! Append(c)
    exec 'norm '.(&cc - 1 - strlen(getline('.'))).'A'.a:c
endfunction
nnoremap <Leader>- :call Append('-')<CR>
nnoremap <Leader># :call Append('#')<CR>
nnoremap <Leader>= :call Append('=')<CR>
nnoremap <Leader>_ :call Append('_')<CR>

"source ~/.vim/scripts/c.vimrc
" Temporary unable arrow keys

noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>


"vundle                                                                                                                                       
set nocompatible "关闭与vi的兼容模式
filetype off
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
                                     
" Plugin begin ================
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
                              
Plugin 'VundleVim/Vundle.vim'
                            
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
                            
" All of your Plugins must be added before the following line
" Plugin end ================ 
                            
call vundle#end()
                
filetype plugin indent on    " enables filetype detection
                
 
let mapleader = ";"
                
nnoremap <leader>w :w<Esc>
nnoremap <leader>q :q<Esc>
                
inoremap <leader>w <Esc>:w<Esc>
inoremap <leader>q <Esc>:q<Esc>

set cursorline
set cursorcolumn
 
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

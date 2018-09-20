" Vundle plugin                                                                                                                                       
" Keep Plugin commands between vundle#begin/end.
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" gruvbox theme
Plugin 'morhetz/gruvbox'

" vim-airline 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" file system explorer 
Plugin 'scrooloose/nerdtree'

" Comment functions 
Plugin 'scrooloose/nerdcommenter'

" Indent  
Plugin 'nathanaelkane/vim-indent-guides'

"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" add home dir to vim run time path
set runtimepath+=~/.vim

colorscheme gruvbox

" Setting dark mode
set background=dark
" Setting light mode
"set background=light   

set encoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double

set ts=4
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4

set guifont=Monospace/18

"map = I/* ^[A */
"map - 0xxx$xxxj

" show the line number
set nu

" show the current line
set cursorline

" no backup when override
set nobackup


" ============== map keys setting

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
" nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
" nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
" nmap <Leader>M %

" 基于缩进或语法进行代码折叠
" set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
" set nofoldenable



" ==== config vim javascript pluggin ====
"let g:javascript_plugin_jsdoc = 1

" ==== config vim jsx pluggin ====
"let g:jsx_ext_required = 0 

" ==== config nerdtree pluggin ====
nmap <F5> :NERDTreeToggle<cr>

" ==== config index-guides pluggin ====
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

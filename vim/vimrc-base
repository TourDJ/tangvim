" ============================ Vundle plugin
  2 " Keep Plugin commands between vundle#begin/end.
  3 " Brief help
  4 " :PluginList       - lists configured plugins
  5 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  6 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  7 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  8 "
  9 " see :h vundle for more details or wiki for FAQ
 10 " Put your non-Plugin stuff after this line
 11 set nocompatible              " be iMproved, required
 12 filetype off                  " required
 13                                                                                                                                                   
 14 " set the runtime path to include Vundle and initialize
 15 set rtp+=~/.vim/bundle/Vundle.vim
 16 call vundle#begin()
 17 " alternatively, pass a path where Vundle should install plugins
 18 "call vundle#begin('~/some/path/here')
 19 
 20 
 21 " let Vundle manage Vundle, required
 22 Plugin 'VundleVim/Vundle.vim'
 23 
 24 " gruvbox theme
 25 Plugin 'morhetz/gruvbox'
 26 
 27 " vim-airline 
 28 Plugin 'vim-airline/vim-airline'
 29 Plugin 'vim-airline/vim-airline-themes'
 30 
 31 " file system explorer 
 32 Plugin 'scrooloose/nerdtree'
                                                                                                                                                   
 34 " Comment functions 
 35 Plugin 'scrooloose/nerdcommenter'
 36 
 37 " Indent  
 38 Plugin 'nathanaelkane/vim-indent-guides'
 39 
 40 "Plug 'pangloss/vim-javascript'
 41 "Plug 'mxw/vim-jsx'
 42 
 43 " All of your Plugins must be added before the following line
 44 call vundle#end()            " required
 45 filetype plugin indent on    " required
 46 " To ignore plugin indent changes, instead use:
 47 "filetype plugin on
 48 
 49 
 50 " ============================ basic command
 51 "
 52 " set vim theme
 53 colorscheme gruvbox
 54 
 55 " ============================ set command
 56 " add home dir to vim run time path
 57 set runtimepath+=~/.vim
 58 
 59 " Setting dark mode
 60 set background=dark    
 61 " Setting light mode
 62 "set background=light   
 63 
 64 set encoding=utf-8
 65 set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
 67 set ambiwidth=double
 68 
 69 set ts=4
 70 set expandtab
 71 set autoindent
 72 set softtabstop=4
 73 set shiftwidth=4
 74 
 75 set guifont=Monospace/18
 76 
 77 "map = I/* ^[A */
 78 "map - 0xxx$xxxj
 79 
 80 " show the line number
 81 set nu
 82 
 83 " show the current line
 84 set cursorline
 85 
 86 " no backup when override
 87 set nobackup
 88 
 89 
 90 " ============================ map keys setting
 91 
 92 " 定义快捷键的前缀，即<Leader>
 93 let mapleader=";"
 94 
 95 " 定义快捷键到行首和行尾
 96 nmap LB 0
 97 nmap LE $        
  99 " 设置快捷键将选中文本块复制至系统剪贴板
100 vnoremap <Leader>y "+y
101 " 设置快捷键将系统剪贴板内容粘贴至 vim
102 nmap <Leader>p "+p
103 " 定义快捷键关闭当前分割窗口
104 nmap <Leader>q :q<CR>
105 " 定义快捷键保存当前窗口内容
106 nmap <Leader>w :w<CR>
107 " 定义快捷键保存所有窗口内容并退出 vim
108 nmap <Leader>WQ :wa<CR>:q<CR>
109 " 不做任何保存，直接退出 vim
110 nmap <Leader>Q :qa!<CR>
111 " 依次遍历子窗口
112 " nnoremap nw <C-W><C-W>
113 " 跳转至右方的窗口
114 " nnoremap <Leader>lw <C-W>l
115 " 跳转至左方的窗口
116 " nnoremap <Leader>hw <C-W>h
117 " 跳转至上方的子窗口
118 " nnoremap <Leader>kw <C-W>k
119 " 跳转至下方的子窗口
120 " nnoremap <Leader>jw <C-W>j
121 " 定义快捷键在结对符之间跳转
122 " nmap <Leader>M %
123 
124 " 基于缩进或语法进行代码折叠
125 " set foldmethod=indent
126 " set foldmethod=syntax
127 " 启动 vim 时关闭折叠代码
128 " set nofoldenable
130 
131 
132 " ==== config vim javascript pluggin ====
133 "let g:javascript_plugin_jsdoc = 1
134 
135 " ==== config vim jsx pluggin ====
136 "let g:jsx_ext_required = 0 
137 
138 " ==== config nerdtree pluggin ====
139 nmap <F5> :NERDTreeToggle<cr>
140 
141 " ==== config index-guides pluggin ====
142 " 随 vim 自启动
143 let g:indent_guides_enable_on_vim_startup=1
144 " 从第二层开始可视化显示缩进
145 let g:indent_guides_start_level=2
146 " 色块宽度
147 let g:indent_guides_guide_size=1
148 " 快捷键 i 开/关缩进可视化
149 :nmap <silent> <Leader>i <Plug>IndentGuidesToggle
150 

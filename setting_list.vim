

" ///////////////////////////////////////// vim 常用设置参数 ///////////////////////////////////////// 

""""""""""
" 基本
""""""""""
set nu(mber)        "显示行号
set nocompatible    "关闭与vi的兼容模式
set nowrap          "不自动折行
set nobackup        "不需要备份
set confirm         "没有保存或文件只读时弹出确认
set mouse=a         "鼠标可用
set showmatch       "显示匹配的括号
set scrolloff=3     "距离顶部和底部3行
set shortmess=atI   "启动时隐去援助提示


""""""""""
" 缩进
""""""""""
" 指定我们在插入模式下输入一个制表符占据的空格数量，linux 内核编码规范建议是 8。
set tabstop=4       "指定在进行缩进格式化源码时制表符占据的空格数。
set shiftwidth=4    "如何处理连续多个空格。   
set softtabstop=4   "是否将tab转换为空格。
set expandtab       "tab替换为空格键
set smarttab        
set autoread        "文件自动检测外部更改
set cindent         "c文件自动缩进
set autoindent      "自动对齐
set smartindent     "智能缩进

 
""""""""""
" 高亮 
""""""""""
set hlsearch            "高亮查找匹配
set hlsearch incsearch  "hlsearch 让Vim高亮文件中所有匹配项，incsearch 则令Vim在你正打着搜索内容时就高亮下一个匹配项
syntax on               "语法高亮

 
""""""""""
" 折叠 
""""""""""
set nofoldenable        "启动 vim 时关闭折叠代码
set foldenable          "允许折叠    
set fdm=syntax          "基于语法进行代码折叠
set fdm=manual          "手动折叠
set foldmethod=indent   "基于缩进进行代码折叠

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>  
"在 .vimrc 文件中配置好后，用以下命令操作：       
"  * za 打开或关闭当前折叠
"  * zM 关闭所有折叠
"  * zR 打开所有折叠



set background=dark "背景色
set ruler           "显示标尺，就是在右下角显示光标位置
set novisualbell    "不要闪烁
set laststatus=2    "启动显示状态行
set showcmd         "显示输入的命令

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul


"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/


""""""""""
" 粘贴 
""""""""""
" paste：粘贴模式，会取消所有上述选项的影响来保证后面的操作。
" 通常是从剪贴板粘贴代码——保持原有代码的风格，使用 nopaste 取消设置。
set paste
set nopaste




"im 常用设置参数

    "显示行号
    set nu

    "启动时隐去援助提示
    set shortmess=atI


    "使用vim的键盘模式
    "set nocompatible

    "不需要备份
    set nobackup

    "没有保存或文件只读时弹出确认
    set confirm

    "鼠标可用
    set mouse=a     
    
    "指定我们在插入模式下输入一个制表符占据的空格数量，linux 内核编码规范建议是 8。
    set tabstop=4
    "指定在进行缩进格式化源码时制表符占据的空格数。
    set shiftwidth=4
    "如何处理连续多个空格。   
    set softtabstop=4
    "是否将tab转换为空格。
    set expandtab
    set smarttab

    "文件自动检测外部更改
    set autoread

    "c文件自动缩进
    set cindent

    "自动对齐
    set autoindent

    "智能缩进
    set smartindent

* 高亮    

        set hlsearch
        高亮查找匹配

        set hlsearch incsearch
        hlsearch 让Vim高亮文件中所有匹配项，incsearch 则令Vim在你正打着搜索内容时就高亮下一个匹配项

        syntax on
        语法高亮

* a

    "背景色
    set background=dark

    "显示匹配
    set showmatch

    "显示标尺，就是在右下角显示光标位置
    set ruler

* 折叠

        "允许折叠
        set foldenable

        "根据语法折叠
        set fdm=syntax

        "手动折叠
        "set fdm=manual

        "设置键盘映射，通过空格设置折叠
        nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>


    "不要闪烁
    set novisualbell

    "启动显示状态行
    set laststatus=2

    "浅色显示当前行
    autocmd InsertLeave * se nocul

    "用浅色高亮当前行
    autocmd InsertEnter * se cul

    "显示输入的命令
    set showcmd

    "被分割窗口之间显示空白
    set fillchars=vert:/

    set fillchars=stl:/

    set fillchars=stlnc:/

paste：粘贴模式，会取消所有上述选项的影响来保证后面的操作。通常是从剪贴板粘贴代码——保持原有代码的风格，使用 nopaste 取消设置。

     :set paste
     :set nopaste


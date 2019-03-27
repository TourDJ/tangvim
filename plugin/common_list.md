
### Vim 插件最佳体验

* Tree directory

[NERD Tree](https://github.com/scrooloose/nerdtree)是一个树形目录插件，方便浏览当前目录有哪些目录和文件。   

常用快捷键来操作目录：

    通过hjkl来移动光标
    o打开关闭文件或目录，如果想打开文件，必须光标移动到文件名
    t在标签页中打开
    s和i可以水平或纵向分割窗口打开文件
    p到上层目录
    P到根目录
    K到同目录第一个节点
    P到同目录最后一个节点??

* Theme

[vim-airline](https://github.com/vim-airline/vim-airline) light status tabline     

* Indent

[Indent Guides](https://github.com/nathanaelkane/vim-indent-guides) 多层缩进    
安装好后作以下配置

     " 随 vim 自启动
     let g:indent_guides_enable_on_vim_startup=1
     " 从第二层开始可视化显示缩进
     let g:indent_guides_start_level=2
     " 色块宽度
     let g:indent_guides_guide_size=1
     " 快捷键 i 开/关缩进可视化
     :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

* Comment

[nerdcommenter](https://github.com/scrooloose/nerdcommenter)注释插件
默认配置了一些快捷键

     <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
     <leader>cu，取消选中文本块的注释

* Syntax, autocompletion

[UltiSnips](https://github.com/sirver/ultisnips): The ultimate snippet solution for Vim.

[SnipMate](https://github.com/garbas/vim-snipmate): aims to provide support for textual snippets, similar to TextMate or other Vim plugins like UltiSnips.

[jedi](https://github.com/davidhalter/jedi-vim):  autocompletion library for VIM.


* Git

[vimagit](https://github.com/jreybert/vimagit): Easy git workflow




# Vim
Playgound for vim's hobbyist. Here record vim's install, config and use. 

## vim 安装配置

在任意系统中，在Vim中执行

    :echo $MYVIMRC
命令可以快速得知这个文件的位置和名称。文件的路径会在屏幕的底部显示。

[vim 的基本配置](https://github.com/TourDJ/tangvim/blob/master/tang.vim)     




***

## vim 使用说明
   
  - [vim 概述](#summary)  
    - [vim 历史](#history)   
  - [vim 模式](https://github.com/TourDJ/tangvim/blob/master/doc/mode.md#mode)   
  - [vim 缓冲区](https://github.com/TourDJ/tangvim/blob/master/doc/buffer.md#buffer)    
  - [vim 配置](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#config)      
    - [选项](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#option)    
    - [折叠类型](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#fold)    
  - [vim 命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd)      
    - [启动 Vim](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#startvim)    
    - [文件命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_file)    
        - [打开文件](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#openfile)     
        - [基本文件操作](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#basefile)     
        - [插入另一个文件的全部内容](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#insertall)      
        - [插入另一个文件的部分内容](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#insertparts)      
    - [插入命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_insert)     
    - [移动命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_move)      
    - [删除命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_delete)     
    - [拷贝和粘贴](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_yank)   
    - [跳转命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_jump)     
    - [撤销和重做](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_undo)      
    - [退出命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_exit)    
    - [替换](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_replace)        
    - [注释](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_comment)      
    - [批量缩进](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_indent)     
    - [其他](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_other)  
  - [模式行（modeline）](https://github.com/TourDJ/tangvim/blob/master/doc/modeline.md#modeline)   
  - [vim 寄存器](https://github.com/TourDJ/tangvim/blob/master/doc/register.md#register)
  - [键盘映射](https://github.com/TourDJ/tangvim/blob/master/doc/key-mapping.md#mapping)  
    - [Leader](https://github.com/TourDJ/tangvim/blob/master/doc/key-mapping.md#leader)    
    - [遮盖](https://github.com/TourDJ/tangvim/blob/master/doc/key-mapping.md#override)   
    - [常用映射](https://github.com/TourDJ/tangvim/blob/master/doc/key-mapping.md#cusmapping)     
  - [自动命令](https://github.com/TourDJ/tangvim/blob/master/doc/autocmd.md#autocmd)    
    - [FileType事件](https://github.com/TourDJ/tangvim/blob/master/doc/autocmd.md#filetype)   
    - [自动命令组](https://github.com/TourDJ/tangvim/blob/master/doc/autocmd.md#augroup)    
  - [Operator-Pending映射](https://github.com/TourDJ/tangvim/blob/master/doc/operator-pending-mapping.md#operator)  
    - [Movement映射](https://github.com/TourDJ/tangvim/blob/master/doc/operator-pending-mapping.md#movement)     
    - [改变开始位置](https://github.com/TourDJ/tangvim/blob/master/doc/operator-pending-mapping.md#chgloc)   
    - [一般规则](https://github.com/TourDJ/tangvim/blob/master/doc/operator-pending-mapping.md#cusprin)     
    - [复杂 Operator-Pending 映射](https://github.com/TourDJ/tangvim/blob/master/doc/operator-pending-mapping.md#moreop)      
  - [Abbreviations](https://github.com/TourDJ/tangvim/blob/master/doc/abbreviations.md#abbrev) 
    - [Keyword Characters](https://github.com/TourDJ/tangvim/blob/master/doc/abbreviations.md#keyword)    
  - [vim 插件](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#plugin)       
    - [插件管理工具](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#plugintool)     
    - [基本配置方式](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#pluginconfig)    
  - [vim 主题](https://github.com/TourDJ/tangvim/blob/master/doc/theme.md#theme)    
    - [自定义主题](https://github.com/TourDJ/tangvim/blob/master/doc/theme.md#definetheme)         
  - [vimscript](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#vimscript)     
    - [关键字](https://github.com/TourDJ/tangvim/blob/master/doc/keyword.md#keyword)    
        - [定制关键字](https://github.com/TourDJ/tangvim/blob/master/doc/keyword.md#commonkeyword)     
        - [自定义关键字](https://github.com/TourDJ/tangvim/blob/master/doc/keyword.md#definekeyword)    
        - [关键字注释](https://github.com/TourDJ/tangvim/blob/master/doc/keyword.md#keywordcomment)    
        - [在 Vim 创建外部脚本语言](https://github.com/TourDJ/tangvim/blob/master/doc/keyword.md#otherlang)    
    - [变量](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#varli)   
    - [条件语句](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#condition)     
    - [函数](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#function)      
    - [数据类型](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#datatype)   
    - [列表](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#list)     
    - [循环](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#loop)    
    - [字典](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#dict)    
    - [函数式编程](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#functional)   
    - [vimscript 命令](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#script)       
    - [路径](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#path)   
  - [其他](#other)  
  - [vim 文档](#doc)       
***

# <a id="vim">vim 使用</a>
*本文整理自网络。

## <a id="summary">vim 概述</a>    
在 Linux 的系統中使用文字编辑器来编辑你的 Linux 参数配置文件，是最平常不过的事情了，常常听到的就有： [emacs](http://www.gnu.org/software/emacs/), [pico](https://en.wikipedia.org/wiki/Pico_(text_editor)), [nano](http://sourceforge.net/projects/nano/), [joe](http://sourceforge.net/projects/joe-editor/), 与 [vim](http://www.vim.org) 等等。这些编辑器有什么区别呢？     

* [常见文件编辑器比较](http://encyclopedia.thefreedictionary.com/Listz+of+text+editors)   

* [维基百科的文本编辑器比较](http://en.wikipedia.org/wiki/Comparison_of_text_editors)    

vi 是古老的文本编辑器，vim是从 vi 发展出来的一个文本编辑器，和Emacs 并列成为类Unix系统 用户最喜欢的编辑器。作为开源世界最重要的编辑器之一，Vim 以其强大的功能和可定制能力被众多开发者所喜爱。因为太强大，所以要用好不容易。

### <a id="history">vim 历史</a>

摘自维基百科
> Vim的第一个版本由Bram Moolenaar 在1991年发布。最初的简称是Vi IMitation ，随着功能的不断增加，正式名称改成了Vi IMproved。现在是在开放源代码 方式下发行的自由软件 。

> Bram Moolenaar 在 80 年代末购入他的 Amiga 计算机时，Amiga 上还没有他最常用的编辑器 vi。Bram 从一个开源的 vi 复制 Stevie 开始，开发了 Vim 的 1.0 版本。最初的目标只是完全复制 vi 的功能，那个时候的 Vim 是Vi IMitation（模拟）的简称。1991 年 Vim 1.14 版被 "Fred Fish Disk #591" 这个 Amiga 用的免费软体集所收录了。1992 年 1.22 版本的 Vim 被移植到了 UNIX 和 MS-DOS 上。从那个时候开始，Vim 的全名就变成 Vi IMproved（改良）了。

> 在这之后，Vim 加入了不计其数的新功能。做为第一个里程碑的是 1994 年的 3.0 版本加入了多视窗编辑模式（分割视窗）。从那之后，同一萤幕可以显示的 Vim 编辑文件数可以不止一个了。1996 年发布的 Vim 4.0 是第一个利用图型介面（GUI ）的版本。1998 年 5.0 版本的 Vim 加入了 highlight（语法高亮 ）功能。2001 年的 Vim 6.0 版本加入了代码折叠 、插件 、 多国语言支持、垂直分割视窗等功能。2006 年 5 月发布的 Vim 7.0 版更加入了拼字检查、上下文相关补全，标签页编辑等新功能。现在最新的版本是 2008 年 8 月发布的 Vim 7.2，该版本合并了 vim 7.1 以来的所有修正补丁，并且加入了脚本的浮点数支持。


Vim 和 TextMate 有很多不同，你常常会遇到它不让你输入，让你抓狂。Vim 有很多不同的模式，在不同的模式下，不同的按键有不同的功能。更让人崩溃的是，大写和小写的功能也天差地别。所以看看：

* [迁移到 Vim 的10个难关](http://blog.jobbole.com/18333/)    

***
  
## <a id="other">其他</a> 
### <a id="vim8">vim7 升级 vim8</a>

安装依赖

     yum install libXt-devel gtk2-devel
     yum -y install python-devel ruby ruby-devel perl perl-devel perl-ExtUtils-Embed
     yum install ncurses-devel
     yum install ctags

下载源码并编译安装

     ./configure --disable-selinux --enable-perlinterp=yes --enable-python3interp=yes --enable-rubyinterp=yes --enable-cscope --enable-gui=auto --with-features=huge --enable-multibyte --enable-xim --with-x --with-gnome --with-compiledby="tang" --prefix=/usr/local/vim8
     make
     make install
     
#### ubuntu 安装 vim

    sudo apt install vim


ppa源来安装

    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim

如果您想要卸载它, 请使用如下命令

    sudo apt remove vim
    sudo add-apt-repository --remove ppa:jonathonf/vim


***

## <a id="doc">vim 文档</a>

* [vim cookbook](http://www.oualline.com/vim-cook.html#last)     
* [vim doc](http://vimcdoc.sourceforge.net/doc/quickref.html)    

*** 



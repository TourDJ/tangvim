
## vim 使用说明
   
  - [vim 概述](./summary.md)  
  - [vim 模式](https://github.com/TourDJ/tangvim/blob/master/doc/mode.md#mode)   
  - [vim 缓冲区](https://github.com/TourDJ/tangvim/blob/master/doc/buffer.md#buffer)    
  - [vim 配置](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#config)      
    - [选项](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#option)    
    - [折叠类型](https://github.com/TourDJ/tangvim/blob/master/doc/config.md#fold)    
  - [vim 命令](./command.md)      
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
  - [其他](./others.md)     
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
* [Vim Cheat Sheet](https://vim.rtorr.com/)        

*** 

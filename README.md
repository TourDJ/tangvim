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
  - [vim 模式](#mode)   
  - [vim 缓冲区](#buffer)    
  - [vim 配置](#config)      
    - [选项](#option)    
    - [折叠类型](#fold)    
  - [vim 命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd)      
    - [文件命令](https://github.com/TourDJ/tangvim/blob/master/doc/command.md#vimcmd_file)      
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
  - [模式行（modeline）](#modeline)   
  - [vim 寄存器](#register)
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
  - [Abbreviations](#abbrev) 
    - [Keyword Characters](#keyword)    
  - [vim 插件](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#plugin)       
    - [插件管理工具](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#plugintool)     
    - [基本配置方式](https://github.com/TourDJ/tangvim/blob/master/doc/plugin.md#pluginconfig)    
  - [vim 主题](https://github.com/TourDJ/tangvim/blob/master/doc/theme.md#theme)    
    - [自定义主题](https://github.com/TourDJ/tangvim/blob/master/doc/theme.md#definetheme)         
  - [vimscript](https://github.com/TourDJ/tangvim/blob/master/doc/vimscript.md#vimscript)   
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

## <a id="mode">vim 模式</a>
vim 是一个多模式的编辑器。初学者进入 vim 时，根本不知道怎么使用，很可能甚至不知道该怎么退出它，vim 中的快捷键跟我们平时使用的完全不一样。在我使用 vim 初期，常用的模式就三个：正常模式、插入模式和命令模式，所以就一直认为 vim 就只有三种模式，实际上，vim 的模式有 12 种之多，但常用的就几种，详情可查看 vim 的帮助文档：

     :help vim-modes

 * 正常模式(normal-mode)        
     正常模式一般用于浏览文件，也包括一些复制、粘贴、删除等操作。这时通过[vim 命令](#vimcmd)操作时，一般的键/键组合会被当成功能键，而不会键入对应的字符。初始打开 vim 就是正常模式，在其他模式下，按 ESC 键(有时需要按两下）就可回到正常模式。
 
 * 命令模式(command-mode)    
     在正常模式中，按下:（冒号）键，会进入命令模式。
 
 * 插入模式(insert-mode)      
     在正常模式中按下i, I, a, A等键，会进入插入模式。插入模式下可以向文件中添加内容。
 
 * 可视模式(visual-mode)     
     在正常模式按下v(普通选中), V(按行选中), <Ctrl>+v(按列选中)，可以进入可视模式。
 
 * 选择模式(select mode)
     在可视模式下按 <Ctrl>+g 进入。
 
 * 替换模式(replace-mode)    
     在正常模式按下R(shift+r)开启，此时光标所在的内容会被新输入内容替换。
 
 * 终端模式(Ex mode)   
     在正常模式按下gQ开启 REPL。
     > REPL: 读取-求值-输出”循环（英语：Read-Eval-Print Loop，简称REPL）是一个简单的，交互式的编程环境。

这里只列出了部分模式。

所以，Vim的学习曲线相当的大，如果你一开始看到的是一大堆VIM的命令分类，你一定会对这个编辑器失去兴趣的。因此建议一开始先熟悉一些常用的命令。

* [简明Vim练级攻略](http://blog.jobbole.com/18339/)    

稍微有点熟悉之后，可以渐进式的系统学习。

**vim 相关文档**      

当你发现你对 vim 还是挺感兴趣的，此时可以系统地学习下 vim 的入门知识，可以看看鸟哥的这篇介绍：

* [鳥哥的 Linux 私房菜 -- 第九章、vim 程式編輯器](http://linux.vbird.org/linux_basic/0310vi.php#tips_code)    

挺不错的，讲得还是比较详细，概念也解释的比较清楚。

之后，比较深入一点的，看这篇介绍，包括中英文版。

* [Vim galore](https://github.com/mhinz/vim-galore)    

* [Vim galore 中文](https://github.com/wsdjeg/vim-galore-zh_cn)   

vim 编辑器很强大，而他的强大之处其中一方面是有种类繁多的快捷键，通过快捷键可以进入各种模式，实现各种操作。这些快捷键我们不可能都一一记住，通常，我们只在记住一些常用的罢了。不过好在有专门的 vim 犍位图，需要的时候可以查一下也是挺方便的。

* [史上最全Vim快捷键键位图 -- 入门到进阶](http://cenalulu.github.io/linux/all-vim-cheatsheat/)     

那么，为什么 Vim 使用 HJKL 键作为方向键呢？

* [为什么 Vim 使用 HJKL 键作为方向键](http://blog.jobbole.com/18650/)    

*** 

## <a id="buffer">vim 缓冲区</a>
关于 vim 的 buffer（缓冲区）、window（窗口） 和 tab（标签），查看帮助文件，是这样描述的：

     缓冲区是内存中的文件文本。
     窗口是缓冲区的视窗。
     标签页是窗口的集合

在 vim 中，可以将 buffer 看成是打开文件的实例。一个文件只有一个 buffer。
* 查看 buffer 的命令：

         :ls 
显示：

           1 %a   ".vimrc"                       line 20
           2   =  ".viminfo"                     line 30
           3 # =  "/etc/vimrc"                   line 71
左侧是buffer的编号，有%的表示是当前激活的window中打开的buffer，a表示这个buffer是active的，双引号中的字符串表示了buffer对应的文件名字，line n表示当前cursor处于该buffer的哪一行，# 代表的是编辑前一次编辑的文档。

* 使用:buffer(:b)命令切换buffer

        :b 2
* 将当前缓冲区写入文件命令

        :write

window 可以看成是 buffer 的 viewport。一个 buffer 可以有多个 window。在不同的window中编辑同一个文件的buffer，并且在一个window中对文件进行编辑，修改会同步体现在另外的window中。

分割窗口的命令：

     :sp（水平分割）
     :vsp（垂直分割）

在window之间切换可以使用Ctrl + w + h/j/k/l（向左、下、上、右切换）或者Ctrl + w + w（在窗口间切换）。    
如果要调整window的大小，分窗口是水平分隔还是垂直分隔两种情况： 
     * 如果是水平分隔可以使用:nwinc +/-把当前激活窗口高度增加、减少n个字符高度，比如:10winc + 
     * 如果是垂直分隔可以使用:nwinc >/<把当前激活窗口宽度增加、减少n个字符宽度，比如:5winc >

tab 是 window 的集合，tab的标题栏会显示该tab当前激活的window中文件的名字，及tab中一共有多少个window。。在新的 tab 中打开文件:

     :tabe app.js
     
查看 tab 列表：

     ：tabs
     Tab page 1
         react01.html
         circle.js
         app.js
     Tab page 2
     >   app.js     
'>' 表示cursor当前在tab 2的app.js上，使用1gt即可快速切换到tab 1。   
在 tab 间切换命令：

     :tabnext
     :tabpre
     gt
     gT
可以使用:tabc命令关闭当前tab。

* [Buffers, windows, and tabs](https://sanctum.geek.nz/arabesque/buffers-windows-tabs/)   

****

## <a id="config">vim 配置</a>
vim 的全局配置文件是： /etc/vimrc，用户的配置文件为 ~/.vimrc， 如果不存在，就手动创建一个，平常我们只需配置这个文件就可以了。 配置完成后想要立刻生效，执行以下命令：
    
    :source ~/.vimrc
> 注意命令前面的冒号，是在vim的命令模式下执行的，不是在linux命令行下执行。

### <a id="option">选项</a>
vim 主要有两种选项：布尔选项（值为"on"或"off"）和键值选项。      
配置方法。

    :set <name>打开选项、
    :set no<name>关闭选项

* 添加一个!（感叹号）至布尔选项后面就会切换对于选项的值。

          :set number!

* 使用一个?符号向Vim获取一个选项的当前值。

          :set number
          :set number?
          :set nonumber
          :set number?

有些选项可以基于缓冲区进行设置。例如：

    :setlocal wrap
不是所有的选项都可以使用setlocal进行设置。如果你想知道某个特定的选项是否可以设置为本地选项，执行:help查看它的帮助文档。

### <a id="fold">折叠类型</a>
Vim支持六种不同的决定如何折叠你的文本的折叠类型。

* Manual      
你手动创建折叠并且折叠将被Vim储存在内存中。 当你关闭Vim时，它们也将一并烟消云散，而下次你编辑文件时将不得不重新创建。在你把它跟一些自定义的创建折叠的映射结合起来时，这种方式会很方便。 

* Marker     
Vim基于特定的字符组合折叠你的代码。这些字符通常放置于注释中(比如// {{{)， 不过在有些语言里，你可以使用该语言自己的语法代替，比如javascript的{和}。纯粹为了你的编辑器，用注释割裂你的代码看上去有点丑，但好处是你可以定制特定的折叠。 如果你想以特定的方式组织一个大文件，这个类型将是非常棒的选择。

* Diff     
在diff文件时使用该特定的折叠类型。我们不会讨论它，因为Vim会自动使用它。

* Expr     
这让你可以用自定义的Vimscript来决定折叠的位置。它是最为强大的方式，不过也需要最繁重的工作。 下一章我们将讲到它。

* Indent     
Vim使用你的代码的缩进来折叠。同样缩进等级的代码折叠到一块，空行则被折叠到周围的行一起去。

* syntax      
基于语法进行折叠。

***

***

## <a id="modeline">模式行（modeline）</a>
vim 的 modeline 可以让你针对每个文件进行文件级别的设置，这些设置是覆盖当前用户的 vimrc 中的设置的。当 vim 打开一个包含了vim modeline 注释行的文件时，会自动读取这一行的参数配置并调整自己的设置到这个配置。vim 默认关闭modeline，开启的话需要在你的home下的.vimrc文件中增加一行：

     set modeline

在文件的首行/尾行（必须），写一行当前这个文件里面语言所支持的注释，例如写shell就是#，写Python就是#，写php就//或/\*\*/，然后在里面加上 modeline 识别的固定格式，举例：

     # vim: set expandtab ts=4 sts=4 sw=4 : 

上面的注释中，'#'后面、"vim:"前面的空格是必须的，结尾的':'也是必须的，这些是modeline所识别的。中间就是熟悉的vimrc中的设置了。在不同的语言中，注释的语法也不一样，所有在其他语言中可能有不同写法。

在文件里面，可以用该文件标准的注解形式向 vim 下指令。譬如一个 reStructuredText 格式的文字档，你可以加上以下的 modeline，让 vim 在读它的时候自动把档案解释为 rst (以取得正确的语法高亮)：

     .. vim: set ft=rst:
modeline 里可以放的指令不限一个，所以我.py 档案在档尾都有这麽一行的 modeline

     # vim: set ai et nu sw=4 ts=4 tw=79:

### 执行外部命令
执行外部命令的方法

     :!命令
把外部命令执行的结果插入到当前编辑的缓冲区中

     :r!命令
对所有的非空行进行编号，只需要

     :%!nl

对包含空行的所有行进行编号

     :%!nl -ba



***

## <a id="register">vim 寄存器</a>
通过下面命令显示所有寄存器内容：

:reg
其中注意两个特殊的寄存器：”* 和 “+。这两个寄存器是和系统相通的，前者关联系统选择缓冲区，后者关联系统剪切板。通过它们可以和其他程序进行数据交换。
若寄存器列表里无”* 或 “+ 寄存器，则可能是由于没有安装vim的图形界面所致。Debian/Ubuntu下可以通过安装vim-gnome解决。

    $ sudo apt-get install vim-gnome

**晋级**         
[Vim 使用进阶：10 种寄存器剖析](http://www.codebelief.com/article/2017/03/vim-advanced-usage-10-registers-analysis/)    
[Vim 复制粘贴探秘](http://www.cnblogs.com/jianyungsun/archive/2011/03/19/1988855.html)   

### [vim 复制](http://www.cnblogs.com/hustcat/articles/1791371.html)        
* vim 常用的粘贴板有"、0、1、2、3、4、5、6、7、8、9、-、.、:、%、/，用 :reg 命令可以查看各个粘贴板里的内容；
* 在vim中简单用y只是复制到“（双引号)和0粘贴板里，同样用p粘贴的也是这个粘贴板里的内容；
* 要将vim的内容复制到某个粘贴板，需要退出编辑模式，进入正常模式后，选择要复制的内容，然后按"Ny（注意带引号）完成复制，其中N为粘贴板号(注意是按一下双引号然后按粘贴板号最后按y)，例如要把内容复制到粘贴板2，选中内容后按"2y就可以了。
> 有两点需要说明一下：    
    1， “号粘贴板（临时粘贴板）比较特殊，直接按y就复制到这个粘贴板中了，直接按p就粘贴这个粘贴板中的内容；      
    2， +号粘贴板是系统粘贴板，用"+y将内容复制到该粘贴板后可以使用Ctrl＋V将其粘贴到其他文档（如firefox、gedit）中，同理，要把在其他地方用Ctrl＋C或右键复制的内容复制到vim中，需要在正常模式下按"+p；

***

***


***

*** 

***

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

***

## <a id="doc">vim 文档</a>

* [vim cookbook](http://www.oualline.com/vim-cook.html#last)     
* [vim doc](http://vimcdoc.sourceforge.net/doc/quickref.html)    

*** 



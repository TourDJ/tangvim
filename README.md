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
  - [键盘映射](#mapping)  
    - [Leader](#leader)    
    - [遮盖](#override)   
    - [常用映射](#cusmapping)     
  - [自动命令](#autocmd)    
    - [FileType事件](#filetype)   
    - [自动命令组](#augroup)    
  - [Operator-Pending映射](#operator)  
    - [Movement映射](#movement)     
    - [改变开始位置](#chgloc)   
    - [一般规则](#cusprin)     
    - [复杂 Operator-Pending 映射](#moreop)      
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


## <a id="autocmd">自动命令</a>
自动命令可以让Vim自动执行某些指定的命令，这些指定的命令会在某些事件发生的时候执行。
我们先看一个例子。

使用:edit foo打开一个新文件，然后立即使用:quit关闭。查看你的硬盘，你会发现这个文件并不存在。这是因为在你第一次保存这个文件之前，Vim实际上并没有真正创建它。

我们对Vim做一些改变，使得Vim可以在你开始编辑文件的时候就创建它们。执行下面的命令：

    :autocmd BufNewFile * :write

**自动命令结构**     

    :autocmd BufNewFile * :write
             ^          ^ ^
             |          | |
             |          | 要执行的命令
             |          |
             |          用于事件过滤的“模式（pattern）”
             |
             要监听的“事件”
这个命令的第一部分是我们想监听的事件的类型。Vim提供了很多可以监听的事件。这些事件包括：
* 开始编辑一个当前并不存在的文件。
* 读取一个文件，不管这个文件是否存在。
* 改变一个缓冲区的filetype设置。
* 在某段时间内不按下键盘上面的某个按键。
* 进入插入模式。
* 退出插入模式。

模式指明了格式，如*.txt。则只对后缀为.txt的文件有效。     
例如:

    :autocmd BufWritePre \*.html :normal gg=G

**多个事件**    
你可以创建一个绑定多个事件的自动命令，这些事件使用逗号分隔开。执行下面的命令：

    :autocmd BufWritePre,BufRead *.html :normal gg=G
在Vim脚本编程中有一个不成文的规定，你应该同时使用BufRead和BufNewFile

    :autocmd BufNewFile,BufRead *.html setlocal nowrap
该命令会使得无论你在什么时候编辑HTML文件自动换行都会被关闭。

### <a id="filetype">FileType事件</a>
最有用的事件是FileType事件。这个事件会在Vim设置一个缓冲区的filetype的时候触发。

让我们针对不同文件类型设置一些有用的映射。运行命令：

    :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    :autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
打开一个Javascript文件（后缀为.js的文件）,将光标移动到某一行，敲击<localleader>c，光标所在的那一行会被注释掉。
打开一个Python文件（后缀为.py的文件）,将光标移动到某一行，敲击<localleader>c，同样的那一行会被注释掉，不同的是此时所用的是Python的注释字符！

> 输入 <code>:help autocmd-events</code> 查看自动命令可以绑定的所有事件。

### <a id="augroup">自动命令组</a>
可以将相关的自动命令收集起来放到一个已命名的组（groups）中。当你多次使用augroup的时候，Vim每次都会组合那些组。而不会替换之前的组。

如果你想清除一个组，你可以把autocmd!这个命令包含在组里面。执行下面的命令：

    :augroup testgroup
    :    autocmd!
    :    autocmd BufWrite * :echom "Cats"
    :augroup END


***

## <a id="operator">Operator-Pending映射</a>
一个Operator（操作）就是一个命令，你可以在这个命令的后面输入一个Movement（移动）命令，然后Vim开始对文本执行前面的操作命令，这个操作命令会从你当前所在的位置开始执行，一直到这个移动命令会把你带到的位置结束。

常用到的Operator有d，y和c。例如：

    按键   操作       移动
    ----   --------   -------------
    dw     删除       到下一个单词
    ci(    修改       在括号内
    yt,    复制       到逗号
### <a id="movement">Movement映射</a>
Vim允许你创建任何新的movements，这些movements可以跟所有命令一起工作。执行下面的命令：

    :onoremap p i(
在缓冲区中输入下面的文字：

    return person.get_pets(type="cat", fluffy_only=True)
把光标放到单词“cat”上，然后敲击dp。结果会发生什么？Vim会删除括号内的所有文字。你可以把这个新建的movements当作“参数”。

onoremap命令会告诉Vim当它在等待一个要附加在operator后面的movement的时候，如果这个movement是p的话，它会把它当作i(。所以当我们在运行dp的时候，就象是在对Vim说“delete parameters”，而Vim会把它理解为“在括号内删除”。

敲击cp，Vim会删除括号中的所有文字，不过这一次删除之后Vim会处于插入模式，这是因为你使用的是“change”，而不是“delete”。

再看一个示例。执行下面的命令：

    :onoremap b /return<cr>
现在把下面的文字输入到缓冲区：

    def count(i):
        i += 1
        print i

        return foo
把光标放到第二行的i上，然后按下db。会发生生么？Vim把整个函数体中直到return上面的内容都删除了，return就是上面的映射使用Vim的通用查找得到的结果。

当你想搞清楚怎么定义一个新的operator-pending movement的时候，你可以从下面几个步骤来思考：

1. 在光标所在的位置开始。
2. 进入可视模式(charwise)。
3. ... 把映射的按键放到这里 ...
4. 所有你想包含在movement中的文字都会被选中。     

你所要做的工作就是在第三步中填上合适的按键。

### <a id="chgloc">改变开始位置</a>
你可能已经从上面所学的东西中意识到一个了问题。如果我们定义的movements都是从光标所在的位置开始的话，那么这就会限制我们做一些我们想使用movement来做的事情。

但是Vim并不会限制你去做你想做的事情，所以对于这个问题肯定有解决办法。执行下面的命令：

    :onoremap in( :<c-u>normal! f(vi(<cr>
这个命令看起来有些复杂，不过我们还是先试试它能干什么。将下面的文字输入缓冲区：

    print foo(bar)
把光标放到单词print上面，然后敲击cin(。Vim会删除括号内的内容然后进入插入模式，并且光标会停留在括号的中间。

你可以将这个映射理解为“在下一个括号内(inside next parentheses)”。它会对当前行光标所在位置的下一个括号内的文本执行operator。

我们再创建一个“在上一个括号内(inside last parentheses)”的movement进行对照。（在这里使用“前一个(previous)“可能更准确，但这会覆盖“段落(paragraph)”movement）

    :onoremap il( :<c-u>normal! F)vi(<cr>
先试试确保这个命令可以工作。

那么这些映射是怎么工作的呢？首先，<c-u>比较特殊，可以先不用管（你只需要相信我这个东西可以让这个映射在任何情况下都能正常工作）。如果我们删除它的话，这个映射会变成这个样子：

    :normal! F)vi(<cr>
<code>:normal!</code>会在后面的章节谈到，现在你只需要知道它可以在常用模式下模拟按下按键。例如，运行 `:normal! dddd`会删除两行，就像按下dddd。映射后面的<code><cr></code>是用来执行<code>:normal!</code>命令的。

那么现在我们可以认为这个映射的关键是运行下面这些按键组成的命令：

    F)vi(
这个命令很容易理解：

* F): 向后移动到最近的)字符。
* vi(: 进入可视模式选择括号内的所有内容。
这个movement结束在在可视模式下选择中我们想操作的文本，然后Vim会对选中的文本执行操作，就像通常情况一样。

### <a id="cusprin">一般规则</a>
下面两条规则可以让你可以很直观的以多种方式创建operator-pending映射：

* 如果你的operator-pending映射以在可视模式下选中文本结束，Vim会操作这些文本。
* 否则，Vim会操作从光标的原始位置到一个新位置之间的文本。

### <a id="moreop">复杂 Operator-Pending 映射</a>
看一个复杂的映射命令：

    :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

* :normal命令的后面会跟着一串字符，无论这些字符表示什么含义，:normal命令都会执行它们
* :execute命令后面会跟着一个Vim脚本字符串，然后把这个字符串当作一个命令执行。之所以要使用execute是由于normal!不能识别“特殊字符”。当execute碰到任何你想让它执行的字符串的时候。它会先替换这个字符串中的所有特殊字符。

> 如果我们按照上面的分析替换这个映射中的特殊字符，然后就可以搞清楚这个映射会怎么执行：

    :normal! ?^==\+$<cr>:nohlsearch<cr>kvg_
                    ^^^^           ^^^^
                     ||             ||
    这里的<cr>实际上是一个回车符，而不是由4个字符——“左尖括号”，“c“，”r“和“右尖括号”组成的字符串。
* 我们以回车符对这些字符进行拆分，然后看看它们是怎么执行的：

        ?^==\+$
        :nohlsearch
        kvg_
    1. 第一部分?^==\+$会向后搜索任何由两个或多个等号组成的行，这些行不会包含除等号外的任何其他字符。这个命令执行后会让光标停留在符合搜索条件的行的行首。
    2. 第二部分是:nohlsearch命令。这个命令只是简单的清除之前的搜索结果的高亮显示，防止这些高亮显示分散我们的注意。
    3. 最后一部分是三个常用模式下的命令的序列：
        * k：向上移动一行。第一部分已经将光标定位到了等号符号组成的行的第一个字符，所以执行这个命令后光标就会被定位到标题的第一个字符上。
        * v：进入可视模式(characterwise)。
        * g_：移动到当前行的最后一个非空字符上。这里没有使用$，是因为$会选中换行符号，这不是我们所想要的。

看另一个命令：

    :onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
其他的部分都是一模一样的，所以我们现在从将光标定位到等号组成的行的第一个字符的那个部分开始进行讲解：

* g_：移动到当前行（译注：等号组成的行）的最后一个非空字符。
* v：进入可视模式(characterwise)。
* k：向上移动一行。这会将光标移动到包含标题文字的行上。
* 0：移动到这一行（译注：标题行）的第一个字符。
这一系列命令的执行结果就是在可视模式下同时选中标题的文字和等号组成的行，然后Vim会在这两行上执行相应的操作。   

查看更多命令

    :help omap-info
    :help normal。
    :help execute。
    :help expr-quote了解你可以在字符串中使用的转义序列。


#### 分组    
使用Vim的代码折叠功能实现分组功能。在你的~/.vimrc文件中添加下面几行：

    " Vimscript file settings ---------------------- {{{
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
    " }}}
现在在显示~/.vimrc文件的窗口中执行`:setlocal foldmethod=marker`。如果你不执行这个命令，你会发现加载~/.vimrc文件后没什么效果。

切换到常用模式，将光标放到这些文字中的任意一行，然后敲击za。Vim会折叠从包含{{{的行到包含}}}的行之间的所有行。再敲击za会展开所有这些行。


***

## <a id="abbrev">Abbreviations</a>
与映射有点类似，但是它用于insert、replace和 command模式。这个特性灵活且强大。

例如：

    :iabbrev adn and
进入insert模式并输入：

    One adn two.
在输入adn之后输入空格键，Vim会将其替换为and。

### <a id="keyword">Keyword Characters</a>
紧跟一个abbreviation输入"non-keyword character"后Vim会替换那个abbreviation。 "non-keyword character"指那些不在iskeyword选项中的字符。运行命令：

    :set iskeyword?
你将看到类似于iskeyword=@,48-57,\_,192-255的结果。
这个格式很复杂，但本质上 "keyword characters"包含一下几种：

    下划线字符 (_).
    所有字母字符，包括大小写。
    ASCII值在48到57之间的字符（数字0-9）。
    ASCII值在192到255之间的字符（一些特殊ASCII字符）。
输入:help isfname 查看详情

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



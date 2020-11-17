
## <a id="buffer">vim 缓冲区</a>
关于 vim 的 buffer（缓冲区）、window（窗口） 和 tab（标签），查看帮助文件，是这样描述的：

     缓冲区是内存中的文件文本。
     窗口是缓冲区的视窗。
     标签页是窗口的集合

### buffer
在 vim 中，可以将 buffer 看成是打开文件的实例。一个文件只有一个 buffer。

#### 查看 buffer 的命令：

     :ls 
显示：

      1 %a   ".vimrc"                       line 20
      2   =  ".viminfo"                     line 30
      3 # =  "/etc/vimrc"                   line 71
左侧是buffer的编号，有%的表示是当前激活的window中打开的buffer，a表示这个buffer是active的，双引号中的字符串表示了buffer对应的文件名字，line n表示当前cursor处于该buffer的哪一行，# 代表的是编辑前一次编辑的文档。

###### 切换下一个缓冲区，显示下一个文件的内容

     :bn

###### 切换上一个缓冲区，显示上一个文件的内容

     :bp 

###### 使用:buffer(:b)命令切换buffer

     :b 2
###### 将当前缓冲区写入文件命令

     :write

### window
window 可以看成是 buffer 的 viewport。一个 buffer 可以有多个 window。在不同的window中编辑同一个文件的buffer，并且在一个window中对文件进行编辑，修改会同步体现在另外的window中。

分割窗口的命令：

     :sp（水平分割）
     :vsp（垂直分割）

在window之间切换可以使用Ctrl + w + h/j/k/l（向左、下、上、右切换）或者Ctrl + w + w（在窗口间切换）。    
如果要调整window的大小，分窗口是水平分隔还是垂直分隔两种情况： 
     * 如果是水平分隔可以使用:nwinc +/-把当前激活窗口高度增加、减少n个字符高度，比如:10winc + 
     * 如果是垂直分隔可以使用:nwinc >/<把当前激活窗口宽度增加、减少n个字符宽度，比如:5winc >

### tab
tab 是 window 的集合，tab的标题栏会显示该tab当前激活的window中文件的名字，及tab中一共有多少个window。。在新的 tab 中打开文件:

    :tabe app.js

创建 tab

    :tabnew  web

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

    :tabnext(:tabn)
    :tabpre(:tabp)
    gt
    gT
     
关闭当前tab

    :tabc

### mark
使用 vim 在我们的文件上打上一个标记，方便我们快速的跳到这个位置。

创建标记

     ma
> m 是创建标记的关键字，a-zA-Z 是创建标记的名字，小写字母用来创建单个文件的标记，大些字母用来创建文件之间的标记。

> 小写字母通常用来在单个文件中作标记，大写字母通常是用来在文件间作标记。

激活标记

使用 '（单引号） 或者 \` (反引号) ，紧接着按下当初标记的那个字母就会跳到当初标记的那个位置。

例如 ：

     `a 和 'a
* 'a 是跳转到当初标记的行首
* \`a 是跳转到当初标记的时候光标所在的位置

列出所有的标记

     :marks

删除标记

     :delmarks  a
也可以一次删除多个标记，例如

     :delmarks a b c d

删除所有的标记（删除所有小写字母的标记）

     :delmarks!


### 参考资料
* [Buffers, windows, and tabs](https://sanctum.geek.nz/arabesque/buffers-windows-tabs/)        
* [精通 vim 你应该理解的几个名词](https://zhuanlan.zhihu.com/p/96801314)      
    

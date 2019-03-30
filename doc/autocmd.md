
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



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

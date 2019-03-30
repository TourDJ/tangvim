
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


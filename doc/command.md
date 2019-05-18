  - [vim 命令](#vimcmd)      
    - [启动 Vim](#startvim)    
    - [文件命令](#vimcmd_file)    
        - [打开文件](#openfile)     
        - [基本文件操作](#basefile)     
        - [插入另一个文件的全部内容](#insertall)      
        - [插入另一个文件的部分内容](#insertparts)      
    - [移动命令](#vimcmd_move)      
        - [基本移动命令](#vimcmd_move_base)      
        - [移动到行首行尾](#vimcmd_move_end)      
        - [翻屏](#vimcmd_move_screen)      
        - [标记](#vimcmd_move_mark)    
    - [插入命令](#vimcmd_insert)     
        - [基本插入](#vimcmd_insert_base)      
        - [改写插入](#vimcmd_insert_replace)     
    - [删除命令](#vimcmd_delete)     
    - [拷贝和粘贴](#vimcmd_yank)     
    - [文本对象](#vimcmd_text)     
    - [跳转命令](#vimcmd_jump)     
    - [撤销和重做](#vimcmd_undo)      
    - [退出命令](#vimcmd_exit)    
    - [替换](#vimcmd_replace)        
    - [注释](#vimcmd_comment)      
    - [批量缩进](#vimcmd_indent)     
    - [其他](#vimcmd_other)  

## <a id="vimcmd"><font color="red">Vim 命令</font></a>
我们常说的命令通常是指在正常模式下的操作。

> 以:和/开头的命令都有历史纪录，按上下箭头来选择某个历史命令。

### <a id="startvim">启动 Vim</a>

    vim -c cmd file                         在打开文件前，先执行指定的命令。例如：vim -c "set nonu" file1
    vim -r                                  列出交换文件并退出。
    vim -r file                             恢复崩溃的会话。                 
    vim -R file                             只读模式，可以强制保存。
    vim -m file                             不可修改(写入文件)。
    vim -M file                             文本不可修改。    
    vim -y file                             容易模式。
    vim + file                              启动后跳到文件末尾。
    vim +lnum file                          启动后跳到第 <lnum> 行。
    vim +/string file                       打开file，并将光标停留在第一个找到的string行上。

### <a id="vimcmd_file">文件命令</a>
#### <a id="openfle">1. 打开文件</a>

    vim file                                打开单个文件
    vim file1 file2 file3 ...               同时打开多个文件
    
#### <a id="basefile">2. 基本文件操作</a>

    :open file                              在vim窗口中打开一个新文件
    :split file                             在水平分割的窗口中打开文件
    :vsplit file                            在垂直分割的窗口中打开文件
    :e file                                 关闭当前编辑的文件，并开启新的文件，如果对当前文件的修改未保存，vi会警告。
    :e! file                                放弃对当前文件的修改，编辑新的文件
    :e + file                               开始新的文件，并从文件尾开始编辑。
    :e +n file                              开始新的文件，并从文件第n行开始编辑。
    :e new                                  编译一个未命名的新文档。(<ctrl-w> + n)
    :e                                      重新加载当前文档。
    :e!                                     重新加载当前文档，并丢弃已做的改动。
    :e#(ctrl+^)                             回到刚才编辑的文件。
    :f(ctrl+g)                              显示文档名、是否修改和光标位置。
    :f filename                             改变编辑的文件名，这时保存相当于另存为。
    :n1,n2w filename                        将n1到n2的内容保存到 filename 文件中。
    :saveas newfilename                     另存为到文件 newfilename 中。
    :args                                   查看当前打开的文件列表，当前正在编辑的文件会用[]括起来。
    :e ftp://192.168.10.76/abc.txt          打开远程文件。
    :bn 切换到下一个文件
    :bp 切换到上一个文件
    :Sex                                    水平分割一个窗口，浏览文件系统。
    :Vex                                    垂直分割一个窗口，浏览文件系统。
    
    gf                                      打开以光标所在字符串为文件名的文件。
       
#### <a id="insertall">3. 插入另一个文件的全部内容</a>
打开文件b.txt，将光标定位到要复制插入的位置，然后进入命令模式中输入：
    
    :r!cat a.txt
    :r filename                             在当前位置插入另一个文件的内容。
    :[n]r filename                          在第n行插入另一个文件的内容

#### <a id="insertparts">4. 插入另一个文件的部分内容</a>
打开一个文件a.txt,复制n+1行:
    
    "ayn+1
然后敲命令转到文件b.txt:
        
    :ex b.txt

敲命令:
        
    "ap

***

### <a id="vimcmd_move">移动命令</a>

#### 基本移动命令

    h(退格)                                  左移一个字符
    l(空格)                                  右移一个字符
    k                                       上移一个字符
    j                                       下移一个字符
    gj                                      移动到一段内的下一行
    gk                                      移动到一段内的上一行
    +(Enter)                                把光标移至下一行第一个非空白字符
    -                                       把光标移至上一行第一个非空白字符
    w(W)                                    向前移动一个单词, 光标停在单词首部
    e(E)                                    向前移动一个单词, 光标停在单词尾部
    b(B)                                    向后移动一个单词, 光标停在单词首部
    ge(gE)                                  向后移动一个单词, 光标停在单词尾部
    (                                       前移1句
    )                                       后移1句
    {                                       前移1段
    }                                       后移1段
    fx                                      把光标移到同一行的下一个x字符处(x代表任意数字字母)
    Fx                                      把光标移到同一行的上一个x字符处(同上)
    tx                                      把光标移到同一行的下一个x字符前(同上)
    Tx                                      把光标移到同一行的上一个x字符后(同上)
    ;                                       配合f & t使用，重复一次, 按下fx之后再按
    ,                                       配合f & t使用，反向重复一次    
    
> 在Vim中，很多命令都可以配合数字使用，比如删除10个字符10x，在当前位置后插入3个！，3a！<Esc>，这里的Esc是必须的，否则命令不生效, 3fd将找到第三个为d的字符。

#### 移动到行首行尾    
    
    0                                       移动到本行第一个字符上
    <HOME>                                  移动到本行第一个字符。同0健。
    ^                                       移动到本行第一个非空白字符上
    go(g0?)                                 移到光标所在屏幕行行首
    $                                       移动到行尾 
    3$                                      移动到下面3行的行尾    
    gg                                      移动到文件头
    G(]])                                   移动到文件尾
    nG                                      到文件第n行
    H                                       把光标移到屏幕最顶端一行
    M                                       把光标移到屏幕中间一行
    L                                       把光标移到屏幕最底端一行
    :n                                      跳到指定行   

#### 翻屏

    Ctrl + e                                向下滚动一行
    Ctrl + y                                向上滚动一行
    Ctrl + d                                向下滚动半屏
    Ctrl + u                                向上滚动半屏
    Ctrl + f                                向下滚动一屏
    Ctrl + b                                向上滚动一屏
    n%                                      到文件n%的位置

#### 标记

    m{a-z}                                  标记光标所在位置，局部标记，只用于当前文件。
    m{A-Z}                                  标记光标所在位置，全局标记。
    `{a-z}                                  移动到标记位置。
    '{a-z}                                  移动到标记行的行首。
    `{0-9}                                  回到上[2-10]次关闭vim时最后离开的位置。
    ``                                      移动到上次编辑的位置。
    `"                                      移动到上次离开的地方。
    `.                                      移动到最后改动的地方。
    :marks                                  显示所有标记
    :delmarks a b                           删除标记a和b
    :delmarks a-c                           删除标记a、b和c
    :delmarks a c-f                         删除标记a、c、d、e、f
    :delmarks!                              删除当前缓冲区的所有标记
    Ctrl+o                                  后退
    Ctrl+i                                  前进

***

### <a id="vimcmd_insert">插入命令</a>

#### 基本插入

    i                                       在当前位置前插入
    a                                       在当前位置后插入
    I                                       在当前行首插入(非空字符)
    A                                       在当前行尾插入
    o                                       在当前行之后插入一行
    O                                       在当前行之前插入一行
    gI                                      在当前行第一列插入

> 小技巧：按8，再按i，进入插入模式，输入=， 按esc进入命令模式，就会出现8个=。

#### 改写插入

    c[n]w                                   改写光标后1(n)个词。
    c[n]l                                   改写光标后1(n)个字母。
    c[n]h                                   改写光标前1(n)个字母。
    [n]cc                                   修改当前[n]行。
    [n]s                                    以输入的文本替代光标之后1(n)个字符，相当于c[n]l。
    [n]S                                    删除指定数目的行，并以所输入文本代替之

### <a id="vimcmd_delete">删除命令</a>

    [n]x                                    删除当前光标右边n个字符,相当于d[n]l
    [n]X                                    删除当前字符左边n个字符,相当于d[n]h   
    d                                       删除
    D(d$)                                   删除当前字符至行尾。
    d0                                      删除（剪切）当前位置到行首的内容
    d[n]w                                   删除（剪切）1(n)个单词
    d[n]l                                   删除（剪切）光标右边1(n)个字符
    d[n]h                                   删除（剪切）光标左边1(n)个字符
    [n]dd                                   删除1(n)行
    :m,nd                                   删除m行到n行的内容
    dj                                      删除本行及下一行
    dk                                      删除本行及上一行      
    d1G(dgg)                                删除光标以上的所有行。
    dG                                      删除光标以下的所有行
    kdgg                                    删除当前行之前所有行（不包括当前行）
    jdG                                     删除当前行之后所有行（不包括当前行）
    daw                                     删除一个词
    das                                     删除一个句子，即使光标不在词首和句首也没关系。
    d/f                                     组合命令，它将删除当前位置到下一个f之间的内容。
    :11,$d                                  删除11行及以后所有的行
    :1,$d                                   删除所有行
    J                                       删除两行之间的空行，实际上是合并两行。
    ggdG(:%d)                               删除文件中所有

### <a id="vimcmd_yank">拷贝和粘贴</a>

    y                                       复制
    yy(Y)                                   拷贝当前行
    nyy                                     拷贝当前后开始的n行，比如2yy拷贝当前行及其下一行。
    m,ny                                    复制m行到n行的内容
    y[n]w                                   复制1(n)个词。
    y[n]l                                   复制光标右边1(n)个字符。
    y[n]h                                   复制光标左边1(n)个字符。
    y^(y0)                                  复制至行首，不含游标所在处字元。 
    y$                                      复制至行尾。含游标所在处字元。  
    y1G                                     复制至档首。
    yG(ygg)                                 复制至档尾。 
    yaw                                     复制一个词
    yas                                     复制一个句子，即使光标不在词首和句首也没关系。       
    "14yl                                   从光标处开始复制光标后的 4 个字符。（"110yl 后面10个字符，指定粘贴板为"1 引号不能少）
    "14yh                                   从光标处开始复制光标前的 4 个字符。
    "1v                                     进入visual方式，然后就可以移动方向键选中文本，然后按y，就拷贝完成至指定粘贴板
    p                                       在当前光标后粘贴,如果之前使用了yy命令来复制一行，那么就在当前行的下一行粘贴。
    P                                       在光标之前粘贴
    ]p                                      类似于p, 但它会自动调整缩进以匹配光标所在的行
    :1,10 co 20                             将1-10行拷贝到第20行之后。
    :1,$ co $                               将整个文件复制一份并添加到文件尾部。
    ddp                                     交换当前行和其下一行
    xp                                      交换当前字符和其后一个字符

> 正常模式下按v（逐字）或V（逐行）进入可视模式，然后用jklh命令移动即可选择某些行或字符，再按y即可复制

### <a id="vimcmd_text">文本对象</a>

    aw                                      一个词
    as                                      一句。
    ap                                      一段。
    ab                                      一块（包含在圆括号中的）
文本对象可以跟在 y, d, c, v 。

例如，将光标移动到一段代码开头，按下 `yas`， 则会复制这一句代码，其他文本对象用法类似。

## <a id="vimcmd_jump">跳转命令</a>

    Ctrl + O                                跳转到光标的上次位置
    Ctrl + I                                跳转到光标的下次位置
    %                                       跳转到与之匹配的括号处
    .                                       重复上次的修改命令
    `.                                      跳转到最近修改过的位置
    [[                                      跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
    gD                                      跳转到局部变量的定义处
    ''(两个')                                跳转到光标上次停靠的地方

### <a id="vimcmd_undo">撤销和重做</a>

    u                                       撤销（Undo）
    U                                       撤销对整行的操作
    Ctrl + r                                重做（Redo），即撤销的撤销。

## <a id="vimcmd_exit">退出命令</a>

    :wq                                     保存并退出
    :x                                      同 :wq
    :q!                                     强制退出并忽略所有更改
    :e!                                     放弃所有修改，并打开原来文件
    ZQ                                      无条件退出
    ZZ                                      存盘退出


### <a id="vimcmd_replace">替换</a>

    guw                                     光标下的单词变转换为小写
    guW                                     光标下的整行单词转换为小写
    gUw                                     光标下的单词转换为大写
    gUW                                     光标下的整行单词转换为大写
    :s/vivian/sky/                          替换当前行第一个 vivian 为 sky
    :s/vivian/sky/g                         替换当前行所有 vivian 为 sky
    :n,$s/vivian/sky/                       替换第 n 行开始到最后一行中每一行的第一个 vivian 为 sky
    :n,$s/vivian/sky/g                      替换第 n 行开始到最后一行中每一行所有 vivian 为 sky
> vi/vim 中可以使用 :s 命令来替换字符串
> n 为数字，若 n 为 .，表示从当前行开始到最后一行

    :%s/vivian/sky/（同:g/vivian/s//sky/）   替换每一行的第一个 vivian 为 sky
    :%s/vivian/sky/g（同:g/vivian/s//sky/g） 替换每一行中所有 vivian 为 sky

可以使用 # 作为分隔符，此时中间出现的 / 不会作为分隔符

    :s#vivian/#sky/#                        替换当前行第一个 vivian/ 为 sky/
使用+ 来 替换 /

    :%s+/oradata/apras/+/user01/apras1+     /oradata/apras/替换成/user01/apras1/

替换单个字符

    rx                                      将光标移到要替换的字符上,x为要替换后的字符
    
### <a id="vimcmd_comment">注释</a>

    3,5 s/^/#/g                             注释第3-5行
    3,5 s/^#//g                             解除3-5行的注释
    1,$ s/^/#/g                             注释整个文档。
    :%s/^/#/g                               注释整个文档，此法更快。


### <a id="vimcmd_indent">批量缩进</a>
选中要缩进的代码：

1.按下 v 键进入可视模式     

    (n)<                                    向前缩进 n 次
    (n)>                                    向后缩进 n 次

2.在正常模式下：

    n<<                                     从当前行起及之后的 n-1 行向前缩进
    n>>                                     从当前行起及之后的 n-1 行向后缩进

3.命令行模式下：

    :m,n>                                   m 到 n 行缩进
    :m>n                                    m 行开始的 n 行缩进一次


### <a id="vimcmd_other">其他</a>

    ga                                      显示光标下的字符在当前使用的 encoding 下的内码
    :TOhtml                                 根据 Vim 的语法加亮的方式生成 HTML 代码
    
* 基本计算器
插入模式下，按 Ctrl+r 键然后输入 =，再输入一个简单的算式(如：=2+3)，再按 Enter 键计算结果会被插入到文件中。

* 缩写

        :ab [缩写] [要替换的文字]
        例如：ab asap as soon as possible

* 忘记用 root 方式打开文件时的文件保存

        :w !sudo tee %
    
* 实时加密文本

        ggVGg?

* 自动补全

        Ctrl+n

* cit 命令    
在用 vim 编辑 `html` 和 `xml` 时经常使用 `cit` 操作来删除一对标签内的文字。


参考资料：      
[Vim命令合集](http://www.cnblogs.com/softwaretesting/archive/2011/07/12/2104435.html)     
[一些不起眼但非常有用的 Vim 命令](http://blog.jobbole.com/84683/)        
[史上最全的Vim命令](https://zhuanlan.zhihu.com/p/51440836)     
[Vim cheatsheet](https://github.com/skywind3000/awesome-cheatsheets/blob/master/editors/vim.txt)        





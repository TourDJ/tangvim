  - [Vimscript](#vimscript)     
    - [关键字](#keyword)    
        - [定制关键字](#commonkeyword)     
        - [自定义关键字](#definekeyword)    
        - [关键字注释](#keywordcomment)    
        - [在 Vim 创建外部脚本语言](#otherlang)    
    - [变量](#varli)   
    - [条件语句](#condition)     
    - [函数](#function)      
    - [数据类型](#datatype)   
    - [列表](#list)     
    - [循环](#loop)    
    - [字典](#dict)    
    - [函数式编程](#functional)   
    - [vimscript 命令](#script)       
    - [路径](#path) 

## <a id="vimscript">Vimscript</a>

在 .vimrc 文件中，使用的语言就是 Vim 脚本语言(vim script)。vim 脚本相当于可直接在命令模式下执行的命令，只是不需要输入前面的冒号（如果用了冒号也不会出错）。因此，像设置选项、创建键盘映射这样的命令是直接可用的。当然，作为一种脚本语言，除了普通键盘上会输入的命令外，我们还需要一些更复杂的功能，特别是：变量，表达式，条件和循环语句，函数。

Vimscript 是典型的动态式命令语言，提供一些常用的语言特征：变量、表达式、控制结构、内置函数、用户自定义函数、一级字符串、列表、字典、终端、文件IO、正则表达式模式匹配、异常和集成调试器等。

### <a id="keyword">Vim 关键字</a>
  
#### <a id="commonkeyword">定制关键字</a>
Vim 定制编程语言的关键字

    foreach if then else elsif while repeat until disable 
    integer unsigned signed byte 
    always initial

#### <a id="definekeyword">自定义关键字</a>
把特定的单词标识为关键字格式：

    syntax keyword <group name> <keyword list>

例如：

    syntax keyword type1 integer unsigned signed byte
    syntax keyword statement1 foreach if then else elsif 
        while repeat until disable always initial
    highlight link type1 Type
    highlight link statement1 Statement

定义了关键字并高亮，接下来，把此文件保存在 $HOME 下，命名为 lang.vim。重新装载 lang.vim。

写一段测试代码：
```vimscript
integer k=0;
repeat (k < 3) begin
    print “hello world” + k + “\n”;
    k = k + 1;
end
```

说明：
* 用户通常希望程序中的语句（if-then-else、repeat 等）与数据类型（integer、byte 等）以不同的方式高亮显示，这样可读性更好。因此，把语法划分为组，
每个组包含适当的内容：type1 组包含 integer、unsigned、signed 和 byte 关键字。
* Vim 已经预定义了 Type、Statement、Comment 和 Identifier 组以及相应的颜色方案。highlight 命令把 type1 与 Vim 的 Type 组关联起来，这样
就会使用相同的颜色方案显示 byte 等关键字。

如果需要大小写不敏感，加上：

    syntax case ignore

#### <a id="keywordcomment">关键字注释</a>

不能使用关键字处理注释，所以需要一个正则表达式，然后把它与 Vim Comment 组关联起来。定义正则表达式使用： 

    syntax match <identifier> /<pattern>/ 。
在两个前向斜杠 (/) 之间，定义模式 `\/\/.*`，这表示从 // 开始直到行末的所有内容。

在脚本中加入以下代码：

    syntax match comment1 /\/\/.*/
因此，下面示例定制语言代码会正确地高亮显示。
```vimscript
Integer i = 10; //this works
//so does this!
```

#### <a id="otherlang">在 Vim 创建外部脚本语言</a>
Vim 很容易与 Perl、Python、Tcl 脚本连接。
```vimscript
perl << EOF
sub checksize 
{
    my $count = 0;
    my $startfunc = 0;
    my $filelen = scalar @_;
    while ($count < $filelen) 
    {
      if ($_[$count] =~ /^function/) 
      {
        $startfunc = $count;
      }
      elsif ($_[$count] =~ /endfunction/)
      {
        if ($count - $startfunc > 100)
    {
      Vim::Msg($_[$startfunc], "Error");
    }
      }
      ++$count;
    }
}
EOF
 
function! L1( )
    perl checksize($curbuf->Get(1..$curbuf->Count()))
endfunction
```
说明：    
* 使用标志把 Perl 代码嵌入在 Vim 脚本中。这些标志可以是任何名称，可以不是全大写的。在上面例子中，使用的标志是 `perl << EOF … EOF` 中的 EOF。第二个 EOF 必须从行的第一列开始。标志不一定要命名为 EOF（任何名称都可以），但是必须遵守第一列规则。
* 把文件的全部内容传递给 Perl 代码。
* 不能使用一般的 Perl 输出例程显示错误消息，因为需要在 Vim 内部显示消息。Vim 提供了连接 Perl 的接口，Vim::Msg 在编辑器窗口内显示消息。
* 在 Vim 中编写一个函数，它把文件源代码传递给 Perl 代码。$curbuf->Count( ) 指出在当前的缓冲区中有多少行；$curbuf->Get(<line1>..<line2>) 返回 line1 和 line2 所指定的两行之间的文本。在这个脚本中，传递当前缓冲区中从第一行到最后一行的所有内容。现在，在 ESC 模式下输入 :call L1()，应该会立即看到正在处理的函数。
    
### <a id="varli">变量</a>
执行下面的命令。

    :let foo = "bar"
    :echo foo
Vim会显示bar。foo现在是一个变量，我们将一个字符串"bar"赋值给它。

* 作为变量的选项
你可以通过一种特殊语法将选项作为变量来设置。

    :let &textwidth = 100
    :set textwidth?
既然set可以搞定选项的设置，那我们为什么还要用let呢？执行下面的命令：

    :let &textwidth = &textwidth + 10
    :set textwidth?
这一次Vim显示textwidth=110。当你用set来设置某个选项，你只能给它设置一个常量值。当你使用let并将它作为一个变量来设置，你可以使用Vim脚本的所有强大之处来决定它的值。

* 本地选项     
如果你想将某个选项作为变量来设置它的本地值，而不是全局值，你需要在变量名前面加前缀。

    :let &l:number = 1
* 作为变量的寄存器(Register)
你也可以将寄存器当作变量来读取和设置。执行下面的命令：

    :let @a = "hello!"
现在把光标放到文本中的某个地方然后敲击"ap。这个命令会告诉Vim“在这里粘贴寄存器a中的内容”。我们设置了这个寄存器的内容，所以Vim会将hello!粘贴到你的文本中。

还可以读寄存器的内容。执行下面的命令：

    :echo @a
Vim会输出hello!。

在你的文件中选择一个单词然后用y复制，再执行下面的命令：

    :echo @"
Vim会输出你刚才复制的单词。"寄存器是“未命名(unnamed)”寄存器，在复制的时候没有指定寄存器的文本都会放到这里。

在你的文件中执行搜索/someword，然后执行下面的命令：

    :echo @/
Vim会输出你刚刚使用的搜索模式。这样你就可以通过编程来读和修改当前的搜索模式，有些时候这会很有用。
> 查看 `:help registers`

* 变量作用域
当你在变量名中使用b:，这相当于告诉Vim变量hello是当前缓冲区的本地变量。如:

    :let b:hello = "world"
当某个变量由一个字符和冒号开头，那么这就表示它是一个作用域变量。

表 1. Vimscript 变量范围

|前缀	    |       含义|
|--------| --------------------|
|g:varname	|变量为全局变量|
|s:varname	|变量的范围为当前的脚本文件|
|w:varname	|变量的范围为当前的编辑器窗口|
|t:varname	|变量的范围为当前的编辑器选项卡|
|b:varname	|变量的范围为当前的编辑器缓冲区|
|l:varname	|变量的范围为当前的函数|
|a:varname	|变量是当前函数的一个参数|
|v:varname	|变量是 Vim 的预定义变量|


> 查看 `:help internal-variables`

### <a id="condition">条件语句</a>
#### <a id="condition_if">If</a>
每种编程语言都有产生分支流程的方法，在Vimscript中，这是用if语句实现的。 if语句是Vimscript中产生分支的基本方法。例如：

    :if "9024"
    :    echom "WHAT?!"
    :endif
对于Vimscript 的条件判断，我们可以得出结论：
* 如有必要，Vim将强制转换变量(和字面量)的类型。在解析10 + "20foo"时，Vim将把 "20foo"转换成一个整数(20)然后加到10上去。
* 以一个数字开头的字符串会被强制转换成数字，否则会转换成0
* 在所有的强制转换完成后，当if的判断条件等于非零整数时，Vim会执行if语句体。

#### <a id="condition_elif">Else 和 Elseif</a>
Vim，像Python一样，支持"else"和"else if"分句。执行下面的命令：

    :if 0
    :    echom "if"
    :elseif "nope!"
    :    echom "elseif"
    :else
    :    echom "finally!"
    :endif

#### <a id="condition_compare">比较</a>
Vim允许我们比较值的大小

    :if 10 > 1
    :    echom "foo"
    :endif
Vim会显示foo。

#### <a id="condition_noignorecase">大小写敏感</a>
执行下面的命令：

    :set noignorecase
    :if "foo" == "FOO"
    :    echom "vim is case insensitive"
    :elseif "foo" == "foo"
    :    echom "vim is case sensitive"
    :endif
Vim执行elseif分句,所以显然Vimscript是大小写敏感的。现在执行下面命令：

    :set ignorecase
    :if "foo" == "FOO"
    :    echom "no, it couldn't be"
    :elseif "foo" == "foo"
    :    echom "this must be the one"
    :endif
...

== 的行为取决于用户的设置。

#### <a id="condition_defense>防御性编程</a>
这意味着什么？意味着在为别人开发插件时，你不能信任==。 一个不加包装的==不能出现在你的插件代码里。

好在Vim有额外两种比较操作符来处理这个问题。

执行下面的命令：

    :set noignorecase
    :if "foo" ==? "FOO"
    :    echom "first"
    :elseif "foo" ==? "foo"
    :    echom "second"
    :endif
Vim显示first因为<code>==?</code>是"无论你怎么设都大小写不敏感"比较操作符。

现在执行下面的命令：

    :set ignorecase
    :if "foo" ==# "FOO"
    :    echom "one"
    :elseif "foo" ==# "foo"
    :    echom "two"
    :endif
Vim显示two因为<code>==#</code>是"无论你怎么设都大小写敏感"比较操作符。

阅读`:help ignorecase`来看看为什么有的人设置了这个选项。

阅读`:help expr4`看看所有允许的比较操作符

### <a id="function">函数</a>
Vimscript支持函数。

没有作用域限制的Vimscript函数必须以一个大写字母开头！

执行下面的命令：

    :function Meow()
    :  echom "Meow!"
    :endfunction
Vim定义了一个函数。

运行它：

    :call Meow()
不出所料，Vim显示Meow!

#### <a id="function_call">调用函数</a>
第一种方法使用call命令。

    :call Meow()
第二种方法是在表达式里调用函数。

    :echom GetMeow()
#### <a id="function_return">隐式返回</a>
如果一个Vimscript函数不返回一个值，它隐式返回0。

执行下面命令：

    :function TextwidthIsTooWide()
    :  if &l:textwidth ># 80
    :    return 1
    :  endif
    :endfunction
这个函数涉及到我们之前学到的许多重要概念：
* if语句
* 将选项作为变量
* 访问特定作用域里的选项变量
* 大小写敏感的比较

#### <a id="function_param">函数参数</a>
执行下面的命令：

    :function DisplayName(name)
    :  echom "Hello!  My name is:"
    :  echom a:name
    :endfunction
注意我们传递给echom命令的参数前面的a:。这表示一个变量的作用域，如果不带作用域前缀，Vim抱怨说它找不到变量。

#### <a id="function_args">可变参数</a>
Vimscript函数可以设计为接受不定数目的参数，就像Javascript和Python中的一样。执行下面命令：

    :function Varg(...)
    :  echom a:0
    :  echom a:1
    :  echo a:000
    :endfunction

    :call Varg("a", "b")
函数定义中的...说明这个函数可以接受任意数目的参数。就像Python函数中的*args

函数中的第一行为输出消息a:0，结果显示2。当你在Vim中定义了一个接受可变参数的函数， a:0将被设置为你额外给的参数数量。 刚才我们传递了两个参数给Varg，所以Vim显示2。

第二行为输出a:1，结果显示a。你可以使用a:1,a:2等等来引用你的函数接受的每一个额外参数。 如果我们用的是a:2，Vim就会显示"b"

第三行有些费解。当一个函数可以接受可变参数，a:000将被设置为一个包括所有传递过来的额外参数的列表(list)。 我们还没有讲过列表，所以不要太纠结于此。你不能对列表使用echom，因而在这里用echo代替。

你也可以将可变参数和普通参数一起用。执行下面的命令：

    :function Varg2(foo, ...)
    :  echom a:foo
    :  echom a:0
    :  echom a:1
    :  echo a:000
    :endfunction

    :call Varg2("a", "b", "c")
我们可以看到Vim将"a"作为具名参数(named argument)a:foo的值，将余下的塞进可变参数列表中。

#### <a id="function_setvalue">赋值</a>
试试执行下面的命令：

    :function Assign(foo)
    :  let a:foo = "Nope"
    :  echom a:foo
    :endfunction

    :call Assign("test")
Vim将抛出一个错误，因为你不能对参数变量重新赋值。现在执行下面的命令：

    :function AssignGood(foo)
    :  let foo_tmp = a:foo
    :  let foo_tmp = "Yep"
    :  echom foo_tmp
    :endfunction

    :call AssignGood("test")
这次就可以了，Vim显示Yep。

### <a id="datatype">数据类型</a>
#### <a id="datatype_number">数字</a>
Vimscript有两种数值类型：Number和Float。一个Number是32位带符号整数。一个Float是浮点数。

示例：

    :echom 100
    :echom 0xff
    :echo 100.1

当你在运算，比较或其他操作中混合使用Number和Float类型，Vim将把Number转换成Float， 以Float格式作为结果。在两个Number之间的除法中，余数会被丢弃。如果你希望Vim使用浮点数除法，至少有一个数字必须是Float， 这样剩下的数字也会被转换成浮点数。执行下面命令：

    :echo 3 / 2.0
Vim输出1.5。

#### <a id="datatype_string">字符串</a>
执行下面的命令：

    :echom "Hello, " + "world"
发生什么了？不知为何，Vim显示0！     
Vim的+运算符仅仅适用于数值。当你把一个字符串作为+的参数时， Vim会在执行加法前尝试把它强制转换成一个Number。Vim不会强制转换字符串为Float类型！

`.`是Vim中的"连接字符串"运算符，可以用来连接字符串。 它不会在其间插入空格或别的什么东西。

    :echom "Hello, " . "world"

特殊字符   
Vimscript允许你在字符串中使用转义字符串来表示特殊字符。

    :echom "foo \"bar\""

字符串字面量    
Vim也允许你使用"字符串字面量"来避免转义字符串的滥用。

    :echom '\n\\'
使用单引号将告诉Vim，你希望字符串所见即所得，无视转义字符串。 一个例外是一行中连续两个单引号将产生一个单引号。

### <a id="list">列表</a>
Vim有两种主要的集合类型：列表。

Vimscript列表是有序的，异质的元素集合。执行下面的命令：

    :echo ['foo', 3, 'bar']

#### <a id="list_index">索引</a>
Vimscript列表的索引从0开始，也可以从列表结尾进行索引。

    :echo [0, [1, 2]][1]
    :echo [0, [1, 2]][-2]

#### <a id="list_split">切割</a>    
Vim列表也可被切割。类似于 python，区别是包括上下限。

    :echo ['a', 'b', 'c', 'd', 'e'][0:2]
越过列表索引上界也是安全的。    

忽略第一个索引以表示"开头"和/或最后一个索引以表示"结尾"。执行下面的命令：

    :echo ['a', 'b', 'c', 'd', 'e'][:1]
    :echo ['a', 'b', 'c', 'd', 'e'][3:]

#### <a id="list_concat">连接</a>
用+连接Vim列表。试试这个命令：

    :echo ['a', 'b'] + ['c']

#### <a id="list_func">列表函数</a>
Vim有着许许多多内置列表函数。

* add 列表增加元素    

        :let foo = ['a']
        :call add(foo, 'b')
        :echo foo
* len 列表的长度     

        :echo len(foo)
* get 返回给定索引对应的给定列表的项，如果索引超过列表范围， 返回给定的默认值。

        :echo get(foo, 0, 'default')
        :echo get(foo, 100, 'default')
* index 返回给定项在给定列表的第一个索引，如果不在列表中则返回-1。

        :echo index(foo, 'b')
        :echo index(foo, 'nope')
* join 先将给定列表的每一项强制转换成字符串， 再以给定的分割字符串(或一个空格，如果没有给的话)作为分割，连接成一个字符串。

        :echo join(foo)
        :echo join(foo, '---')
        :echo join([1, 2, 3], '')
* reverse 反转列表

        :call reverse(foo)

### <a id="loop">循环</a>
第一种循环是for循环。
#### <a id="loop_for">For 循环</a>
执行下面的命令：

    :let c = 0

    :for i in [1, 2, 3, 4]
    :  let c += i
    :endfor

    :echom c
Vimscript中不存在C风格的for (int i = 0; i < foo; i++)。

#### <a id="loop_while">While 循环</a>
执行下面命令：

    :let c = 1
    :let total = 0

    :while c <= 4
    :  let total += c
    :  let c += 1
    :endwhile

    :echom total

### <a id="dict">字典</a>
Vimscript字典类似于Python中的dict，和Javascript中的object。    

执行这个命令：

    :echo {'a': 1, 100: 'foo'}
当键仅由字母，数字和/或下划线组成时，Vimscript也支持Javascript风格的"点"查找。 试试下面的命令：

    :echo {'a': 1, 100: 'foo',}.a
    :echo {'a': 1, 100: 'foo',}.100

### <a id="functional">函数式编程</a>
#### 作为变量的函数
Vimscript支持使用变量储存函数。执行下面的命令：

    :let Myfunc = function("Append")
    :echo Myfunc([1, 2], 3)
> 注意我们使用的变量以大写字母开头。 如果一个Vimscript变量要引用一个函数，它就要以大写字母开头。

函数也可以储存在列表里。执行下面命令：

    :let funcs = [function("Append"), function("Pop")]
    :echo funcs[1](['a', 'b', 'c'], 1)
储存在列表的函数变量不需要以大写字母开头。

#### 高阶函数
高阶函数就是接受别的函数并使用它们的函数。

添加代码：

    function! Mapped(fn, l)
        let new_list = deepcopy(a:l)
        call map(new_list, string(a:fn) . '(v:val)')
        return new_list
    endfunction
执行：

    :let mylist = [[1, 2], [3, 4]]
    :echo Mapped(function("Reversed"), mylist)
Vim显示[[2, 1], [4, 3]]，正好是对列表中的每一个元素应用了Reversed()的结果。

### <a id="script">vimscript 命令</a>

#### Execute命令
`execute` 命令用来把一个字符串当作Vimscript命令执行。

执行下面的命令：

    :execute "rightbelow vsplit " . bufname("#")
Vim将在第二个文件的右边打开第一个文件的竖直分割窗口(vertical split)。

浏览 `:help execute`

阅读 `:help leftabove，:help rightbelow，:help :split和:help :vsplit`

#### Normal命令
normal命令简单地接受一串键值并当作是在normal模式下输入的。

执行下面的命令：

    :normal G
Vim将把你的光标移到当前文件的最后一行，就像是在normal模式里按下G。

*在写Vim脚本时，你应该总是使用 `normal!` 避免映射，永不使用 `normal`*。

既然已经学了execute和normal!，我们就可以深入探讨一个Vimscript惯用法。 执行下面的命令：

    :execute "normal! gg/foo\<cr>dd"
这将移动到文件的开头，查找foo的首次出现的地方，并删掉那一行。

execute允许你创建命令，因而你能够使用Vim普通的转义字符串来生成你需要的"打不出"的字符。 尝试下面的命令：

    :execute "normal! mqA;\<esc>`q"
分析：
* `:execute "normal! ..."`：执行命令序列，一如它们是在normal模式下输入的，忽略所有映射， 并替换转义字符串。
* `mq`：保存当前位置到标记"q"。
* `A`：移动到当前行的末尾并在最后一个字符后进入insert模式。
* `;`：我们现在位于insert模式，所以仅仅是写入了一个";"。
* `\<esc>`：这是一个表示Esc键的转义字符串序列，把我们带离insert模式。
* <code>`q</code>：回到标记"q"所在的位置。

#### echo命令 
会打印输出，但是一旦你的脚本运行完毕，那些输出信息就会消失。使用:echom打印的信息 会保存下来，你可以执行:messages命令再次查看那些信息。

    :echo $MYVIMRC  查询 vimrc 文件的位置

#### numberwidth 
选项改变行号的列宽。

#### viw 
将高亮选中整个单词。

### <a id="path">路径</a>
#### 绝对路径
执行下面的命令：

    :echom expand('%')
    :echom expand('%:p')
    :echom fnamemodify('foo.txt', ':p')
第一个命令显示我们正在编辑的文件的相对路径。%表示"当前文件"。 Vim也支持其他一些字符串作为expand()的参数。    
第二个命令显示当前文件的完整的绝对路径名。字符串中的:p告诉Vim你需要绝对路径。 这里也有许多别的修饰符可以用到。    
第三个命令显示了当前文件夹下的文件foo.txt的绝对路径，无论文件是否存在。    
> fnamemodify()是一个比expand()灵活多了的Vim函数， 你可以指定任意文件名作为fnamemodify()的参数，而不仅仅是expand()所需要的那种特殊字符串。

#### 列出文件
执行下面的命令：

    :echo globpath('.', '*')
Vim将输出当前目录下所有的文件和文件夹。globpath()函数返回一个字符串， 其中每一项都用换行符隔开。为了得到一个列表，你需要自己去split()。执行这个命令：

    :echo split(globpath('.', '*'), '\n')
这次Vim显示一个包括各个文件路径的Vimscript列表。

你可以用\*\*递归地列出文件。执行这个命令：

    :echo split(globpath('.', '**'), '\n')
Vim将列出当前文件夹下的所有文件及文件夹。

参考资料：         
* [为 Vim 编辑器开发定制插件](https://www.ibm.com/developerworks/cn/aix/library/au-vimplugin/)          
* [Five Minute Vimscript](http://andrewscala.com/vimscript/)    
* [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)    
* [Learn Vimscript the Hard Way中文版](http://learnvimscriptthehardway.onefloweroneworld.com/)     
* [使用脚本编写 Vim 编辑器](https://www.ibm.com/developerworks/cn/linux/l-vim-script-1/index.html)      


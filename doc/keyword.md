
## <a id="keyword">Vim 关键字</a>
### <a id="commonkeyword">定制关键字</a>
Vim 定制编程语言的关键字

    foreach if then else elsif while repeat until disable 
    integer unsigned signed byte 
    always initial

### <a id="definekeyword">自定义关键字</a>
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

关键字注释

不能使用关键字处理注释，所以需要一个正则表达式，然后把它与 Vim Comment 组关联起来。定义正则表达式使用： 

    syntax match <identifier> /<pattern>/ 。
在两个前向斜杠 (/) 之间，定义模式 `\/\/.*`，这表示从 // 开始直到行末的所有内容。因此，下面示例定制语言代码会正确地高亮显示。
```vimscript
Integer i = 10; //this works
//so does this!
```


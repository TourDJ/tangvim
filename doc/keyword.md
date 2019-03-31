
## <a id="keyword">Vim 关键字</a>
参考资料：[为 Vim 编辑器开发定制插件](https://www.ibm.com/developerworks/cn/aix/library/au-vimplugin/)    
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

### <a id="keywordcomment">关键字注释</a>

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

### <a id="otherlang">在 Vim 创建外部脚本语言</a>
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
    



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

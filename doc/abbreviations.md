
- [Abbreviations](./abbreviations.md#abbrev) 
    - [Keyword Characters](./abbreviations.md#keyword)    
    

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

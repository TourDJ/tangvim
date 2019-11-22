  - [Vimscript](#vimscript)     
    - [关键字](#keyword)    
        - [定制关键字](#commonkeyword)     
        - [自定义关键字](#definekeyword)    
        - [关键字注释](#keywordcomment)    
        - [在 Vim 创建外部脚本语言](#otherlang)    
    - [变量](#varli)    
    - [表达式](#expression)      
    - [条件语句](#condition)     
    - [函数](#function)      
      - [调用函数](#function_call)      
      - [可重新声明的函数](#function_override)       
      - [隐式返回](#function_return)     
      - [函数参数](#function_param)          
      - [可变参数](#function_args)      
      - [赋值](#function_setvalue)      
    - [数据类型](#datatype)    
    - [列表](#list)     
    - [循环](#loop)    
    - [字典](#dict)    
    - [函数式编程](#functional)   
    - [vimscript 命令](#script)       
    - [路径](#path)       
    - [正则表达式](#regexp)        
      - [magic](#regexp-magic)     
      - [特殊字符](#regexp-metachar)    
      - [正向预查与反向预查](#regexp-presurvey)      

## <a id="vimscript">Vimscript</a>

在 .vimrc 文件中，使用的语言就是 Vim 脚本语言(vim script)。vim 脚本相当于可直接在命令模式下执行的命令，只是不需要输入前面的冒号（如果用了冒号也不会出错）。因此，像设置选项、创建键盘映射这样的命令是直接可用的。当然，作为一种脚本语言，除了普通键盘上会输入的命令外，我们还需要一些更复杂的功能，特别是：变量，表达式，条件和循环语句，函数。

Vimscript 是典型的动态式命令语言，提供一些常用的语言特征：变量、表达式


- [键盘映射](./key-mapping.md#mapping)  
    - [Leader](./key-mapping.md#leader)    
    - [遮盖](./key-mapping.md#override)   
    - [常用映射](./key-mapping.md#cusmapping)     


## <a id="mapping">键盘映射</a>
map 是一个映射命令,将常用的很长的命令映射到一个新的功能键上。
map 的格式：

    map <要映射键> <被映射的按键序列>
比如 `map T :q!`设置后，则在命令模式下按 T 并按回车，就会退出vim。

常用命令：
* 映射: `map <F2> ggvG`
* 解除映射: `unmap <F2>`
* 清除所有映射: `mapclear`

map 配置的映射在 visual 模式一样工作。你可以使用nmap、vmap和imap命令分别指定映射仅在normal、visual、insert模式有效。vmap 和 map类似，二者的区别在于前者用于所谓的Visual模式，后者用于通常的命令模式?。

### <a id="mapfault">map 的缺点</a>
* \*map系列命令的一个缺点就是存在递归的危险。例如：

        :nmap dd O<esc>jddk
这个映射实际上是递归的！当你按下dd后，Vim解释为：

        dd存在映射，执行映射的内容。
            新建一行。
            退出insert模式。
            向下移动一行。
            dd存在映射，执行映射的内容。
                新建一行。
                退出insert模式。
                向下移动一行。
                dd存在映射，执行映射的内容。
                ......
                然后一直这样

* 另外一个是如果你安装一个插件，插件映射了同一个按键为不同的行为，两者冲突，有一个映射就无效了。

所以 Vim 提供另一组映射命令，这些命令创建的映射在运行时不会进行递归。例如：

    :nmap x dd
    :nnoremap \ x
每一个\*map系列的命令都有个对应的\*noremap命令，包括：noremap/nnoremap、 vnoremap和inoremap。这些命令将不递归解释映射的内容。
    
[vim的几种模式和按键映射](http://www.cnblogs.com/my_life/articles/3261873.html) 


### <a id="leader">Leader</a>
**Leader**   
各类 vim 插件帮助文档中经常出现 `<leader>`，即前缀键，缓解了快捷键引起冲突的问题。
     
    let mapleader = ";"

**Local Leader**   
Vim有另外一个“leader”成为“local leader“。这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射。

    let maplocalleader = "\\"

**\<buffer\>**     
`<buffer>` 告诉Vim这个映射只在定义它的那个缓冲区中有效

    :nnoremap <buffer> <leader>x dd
> `<leader>x`是一个本地缓冲区映射，不过这种定义方式并不合适。如果我们需要设定一个只会用于特定缓冲区的映射，一般会使用 `<localleader>`，而不是`<leader>`。

有时你正在疯狂的编码，突然发现加个映射会加速你的进度。你要立即将其加到~/.vimrc 文件中以防止忘记，但是你 <strong>不想</strong> 退出当前的文件，因为灵感稍纵即逝。

所以，我们在一个分屏中打开~/.vimrc文件以快速编辑添加映射，然后退出继续编码。运行命令：

    :nnoremap <leader>ev :vsplit $MYVIMRC<cr> " 编辑配置文件
    :nnoremap <leader>sv :source $MYVIMRC<cr> " 重读配置文件

### <a id="override">遮盖</a>
来看关于本地映射的一个非常有趣的特性-遮盖。     
看个例子

    :nnoremap <buffer> Q x
    :nnoremap          Q dd
当你敲击Q，Vim会执行第一个映射，而不是第二个，因为第一个映射比起第二个要显得更具体，这可以看成第二个映射被第一个映射遮盖了。

### <a id="cusmapping">常用映射</a>
常用操作设定成快捷键，提升效率：

     " 定义快捷键到行首和行尾
     nmap LB 0
     nmap LE $
     " 设置快捷键将选中文本块复制至系统剪贴板
     vnoremap <Leader>y "+y
     " 设置快捷键将系统剪贴板内容粘贴至 vim
     nmap <Leader>p "+p
     " 定义快捷键关闭当前分割窗口
     nmap <Leader>q :q<CR>
     " 定义快捷键保存当前窗口内容
     nmap <Leader>w :w<CR>
     " 定义快捷键保存所有窗口内容并退出 vim
     nmap <Leader>WQ :wa<CR>:q<CR>
     " 不做任何保存，直接退出 vim
     nmap <Leader>Q :qa!<CR>
     " 依次遍历子窗口
     nnoremap nw <C-W><C-W>
     " 跳转至右方的窗口
     nnoremap <Leader>lw <C-W>l
     " 跳转至左方的窗口
     nnoremap <Leader>hw <C-W>h
     " 跳转至上方的子窗口
     nnoremap <Leader>kw <C-W>k
     " 跳转至下方的子窗口
     nnoremap <Leader>jw <C-W>j
     " 定义快捷键在结对符之间跳转
     nmap <Leader>M %
     " 在光标后面插入当前日期和时间
     map <F2> a<C-R>=strftime("%c")<CR><Esc>
     
    " 编辑配置文件
    nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
    " 重读配置文件
    nnoremap <leader>sv :source $MYVIMRC<cr> 
    " 给单词加引号
    nnoremap <leader>a viw<esc>a"<esc>hbi"<esc>lel
    " 从插入模式返回到常用模式
    inoremap jk <esc>
    " 在插入模式下敲击escape按键后执行<nop>(no operation)
    :inoremap <esc> <nop>

vimrc 修改后立即生效

     " 让配置变更立即生效
     autocmd BufWritePost $MYVIMRC source $MYVIMRC

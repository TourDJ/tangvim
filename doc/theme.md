
- [vim 主题](#theme)      
	- [常用的主题插件](#commontheme)      
    - [自定义主题](#definetheme)         
	- [vim 的语法高亮/配色方案](#themecolor)     

## <a id="theme">vim 主题</a>
vim 的颜色主题在 $VIMRUNTIME/colors 文件夹里。在正常模式下输入

     : colorscheme
查看当前的配色方案。
修改主题使用命令

     ：colorscheme mycolor
其中 mycolor 是你 $VIMRUNTIME/colors 文件夹包含的文件名。也可以把这个命令写入~/.vimrc配置文件中，这样每次打开Vim都是你设定的主题。

或者也可以在.vimrc中添加一句：

     set runtimepath+=~/.vim
将用户目录加入到运行时路径中。

### 256 colors in vim
XTerm and most other modern terminal emulators support 256 colors, you can use a script to check if your [terminal supports 256 colors](../script/terminalcolors.py).

### <a id="commontheme">常用的主题插件</a>
收藏了几个不同的主题插件。

* [vim-airline](https://github.com/vim-airline/vim-airline)    
Lean & mean status/tabline for vim that's light as air.

          Plug 'vim-airline/vim-airline'
          Plug 'vim-airline/vim-airline-themes'

* [gruvbox](https://github.com/morhetz/gruvbox)     
[安装](https://github.com/morhetz/gruvbox/wiki/Installation)及配置：    

          Plug 'morhetz/gruvbox'
          colorscheme gruvbox
          set background=dark    " Setting dark mode
          set background=light   " Setting light mode

注： 安装插件管理工具是 vim-plug。

* [solarized](https://github.com/altercation/solarized/tree/master/vim-colors-solarized)    
Solarized Colorscheme for Vim, [install and config](https://github.com/TourDJ/tangvim/blob/master/theme/solarized-snippe.vim)    

还有一些其他不错的主题插件值得关注：

  [收集漂亮的 Vim 主题](https://zhuanlan.zhihu.com/p/34699085)     

### <a id="definetheme">自定义主题</a>
找不到适合自己的主题？可以自己定义一个主题。

创建步骤：     
* 首先在 vim 的跟目录中，找到 colors 文件夹， 新建一个主题文件， 随意命名， 扩展名必须是以`.vim`结尾。
* 在该文件中加入以下代码：
```vimscript
highlight clear             " 先清除之前的高亮
if exists("syntax_on")      " 重置高亮
	syntax reset
endif
set background=dark         " 主题风格设置为 dark
let g:colors_name='myvim'   " 主题名称设置为 myvim
```
* 添加高亮    
高亮的语法：      
    * hi 样式名称 guifg= guibg= ctermfg= ctermbg= gui= cterm=      
hi 是highlight的缩写。gui 表上图形界面，cterm表示终端, fg 表示前景色, bg 表示背景色。
    * hi link 子样式 被继承的父样式      
link 的主要作用就是让 Mystyle 继承 Normal的配色样式。见[样式参考](https://github.com/antlypls/vim-colors-codeschool/blob/master/colors/codeschool.vim)

### <a id="themecolor">vim 的语法高亮/配色方案</a>
vim 的配色分两部分：编辑环境配色和文本区域配色

1) vim编辑环境配色：
比如Vim编辑区的前景背景色、状态栏颜色、错误提示颜色、查找、光标、圈选区、行号、折叠等的颜色这里列出几个配色组名及其含义(全部的详细信息查看帮助文件 :help hi 查找 "highlight-group" 即可)：

	Cursor        光标下的字符颜色    
	CursorLine    光标所在行颜色    
	ErrorMsg      命令行出现的错误信息提示    
	IncSearcg     被搜索字符的颜色    
	Normal        普通字符    
	Pmenu         弹出的提示条目颜色    
	PmenuSel      弹出的提示条目中被选中条目的颜色    
	SpellBad      拼写错误字符颜色    
	Visual        可视化模式下选中字符的颜色    
	Menu          菜单栏的颜色字体    
	Scrollbar     滚动条的颜色   

2) 文本区域配色：
可编辑的文本区域的字符配色(详细信息请执行 :help hi搜索 "\*comment")。由于配色种类较多，vim默认分了几大类(帮助信息中带*的)：

	*Comment        注释  
	*Constant       常量  
	*statement      常用关键字标示符  
	*PrePoc         预处理符号  
	*Type           数据类型  
 
下面是较为详细的组别：

	String          字符串常量: "string abc\n"  
	Character       单个字符常量: 'c', '\n'  
	Number          数字常量: 234, 0xff  
	Boolean         布尔常量: TRUE, false  
	Function        函数名  
	Conditional     条件关键字: if, then, else, endif, switch, etc.  
	Repeat          循环关键字: for, do, while, etc.  
	Operator        操作符: "sizeof", "+", "*", etc.  
	Exception       异常关键字: try, catch, throw  

这样便可以更为详细的为每一个组别进行配色。

查看当前的vim配色情况

	:hi/highlight
另外，文本区域的配色可以关闭，但环境配色不能，通常vim给定的默认可选配色方案中同时包含了以上两个方面。
下面就一条具体的配色命令(对数据类型配色)解释每个字段的含义：

	hi Type cterm=none ctermbg=White ctermfg=Green guibg=Gray guifg=Red
* hi: highlight的缩写，配色命令
* Type: 配色组名，可以自定义(修改$VIMRUNTIME/syntax/下对应的文件可改变不同语言的高亮方案)其内容 
* cterm,ctermbg,ctermfg,guibg,guifg: 代表了不同显示环境
* White,Green: 表示颜色(也可以用数字或者类似与html的16进制颜色表示方法)

显示环境有三种：黑白终端，彩色终端，图形界面，三种环境下参数名称如下:

	term        attributes in a B&W terminal  
	cterm       attributes in a color terminal  
	ctermfg     foreground color in a color terminal  
	ctermbg     background color in a color terminal  
	gui         attributes in the GUI  
	guifg       foreground color in the GUI  
	guibg       background color in the GUI  

其中term仅有黑白两色，cterm下颜色较为单一，GUI模式颜色丰富

若要仅修改某种语言（c、Java、pascal）的配色，则在配色组名前加语言名称即可，比如对c/c++语言的数据类型单独配色：

	hi cType ctermfg=Blue
若是修改java/pascal的数据类型，则相应的将cType替换为javaType/pascalType即可。

对于文本区域的语法高亮(即配色)，我们可根据需求特殊化定制，比如自定义组: myUniqueWord, mySymbol，使用syn/syntax命令

syn keyword myUniqueWord gang Gang swagger
syn match mySymbol "[,.;(){}[]]" (可使用正则表达式)
vim目前7.4版本给出的可直接使用(colorscheme命令加于.vimrc中即可)的配色方案位于目录：/usr/local/share/vim/vim74/colors，比如使用desert.vim中的配色，则于.vimrc中添加一行

	colorscheme desert
即可

配色方案列表(带效果图)，可参考：      
http://vimcolorschemetest.googlecode.com/svn/html/index-c.html       
[10 个你值得拥有的 Vim 配色方案](http://www.oschina.net/news/32306/10-vim-color-schemes-you-need-to-own)     


参考资料：      
* [256 colors in vim](https://vim.fandom.com/wiki/256_colors_in_vim)      
* [Colour colour everywhere! 256 colour-mode for Linux consoles](http://www.robmeerman.co.uk/unix/256colours)      




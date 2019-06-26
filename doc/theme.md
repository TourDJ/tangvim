
- [vim 主题](#theme)      
	- [常用的主题插件](#commontheme)      
    - [自定义主题](#definetheme)         


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


参考资料：      
* [256 colors in vim](https://vim.fandom.com/wiki/256_colors_in_vim)      



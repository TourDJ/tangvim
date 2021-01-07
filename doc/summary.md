        
- [vim 概述](#summary)  
  - [vim 历史](#history)   
    
## <a id="summary">vim 概述</a>    
在 Linux 的系統中使用文字编辑器来编辑你的 Linux 参数配置文件，是最平常不过的事情了，常常听到的就有： [emacs](http://www.gnu.org/software/emacs/), [pico](https://en.wikipedia.org/wiki/Pico_(text_editor)), [nano](http://sourceforge.net/projects/nano/), [joe](http://sourceforge.net/projects/joe-editor/), 与 [vim](http://www.vim.org) 等等。这些编辑器有什么区别呢？     

* [常见文件编辑器比较](http://encyclopedia.thefreedictionary.com/Listz+of+text+editors)   

* [维基百科的文本编辑器比较](http://en.wikipedia.org/wiki/Comparison_of_text_editors)    

vi 是古老的文本编辑器，vim是从 vi 发展出来的一个文本编辑器，和Emacs 并列成为类Unix系统 用户最喜欢的编辑器。作为开源世界最重要的编辑器之一，Vim 以其强大的功能和可定制能力被众多开发者所喜爱。因为太强大，所以要用好不容易。

### <a id="history">vim 历史</a>

摘自维基百科
> Vim的第一个版本由Bram Moolenaar 在1991年发布。最初的简称是Vi IMitation ，随着功能的不断增加，正式名称改成了Vi IMproved。现在是在开放源代码 方式下发行的自由软件 。

> Bram Moolenaar 在 80 年代末购入他的 Amiga 计算机时，Amiga 上还没有他最常用的编辑器 vi。Bram 从一个开源的 vi 复制 Stevie 开始，开发了 Vim 的 1.0 版本。最初的目标只是完全复制 vi 的功能，那个时候的 Vim 是Vi IMitation（模拟）的简称。1991 年 Vim 1.14 版被 "Fred Fish Disk #591" 这个 Amiga 用的免费软体集所收录了。1992 年 1.22 版本的 Vim 被移植到了 UNIX 和 MS-DOS 上。从那个时候开始，Vim 的全名就变成 Vi IMproved（改良）了。

> 在这之后，Vim 加入了不计其数的新功能。做为第一个里程碑的是 1994 年的 3.0 版本加入了多视窗编辑模式（分割视窗）。从那之后，同一萤幕可以显示的 Vim 编辑文件数可以不止一个了。1996 年发布的 Vim 4.0 是第一个利用图型介面（GUI ）的版本。1998 年 5.0 版本的 Vim 加入了 highlight（语法高亮 ）功能。2001 年的 Vim 6.0 版本加入了代码折叠 、插件 、 多国语言支持、垂直分割视窗等功能。2006 年 5 月发布的 Vim 7.0 版更加入了拼字检查、上下文相关补全，标签页编辑等新功能。现在最新的版本是 2008 年 8 月发布的 Vim 7.2，该版本合并了 vim 7.1 以来的所有修正补丁，并且加入了脚本的浮点数支持。


Vim 和 TextMate 有很多不同，你常常会遇到它不让你输入，让你抓狂。Vim 有很多不同的模式，在不同的模式下，不同的按键有不同的功能。更让人崩溃的是，大写和小写的功能也天差地别。

## vim 的基础知识
### viminfo

在vim中操作的行为，vim会自动记录下来，保存在 `~/.viminfo` 文件中。这样为了方便下次处理，如vim打开文件时，光标会自动在上次离开的位置显示。原来搜索过的字符串，新打开文件时自动高亮显示。

`~/.viminfo` 文件是系统自动生成。

### vimrc

`.vimrc`文件是vim的环境设置文件。全局的vim的设置是在 `/etc/vimrc` 文件中。不建议修改`/etc/vimrc` 文件，每个用户可以在用户根目录中设置vim，新建 `~/.vimrc`。

### Netrw 文件浏览器
在vim 7.0之前，文件浏览功能由explorer.vim插件提供；从vim 7.0之后，这个插件被netrw.vim插件所代替。Netrw插件伴随vim发行，不需要单独安装。

#### 启动
* 使用`:Explore`命令或缩写`:E`命令，将在当前窗口中打开文件浏览器。
* 使用`:Sexplore`命令或缩写`:Sex`命令，将在水平拆分窗口中打开文件浏览器。
* 使用`:Vexplore`命令或缩写`:Vex`命令，将在垂直拆分窗口中打开文件浏览器。
* 在启动Netwr时，指定浏览特定的文件夹`:Sex ~/text`

#### 打开文件
在Netrw中，可以切换目录并打开文件。使用键盘移动光标至文件或文件夹名称上，然后点击Enter回车键，可以在当前窗口中打开该文件或文件夹；如果希望在新建窗口中打开文件或文件夹，那么可以点击o键。


### 什么是.netrwhist？

`netrw`是一种支持跨网络读写文件的vim插件/脚本。`.netrwhist`是一个历史文件，它维护所有被修改的目录。 所以，只要修改~/.vim的内容，它就会在.netrwhist添加一个条目。

示例.netrwhist如下所示

    let g:netrw_dirhistmax  =10
    let g:netrw_dirhist_cnt =6
    let g:netrw_dirhist_1='/Users/wolever/EnSi/repos/web/env/web/lib/python2.6/site-packages/django'
    let g:netrw_dirhist_2='/private/tmp/b/.hg/attic'
    let g:netrw_dirhist_3='/Users/wolever/code/sandbox/pydhcplib-0.6.2/pydhcplib'
    let g:netrw_dirhist_4='/Users/wolever/EnSi/repos/common/env/common/bin'
    let g:netrw_dirhist_5='/Users/wolever/EnSi/repos/common/explode'
    let g:netrw_dirhist_6='/Users/wolever/Sites/massuni-wiki/conf'
netrw_dirhistmax指示它在历史记录文件中存储的修改目录的最大数量。即最大历史大小。 netrw_dirhist_cnt指示修改的目录的当前历史计数。

如果要禁用netrw生成历史记录文件，请增加以下设置：        

    au VimLeave * if filereadable("/home/evasafe/.vim/.netrwhist")|call delete("/home/evasafe/.vim/.netrwhist")|endif

另外，如果将`g:netrw_dirhistmax`设置为零，netrw将不保存历史记录或书签：

    :let g:netrw_dirhistmax = 0 
这样做不会导致任何以前的.netrwhist或.netrwbook文件被删除。

另外，如果你希望vim遵守XDG的基本目录规范，以防止你的home文件夹被像~/.vim这样的点文件丢失，你可能需要从你的configuration中分割出caching的文件和历史文件驻留在运行时path中）。 例如，要将.netrwhist存储在~/.cache/vim ，您可能需要尝试

    let g:netrw_home=$XDG_CACHE_HOME.'/vim' 
从netrw参考手册：

>  *.netrwhist* See |g:netrw_dirhistmax| for how to control the quantity of history stack slots. The file ".netrwhist" holds history when netrw (and vim) is not active. By default, it's stored on the first directory on the user's |'runtimepath'|. 

在我的情况下， runtimepath的第一个path是~/.vim （使用:echo &runtimepath检查）。 我很好，所以我不需要改变g:netrw_home 。

> *g:netrw_dirhistmax* =10: controls maximum quantity of past history. May be zero to supppress history. 
所以，是的， let g:netrw_dirhistmax=0将停止写入历史文件。

### 参考资料
[VIM学习笔记 文件浏览器(Netrw)](https://zhuanlan.zhihu.com/p/61588081)                  
[How to disable netrw to generate history file?](http://vim.1045645.n5.nabble.com/How-to-disable-netrw-to-generate-history-file-td4248939.html)            


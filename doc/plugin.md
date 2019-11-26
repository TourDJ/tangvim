[返回首页](./index.md)
***

- [vim 插件](#plugin)   
  - [插件管理工具](#plugin_tool)     
    - [pathogen](#pathogen)         
    - [vundle](#vundle)       
  - [基本配置方式](#plugin_config)      
  - [常用插件](#plugin_use)      
    - [主题](#plugin_theme)        
    - [窗口管理](#plugin_windiow)       
    - [语法词法提示](#plugin_syntax)      
    - [html](#plugin_html)        
    - [python](#plugin_python)     
    - [工具](#plugin_tools)      
      - [doxygen](#doxygen)     
    
  

## <a id="plugin">vim 插件</a>

工欲善其事，必先利其器。
VIM 插件一般安装在 5 个地方， 存放插件的路径都列在“runtimepath”选项中， 我们可以使用 set 命令查看它：

     :set runtimepath?

相比sublime text3等现代编辑器，Vim缺乏默认的插件管理器，所有插件的文件都散布在~/.vim下的几个文件夹中。不过可以通过安装插件管理工具来管理插件，用户需要做的只是去Github上找到自己想要的插件的名字，安装，更新就可以用了。 

### <a id="plugin_tool">插件管理工具</a>
常用的 vim 插件管理工具：

#### <a id="pathogen">pathogen</a>    

pathogen 插件的安装：[Vim下的插件管理工具pathogen简介](https://www.cnblogs.com/litifeng/p/5597565.html) 


#### <a id="vundle>vunble</a>

安装：     

     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

常用命令：    

      :PluginList       - lists configured plugins
      :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
      :PluginSearch foo - searches for foo; append `!` to refresh local cache
      :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

### <a id="plugin_config">基本配置方式</a>
Vim支持把插件分割成多个文件。你可以在~/.vim下创建许多不同种类的文件夹来放置不同的内容。在Vim里，"插件(plugin)"有一个更专业的定义，它表示"~/.vim/plugins/下的一个文件"。

* `~/.vim/colors/`  Vim将会查找 `~/.vim/colors/mycolors.vim` 并执行它。 这个文件应该包括生成你的配色方案所需的一切Vimscript命令。

* `~/.vim/plugin/`  `~/.vim/plugin/` 下的文件将在每次Vim启动的时候执行。 这里的文件包括那些无论何时，在启动Vim之后你就想加载的代码。

* `~/.vim/ftdetect/` `~/.vim/ftdetect/`下的文件在每次你启动Vim的时候也会执行。ftdetect是"filetype detection"的缩写。 这里的文件仅仅负责启动检测和设置文件的filetype类型的自动命令。 这意味着它们一般不会超过一两行。

* `~/.vim/ftplugin/` `~/.vim/ftplugin/`下的文件则各不相同。一切皆取决于它的名字!
    * 当Vim把一个缓冲区的`filetype`设置成某个值时， 它会去查找`~/.vim/ftplugin/`下对应的文件。 比如：如果你执行`set filetype=derp`，Vim将查找`~/.vim/ftplugin/derp.vim`。 一旦文件存在`，Vim`将执行它。
    * Vim也支持在`~/.vim/ftplugin/`下放置文件夹。 再以我们刚才的例子为例：`set filetype=derp`将告诉Vim去执行`~/.vim/ftplugin/derp/`下的全部`*.vim`文件。 这使得你可以按代码逻辑分割在`ftplugin`下的文件。
因为每次在一个缓冲区中执行filetype时都会执行这些文件，所以它们只能设置buffer-local选项！ 如果在它们中设置了全局选项，所有打开的缓冲区的设置都会遭到覆盖！

* `~/.vim/indent/` `~/.vim/indent/`下的文件类似于`ftplugin`下的文件。加载时也是只加载名字对应的文件。`indent`文件应该设置跟对应文件类型相关的缩进，而且这些设置应该是buffer-local的。

* `~/.vim/compiler/` `~/.vim/compiler`下的文件非常类似于`indent`文件。它们应该设置同类型名的当前缓冲区下的编译器相关选项。

* `~/.vim/after/` `~/.vim/after`文件夹有点神奇。这个文件夹下的文件会在每次Vim启动的时候加载， 不过是在~/.vim/plugin/下的文件加载了之后。这允许你覆盖Vim的默认设置。实际上你将很少需要这么做，所以不用理它， 除非你有"Vim设置了选项x，但我想要不同的设置"的主意。

* `~/.vim/autoload/` `~/.vim/autoload`文件夹就更加神奇了。事实上它的作用没有听起来那么复杂。简明扼要地说：`autoload`是一种延迟插件代码到需要时才加载的方法。 我们将在重构插件的时候详细讲解并展示它的用法。

* `~/.vim/doc/` `~/.vim/doc/`文件夹提供了一个你可以放置你的插件的文档的地方。 Vim对文档的要求是多多益善(看看我们执行过的所有:help命令就知道)，所以为你的插件写文档是重要的。

环境变量 $VIMRUNTIME 用来找出各种支持文件。colors,plugins,docs都是在 VIMRUNTIME 目录下的。可以使用以下命令查看：

     :echo $VIMRUNTIME

### <a id="plugin_use">常用插件</a>

#### <a id="plugin_theme">主题</a> 

#### <a id="plugin_windiow">窗口管理</a> 

##### [taglist](https://github.com/vim-scripts/taglist.vim) 是一款基于 ctags 插件，在 vim 代码窗口旁以分割窗口形式显示当前的代码结构概览，增加代码浏览的便利。    

使用 Vundle 安装

    Plugin 'vim-scripts/taglist.vim'

若要默认打开 taglist，在 `~/.vimrc` 中加入：

    let Tlist_Auto_Open=1

taglist 与 ctags 的关联     

如果 ctags 的安装路径不再 $PATH 中，则需要手动设置 `Tlist_Ctags_Cmd` 值。修改~/.vim/plugin/taglist.vim文件，找到
`if !exitsts(loaded_taglist)` 这一行，并在其前面添加

    let Tlist_Ctags_Cmd="$PATH/ctags"
    

##### [nerdtree](https://github.com/scrooloose/nerdtree) vim 系统资源管理器插件

使用 Vundle 安装

    scrooloose/nerdtree

nerdtree 设置
```
let NERDTreeShowHidden=1    默认显示隐藏文件
```

nerdtree 快捷键
```
I        切换NERDTree资源管理器窗口中的隐藏文件
```

##### [tagbar](https://github.com/majutsushi/tagbar) Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. 

是 taglist 的替代？

使用 Vundle 安装

    Plugin 'majutsushi/tagbar'

映射快捷键：

    nnoremap <silent> <Leader>b :TagbarToggle<CR>

##### [winmanager](https://github.com/vim-scripts/winmanager) 实现类似 IDE 的窗口

使用 Vundle 安装

  vim-scripts/winmanager

winmanager 集成 NerdTree 和 Tagbar：
```vimscript
"下面的代码放到自己的vimrc配置中即可"
let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:AutoOpenWinManager = 1 "这里要配合修改winmanager.vim文件

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    "执行一个退出命令，关闭自动出现的窗口"
    exe 'q' 
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
  return 1
endfunction
noremap <f5> :NERDTreeFind<cr>

let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    "执行一个退出命令，关闭自动出现的窗口"
    exe 'q' 
    exe 'TagbarOpen'
endfunction
function! Tagbar_IsValid()
    return 1
endfunction
let g:tagbar_vertical = 30

" win manger插件要修改下，打开 winmanager/plugins/winmanager.vim ，在文件顶部加入下面的代码：
if g:AutoOpenWinManager
    " vim进入时自动执行 ToggleWindowsManager ，然后移动一次窗口焦点
    autocmd VimEnter * nested call s:ToggleWindowsManager()|1wincmd w 
endif
```

#### <a id="plugin_syntax">语法词法提示</a>      
#### <a id="plugin_html">html</a>        
#### <a id="plugin_python">python</a>   

#### <a id="plugin_tools">工具</a>
##### <a id="doxygen">Doxygen</a>
[Doxygen](https://github.com/vim-scripts/DoxygenToolkit.vim) 自动生成注释


使用 Vundle 安装

    Plugin 'vim-scripts/DoxygenToolkit.vim'

设置在 @author 区域自动填充的作者名称

    let g:DoxygenToolkit_authorName="zzq@moon.net" 

将光标定位到文件首行，输入`:DoxAuthor`，将插入文件头注释。       
将光标定位到数据结构声明或函数声明的第一行，输入`:Dox`，将生成数据结构或函数的注释。




#### [jsctags](https://github.com/sergioramos/jsctags) ctags 的 js 版本。

安装：

    npm install -g git+https://github.com/ramitos/jsctags.git

使用：

在工程目录下执行

    find . -type f -iregex ".*\.js$"            --查找当前路径下以.js结尾的文件
            -not -path "./node_modules/*"       --排除路径 node_midules
            -exec jsctags {} -f \;              --执行jstags -f给这些查找到的文件
            | sed '/^$/d'                       --删除空行
            | LANG=C                            --设置语言环境为C
            sort                                --然后排序 
            > tags                              --定向到 tags 文件
    

支持 jsx:

    find . -not -path "./node_modules/*" |egrep "\.jsx?$" |xargs jsctags {} -f \; 
    | sed '/^$/d' | LANG=C sort > tags
    
#### [vim-javascript](https://github.com/pangloss/vim-javascript) javascript 语法高亮

使用 Vundle 安装

    Plugin 'pangloss/vim-javascript'


#### [spf13-vim](https://github.com/spf13/spf13-vim) 一个 vim 的分发版插件
该插件继承了常用的 vim 插件，并配置了常用选项。

安装：

  curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
> Requires Git 1.7+ and Vim 7.3+


***

### 参考资料
* [Using Vim as a JavaScript IDE](http://www.dotnetsurfers.com/blog/2016/02/08/using-vim-as-a-javascript-ide/)      
* [Vim and Ctags](https://andrew.stwrt.ca/posts/vim-ctags/)     
* [Setting up Vim for React.js](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015)    



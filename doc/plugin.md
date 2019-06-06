[返回首页](./index.md)
***

- [vim 插件](#plugin)   
  - [插件管理工具](#plugin_tool)     
  - [基本配置方式](#plugin_config)      
  

## <a id="plugin">vim 插件</a>

工欲善其事，必先利其器。
VIM 插件一般安装在 5 个地方， 存放插件的路径都列在“runtimepath”选项中， 我们可以使用 set 命令查看它：

     :set runtimepath?

相比sublime text3等现代编辑器，Vim缺乏默认的插件管理器，所有插件的文件都散布在~/.vim下的几个文件夹中。不过可以通过安装插件管理工具来管理插件，用户需要做的只是去Github上找到自己想要的插件的名字，安装，更新就可以用了。

相关链接：    
[Setting up Vim for React.js](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015)    

### <a id="plugin_tool">插件管理工具</a>
常用的 vim 插件管理工具：

* pathogen       

pathogen 插件的安装：       
[Vim下的插件管理工具pathogen简介](https://www.cnblogs.com/litifeng/p/5597565.html) 


* vunble       

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

[Doxygen](https://github.com/vim-scripts/DoxygenToolkit.vim)     
自动生成注释



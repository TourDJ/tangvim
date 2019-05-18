  - [其他](#other)  
    - [vim7 升级 vim8](#vim8)     
    - [vim 文档](#doc)    
  
## <a id="other">其他</a> 
### <a id="vim8">vim7 升级到 vim8</a>

安装依赖

     yum install libXt-devel gtk2-devel
     yum -y install python-devel ruby ruby-devel perl perl-devel perl-ExtUtils-Embed
     yum install ncurses-devel
     yum install ctags

下载源码并编译安装

     ./configure --disable-selinux --enable-perlinterp=yes --enable-python3interp=yes --enable-rubyinterp=yes --enable-cscope --enable-gui=auto --with-features=huge --enable-multibyte --enable-xim --with-x --with-gnome --with-compiledby="tang" --prefix=/usr/local/vim8
     make
     make install
     
#### ubuntu 安装 vim

    sudo apt install vim


ppa源来安装

    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim

如果您想要卸载它, 请使用如下命令

    sudo apt remove vim
    sudo add-apt-repository --remove ppa:jonathonf/vim


### <a id="doc">vim 文档</a>

* [vim cookbook](http://www.oualline.com/vim-cook.html#last)     
* [vim doc](http://vimcdoc.sourceforge.net/doc/quickref.html)    
* [Vim Cheat Sheet](https://vim.rtorr.com/) 

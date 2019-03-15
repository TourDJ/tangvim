
# vim for python

## 验证安装
确保你已经安装了7.3版本以上、支持Python的Vim编辑器。
* 你可以再次运行 vim --version 进行确认。
* 如果你想知道Vim中使用的Python版本，你可以在编辑器中运行

		:python import sys; print(sys.version)

如果报错，那么你的编辑器就不支持Python语言，需要重装或重新编译。成功会输出你的编辑器当前的Python版本:
3.6.5 (default, Apr  1 2018, 05:46:30)
[GCC 7.3.0]

## Vim 开启 python/python3 支持



## YouCompleteMe 安装
* Ubuntu 16.04 and later:

Install development tools, CMake, and Python headers:

	sudo apt install build-essential cmake python3-dev

Compiling YCM with semantic support for C-family languages through libclang:

	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py

[Detail Installation](https://github.com/Valloric/YouCompleteMe#linux-64-bit)    
[Building Vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)    


## pip3 and ipython3 install
pip3 的install, upgrade and remove

	Install
	sudo apt-get install python3-pip

	Upgrade
	sudo pip3 install --upgrade pip

	Remove
	sudo apt-get remove python3-pip

ipython3 instlal

	Install ipython3 with pip
	pip3 install ipython

	Find the ipython install path
	find / -name ipython3

	Link ipython3 to PATH
	sudo ln -s /home/tang/.local/bin/ipython3 /usr/bin/ipython3


## Error
* Sorry, the command is not available in this version: py << EOF    

	just changed the line to `py3 << EOF`



## Vim 指令

### :SILENT
一般 Vim 执行外部命令后会提示你请按ENTER或其他命令继续刷新窗口，如果你想避免刷新就可以用:silent命令，而且:silent命令还可以去掉执行外部程序时的“Hit any key to close this window…” 

    :silent {command}

### !START VIM异步执行命令
在Vim下用!:command会同步方式运行外部程序从而阻塞Vim窗口，等待程序运行完成才按任意键返回，而如果用异步方式的话就不会出现这种情况。Vim异步运行命令是：

    :!start {command}

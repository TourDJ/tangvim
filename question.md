

#### Press `CTRL+S` cause stuck
原因： `CTRL+S` 终止屏幕输出（即停止回显），你敲的依然有效，只是看不见。`CTRL+Q` 恢复屏幕输出，你刚才敲的都显示出来了。

#### ubuntu安装完自带的vim是很不好用，是因为自带的是tiny 模式。卸载命令：

    sudo apt-get remove --purge vim-common
--purge 是完全删除，会连配置文件一起删除


#### E21: Cannot make changes, 'modifiable' is off
方法：
```vimscript
:set modifiable
or
:set ma
```

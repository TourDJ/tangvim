
## 宏
### 宏的命令
宏的命令格式：

    qx
    x是缓冲器的名称，你也可以指定其他a-z或者0-9中的任一名称

### 宏的录制
录制宏的步骤：    
1. 在正常模式下（非insert模式、非visual模式）按下q键盘
2. 选择a-z或0-9中任意一个作为缓冲器的名字，准备开始录制宏
3. 正常的操作，此次所有的操作都会被记录在上一步中定义的缓冲器中
4. 在非insert模式下输入q停止宏的录制
5. 使用@ + 第二步中定义的缓冲器的名字即可

例如，将下面的内容包裹在 `System.out.println("")` 中 ：

```
Hello World!                                                                           
Hi!
OK!
Yeap!!!
```
即变成如下内容：
```
System.out.println("Hello World!")
System.out.println("Hi!")    
System.out.println("OK!")    
System.out.println("Yeap!!!") 
```
操作步骤如下：
* 首先把光标移动line1上，输入qt，准备开始录制，缓冲器的名字为t
* 录制的动作为：
  1. shift + ^ 回到行首
  2. 按下i键进入insert模式
  3. 输入“System.out.println(”
  4. 按下esc键回到正常模式
  5. shift + $ 回到行尾部
  6. 按下i键进入insert模式
  7. 输入“);”
  8. 按下esc键回到正常模式
* 按下q停止录制
* 然后把光标移动到下面一行的任意位置输入 @ + t 即可

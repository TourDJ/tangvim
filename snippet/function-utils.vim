
" 根据Vim的 sort() 函数修改
" vim的 sort 就地重排列表，所以我们先创建一个列表的副本，并排序副本, 
" 这样原本的列表不会被改变。
" 这样就避免了副作用，并帮助我们写出更容易推断和测试的代码。
function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

" 名称： Reversed
" 功能： 接受一个列表并返回一个新的倒置了元素的列表。
" 参数： l 列表
" 使用： 
function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

" 返回一个在原列表的基础上增加了给定值的新列表。
function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

" 返回一个给定索引上的元素被替换成新值的新列表。
function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction

" 返回一个给定索引上的元素被移除的新列表。
function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction


" ~~~~~~~~~~~~ 高阶函数

" 名称： Mapped
" 功能： 对列表中的每一个元素应用传入的函数
" 参数： fn 执行函数
"       l 列表
" 使用： 
"   let mylist = [[1, 2], [3, 4]]
"   echo Mapped(function("Reversed"), mylist)
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

" 名称： Filtered
" 功能： 返回一个列表的副本，过滤掉所有长度为0的元素。
" 参数： fn 执行函数
"       l 列表
" 使用： 
"   let mylist = [[1, 2], [], ['foo'], []]
"   echo Filtered(function('len'), mylist)
function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

" 名称： Removed
" 功能： 返回非真值的元素。
" 参数： fn 执行函数
"       l 列表
" 使用： 
"   let mylist = [[1, 2], [], ['foo'], []]
"   echo Removed(function('len'), mylist)
function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, '!' . string(a:fn) . '(v:val)')
    return new_list
endfunction

" 启用或关闭语法突出显示功能
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction
nmap <silent>  ;s  :call ToggleSyntax()<CR>

" 创建中心标题
function! CapitalizeCenterAndMoveDown()
   s/\<./\u&/g   "Built-in substitution capitalizes each word
   center        "Built-in center command centers entire line
   +1            "Built-in relative motion (+1 line down)
endfunction
nmap <silent>  \C  :call CapitalizeCenterAndMoveDown()<CR>

" ======================== BEGIN 
" 突出显示经常拼错的单词
"Create a text highlighting style that always stands out...
highlight STANDOUT term=bold cterm=bold gui=bold
 
"List of troublesome words...
let s:words = [
             \ "it's",  "its",
             \ "your",  "you're",
             \ "were",  "we're",   "where",
             \ "their", "they're", "there",
             \ "to",    "too",     "two"
             \ ]
 
"Build a Vim command to match troublesome words...
let s:words_matcher
\ = 'match STANDOUT /\c\<\(' . join(s:words, '\|') . '\)\>/'
 
"Toggle word checking on or off...
function! WordCheck ()
   "Toggle the flag (or set it if it doesn't yet exist)...
   let w:check_words = exists('w:check_words') ? !w:check_words : 1
 
   "Turn match mechanism on/off, according to new state of flag...
   if w:check_words
      exec s:words_matcher
   else
      match none
   endif
endfunction
 
"Use ;p to toggle checking...
nmap <silent>  ;p  :call WordCheck()<CR>
" 示例
" It's easy to adapt the syntax-toggling script shown earlier to create other useful tools. 
" For example, if there is a set of words that you frequently misspell or misapply, you could 
" add a script toyour .vimrc to activate Vim's match mechanism and highlight problematic words 
" when you're proofreading text.

" ======================== END



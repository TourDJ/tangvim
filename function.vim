
" 根据Vim的 sort() 函数修改
" vim的 sort 就地重排列表，所以我们先创建一个列表的副本，并排序副本, 
" 这样原本的列表不会被改变。
" 这样就避免了副作用，并帮助我们写出更容易推断和测试的代码。
function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

" 接受一个列表并返回一个新的倒置了元素的列表。
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


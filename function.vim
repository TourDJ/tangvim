
" 根据Vim的 sort() 函数修改
" vim的 sort 就地重排列表，所以我们先创建一个列表的副本，并排序副本, 
" 这样原本的列表不会被改变。
" 这样就避免了副作用，并帮助我们写出更容易推断和测试的代码。
function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

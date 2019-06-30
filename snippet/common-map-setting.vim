
" ============ 常用映射 ============

" 显示当前foldcolumn选项的值, 使用： 按下<leader>f
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    echom &foldcolumn
endfunction

    
" 显示或隐藏折叠状态条
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction


" 显示隐藏窗口
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction


" 在vim中执行python代码
map <F5> :call RunPython()<CR>
func! RunPython()
    exec "W"
    if &filetype == 'python'
        exec "!time python2.7 %"
    endif
endfunc


" 设置两个键映射（key-map）来增加或减小当前的表空间
nmap <silent> ]] :let &tabstop += 1<CR>
nmap <silent> [[ :let &tabstop -= &tabstop > 1 ? 1 : 0<CR>

" 插入生成的日期
imap <silent> <C-D><C-D> <C-R>=strftime("%e %b %Y")<CR>
" 插入当前时间
imap <silent> <C-T><C-T> <C-R>=strftime("%l:%M %p")<CR>

" 当前的工作目录创建缩写
iabbrev <silent> CWD <C-R>=getcwd()<CR>
" 嵌入一个简单的计算器
imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>



" 改进纵向复制，忽略空行
"Locate and return character "above" current cursor position...
function! LookUpwards()
   "Locate current column and preceding line from which to copy...
   let column_num      = virtcol('.')
   let target_pattern  = '\%' . column_num . 'v.'
   let target_line_num = search(target_pattern . '*\S', 'bnW')
 
   "If target line found, return vertically copied character...
   if !target_line_num
      return ""
   else
      return matchstr(getline(target_line_num), target_pattern)
   endif
endfunction
 
"Reimplement CTRL-Y within insert mode...
imap <silent>  <C-Y>  <C-R><C-R>=LookUpwards()<CR>





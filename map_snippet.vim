
## <a id="snippet">常用映射 snippet</a>

* 显示当前foldcolumn选项的值

        nnoremap <leader>f :call FoldColumnToggle()<cr>

        function! FoldColumnToggle()
            echom &foldcolumn
        endfunction
使用： 按下<leader>f
    
* 显示或隐藏折叠状态条

        nnoremap <leader>f :call FoldColumnToggle()<cr>

        function! FoldColumnToggle()
            if &foldcolumn
                setlocal foldcolumn=0
            else
                setlocal foldcolumn=4
            endif
        endfunction
使用： 按下<leader>f

* 显示隐藏窗口

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

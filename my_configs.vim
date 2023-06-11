set nu
" 设置分割窗口分割线 以及缓冲区末尾空行的 ~
set fillchars=vert:\|,eob:\ 
" 给字符加引号
nnoremap <Leader>' viw<esc>bi"<esc>ea"<esc>"

" 在行尾输入分号
nnoremap <Leader>; mzA;<esc>`z

" 删除当前行
nnoremap <C-d> dd
inoremap <C-d> <esc>ddi

inoremap <leader>pp <esc>:setlocal paste!<CR>i


" 根据文件后缀执行不同操作的映射
nnoremap <leader>. :call ExecuteSnippet()<CR>

function! ExecuteSnippet()
    let l:file_extension = expand('%:e')
    let l:snippet_file = ''
    if l:file_extension == 'c'
        let l:snippet_file = '~/.vim_runtime/sources_non_forked/vim-snippets/snippets/c.snippets'
    elseif l:file_extension == 'py'
        let l:snippet_file = '~/.vim_runtime/sources_non_forked/vim-snippets/snippets/python.snippets'
    elseif l:file_extension == 'vim'
        let l:snippet_file = '~/.vim_runtime/sources_non_forked/vim-snippets/snippets/vim.snippets'
    elseif l:file_extension == 'sh'
        let l:snippet_file = '~/.vim_runtime/sources_non_forked/vim-snippets/snippets/sh.snippets'
    endif

    let l:win_num = bufwinnr(l:snippet_file)
    if l:win_num > 0
        execute l:win_num . 'close'
    elseif l:snippet_file != ''
        execute 'rightbelow vs ' . l:snippet_file
    endif

    wincmd p
endfunction

" 关闭snippets文件的自动折叠
autocmd FileType snippets setlocal foldmethod=manual
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && (exists('b:NERDTree') && b:NERDTree.isTabTree() || &filetype == 'snippets') | quit | endif

map <leader>q :q!<cr>
map <leader>x :x<cr>


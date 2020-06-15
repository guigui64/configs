set textwidth=100

" function! ClangFormat()
"     let l:lines = "all"
"     py3f /usr/share/vim/addons/syntax/clang-format.py
" endfunction
" augroup clangfmt
"     au!
"     autocmd BufWritePre *.h,*.c,*.cc,*.cpp call ClangFormat()
" augroup END

nnoremap <leader>cl :! clang -Wall -Werror -Wextra -std=c99 %<CR>

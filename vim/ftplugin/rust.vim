nnoremap <leader>rr :RustRun<CR>

augroup Rust
    autocmd!
    autocmd BufWritePre <buffer> execute ':RustFmt'
augroup END

nnoremap <leader>cr :Crun<cr>
nnoremap <leader>cc :Ccheck<cr>
nnoremap <leader>ct :Ctest<cr>

nnoremap <leader>rr :RustRun<cr>

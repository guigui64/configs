nnoremap <leader>rr :RustRun<CR>

augroup Rust
    autocmd!
    autocmd BufWritePre <buffer> execute ':RustFmt'
augroup END

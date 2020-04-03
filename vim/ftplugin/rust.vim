nnoremap <leader>rr :RustRun<CR>

augroup Rust
    autocmd!
    autocmd BufWritePre <buffer> execute ':RustFmt'
augroup END

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

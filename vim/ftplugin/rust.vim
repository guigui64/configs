nnoremap <leader>rr :RustRun<CR>

augroup Rust
    autocmd!
    autocmd BufWritePre <buffer> execute ':RustFmt'
augroup END

" vim-racer config
let g:racer_experimental_completer = 1
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

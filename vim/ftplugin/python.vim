nnoremap <leader>p :! python3 % <CR>

" Python PEP8 enforcer
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=100
set autoindent
set fileformat=unix

" Format
augroup FileType python
    autocmd!
    autocmd bufwritepre <buffer> execute ':Black'
    autocmd bufwritepre <buffer> execute ':Isort'
augroup END

" Go to outline like
nnoremap <leader>o /def 

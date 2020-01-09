nnoremap <leader>p :! python3 % <CR>

" Python PEP8 enforcer
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set autoindent
set fileformat=unix

" Format
augroup pyfmt
	au!
	autocmd BufWritePre *.py execute ':Black'
	autocmd BufWritePre *.py execute ':Isort'
augroup END

" Go to outline like
nnoremap <leader>o /def 

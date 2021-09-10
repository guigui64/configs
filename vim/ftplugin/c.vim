set textwidth=100

nnoremap <leader>cl :! clang -Wall -Werror -Wextra -std=c99 %<CR>
iabbrev tracedebug fprintf(stderr, "%s:%d\n", __FUNCTION__, __LINE__);

" Switch between source and header files
" nnoremap <leader>sw :e %:p:s/.hpp?$/.X123X/:s/.cpp$/.hpp/:s/.X123X$/.cpp/:s/.h$/.X123X/:s/.c$/.h/:s/.X123X$/.c/<CR>
nnoremap <leader>sfw
  \ :call fzf#vim#files('.', fzf#vim#with_preview({'options': ['--query', expand('%:t:r')]}))<CR>
nmap <leader>sw :CocCommand clangd.switchSourceHeader<CR>

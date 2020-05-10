" my vimrc file - Guillaume Comte
" inspired from Tim Pope sensible and Steve Losh 'Learn Vimscript the Hard Way'
" lessons
"
" Use za to toggle folds

" ### General settings ### {{{

set nocompatible " Don't try to be vi compatible

filetype off " Helps force plugins to load correctly when it is turned back on below
filetype plugin indent on

syntax on " Turn on syntax highlighting

set autowrite " Write the content of the file automatically when building

set exrc " Execute working directory .vimrc in a secure fashion
set secure

set number " Show line numbers
set norelativenumber

set cursorline " Show current line
set cursorlineopt=number " Only highlight the current line number

set ruler " Show file stats
set laststatus=2 " Status bar
" set cmdheight=2 " Give more space for displaying messages
set showmode " Last line
set showcmd
set wildmode=longest,list,full
set wildmenu
set visualbell " Blink cursor on error instead of beeping (grr)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set path+=** " Search down recursively (for :find, completion etc.)

set runtimepath+=~/.fzf

set encoding=utf-8 " Encoding

set wrap
set textwidth=79
set formatoptions=cqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces

set ttymouse=sgr " For mouse in tmux (?) and to handle more than 220 cols
set mouse=a " Mouse
let g:NERDTreeMouseMode=3
set scrolloff=3 " Cursor motion
set backspace=indent,eol,start

set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

set hidden " Allow hidden buffers

set ttyfast " Rendering

" Persistent undo
set undofile

" Backup directories
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Pick a leader key : \ being the default one
let mapleader = ","

" Visualize tabs and newlines
set listchars=tab:→\ ,trail:· ",eol:↲
set list " To enable by default
" Toggle on/off listchars
noremap <leader>l :set list!<CR>

" splits
set splitright " for :vsplit
set splitbelow " for :split

" }}}

" Search settings {{{

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" clear search
noremap <leader><space> :let @/=''<cr>

" }}}

" Autocommand settings {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END

" Auto source .vimrc file when edited
autocmd! BufWritePost .vimrc source %

augroup templates
    autocmd BufNewFile *.pl execute "0r ~/.vim/templates/skeleton.pl" | normal G
augroup END

" }}}

" Mappings {{{

" Move up/down display lines (rather than physical lines)
nnoremap j gj
nnoremap k gk

" tree
noremap <leader>tt :NERDTreeToggle<CR>

" tagbar
noremap <leader>tgb :TagbarToggle<CR>

" save
nnoremap <leader>s :update<CR>

function! ToggleNumbers()
    if (&relativenumber == 1)
        set nu
        set nornu
    else
        set nu
        set rnu
    endif
endfunc
noremap <C-n> :call ToggleNumbers()<CR>

" Quickfix
map <C-l> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" Formatting
noremap <F5> mzgggqG`z

" vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" move one line down
noremap - ddp
" move one line up
noremap + ddkP

" replace spaces by tabs
noremap <leader>stt :s/    /\t/g<CR>:let @/=''<CR>

" term
nnoremap <leader>tb :botright terminal ++rows=10<CR>

" auto }
inoremap {<CR>  {<CR>}<Esc>O

" Forget thoses keys!!
nnoremap <up>       <nop>
nnoremap <down>     <nop>
nnoremap <right>    <nop>
nnoremap <left>     <nop>

" toggle background
noremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" save with leader s
noremap <leader>s :update<CR>

" save without format or any aucmd
noremap <leader>zs :noa w<CR>

" fzf find files, mappings, buffers etc.
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ft :Tags<CR>

" new tab
nnoremap <leader>tn :tabnew<CR>

" omni completion
inoremap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" Coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd :<C-u>call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" }}}

" Abbreviations {{{

iabbrev adn     and
iabbrev teh     the
iabbrev uint    uint32_t
iabbrev unint   uint32_t

" }}}

" Programming languages {{{

" Jenkinsfile is groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" }}}

" Looks {{{

" Color scheme
set background=light
set termguicolors
colorscheme solarized8
" Change SpecialKey settings (tabs) after loading all plugins (VimEnter cheat)
au VimEnter * highlight clear SpecialKey | highlight SpecialKey ctermfg=14 ctermbg=NONE
" call it again in case reloading vimrc
highlight SpecialKey ctermfg=14 ctermbg=NONE

" Airline config
let g:airline_theme='solarized'
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#ale#enabled=1
let g:airline#extensions#obsession#enabled = 1

" }}}

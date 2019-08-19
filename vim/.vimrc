" my vimrc file - Guillaume Comte
" inspired from Tim Pope sensible and Steve Losh 'Learn Vimscript the Hard Way'
" lessons
"
" Use za to toggle folds

" ### General settings ### {{{

set nocompatible " Don't try to be vi compatible

filetype off " Helps force plugins to load correctly when it is turned back on below
" Plugins loading by tpope/vim-pathogen
execute pathogen#infect()
filetype plugin indent on

syntax on " Turn on syntax highlighting

set autowrite " Write the content of the file automatically when building

set exrc " Execute working directory .vimrc in a secure fashion
set secure

set number " Show line numbers
set relativenumber

set ruler " Show file stats
set laststatus=2 " Status bar
set showmode " Last line
set showcmd
set wildmenu
set visualbell " Blink cursor on error instead of beeping (grr)

set path+=** " Search down recursively (for :find, completion etc.)

set encoding=utf-8 " Encoding

set wrap
set textwidth=79
set formatoptions=cqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab " use tabs
set noshiftround

set mouse=a " Mouse
set scrolloff=3 " Cursor motion
set backspace=indent,eol,start

set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

set hidden " Allow hidden buffers

set ttyfast " Rendering

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set list " To enable by default
" Toggle on/off listchars
noremap <leader>l :set list!<CR>

" Pick a leader key : \ being the default one
let mapleader = ","

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

augroup templates
    autocmd BufNewFile *.pl execute "0r ~/.vim/templates/skeleton.pl" | normal G
augroup END

" }}}

" Mappings {{{

" Move up/down display lines (rather than physical lines)
nnoremap j gj
nnoremap k gk

noremap <leader>tt :NERDTreeToggle<CR>

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
noremap <leader>q gqip

nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" move one line down
noremap - ddp
" move one line up
noremap + ddkP

inoremap {<CR>  {<CR>}<Esc>O

" Forget thoses keys!!
" nnoremap <up>       <nop>
" nnoremap <down>     <nop>
" nnoremap <right>    <nop>
" nnoremap <left>     <nop>

" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" " Auto-enable auto-formatting C files
" autocmd FileType c,cpp ClangFormatAutoEnable

augroup filetype_c
    autocmd!
    autocmd BufWritePre,BufRead *.c,*.cpp,*.h,*.hpp :normal gg=G
augroup END

" }}}

" Abbreviations {{{

iabbrev adn     and
iabbrev teh     the
iabbrev uint    uint32_t
iabbrev unint   uint32_t

" }}}

" Looks {{{

" Color scheme (terminal)
set t_Co=256
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized

" Airline config
let g:airline_theme='solarized'
let g:airline_powerline_fonts=0

" }}}

" Programming languages {{{

" Go {{{

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>i  <Plug>(go-imports)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" }}}

" }}}


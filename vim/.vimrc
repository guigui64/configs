" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (vundle)
execute pathogen#infect()
:Helptags

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Map NERDTree to Ctrl+t
noremap <C-t> :NERDTreeToggle<CR>

" Turn on syntax highlighting
syntax on

" Write the content of the file automatically when building
set autowrite

" Pick a leader key : \ being the default one
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
"set relativenumber
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

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" clear search
noremap <leader><space> :let @/=''<cr>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Quickfix
map <C-l> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" Formatting
noremap <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
noremap <leader>l :set list!<CR>

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme zenburn

" Airline config
let g:airline_theme='zenburn'
let g:airline_powerline_fonts=1

" Maps
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" move one line down
noremap - ddp
" move one line up
noremap + ddkP

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Forget thoses keys!!
" nnoremap <up>       <nop>
" nnoremap <down>     <nop>
" nnoremap <right>    <nop>
" nnoremap <left>     <nop>

" Abbreviations
" used for auto-correcting typos in insert mode
iabbrev adn     and
iabbrev teh     the
iabbrev uint    uint32_t
iabbrev unint   uint32_t

" Go
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

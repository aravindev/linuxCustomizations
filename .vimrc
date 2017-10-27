" status line
set laststatus=2
syntax enable
" turn on line numbering
set number
" enable history
set history=10000
" enable dark background for solarized
set background=dark
colorscheme solarized
" enable intendation
set ai
set si
" fix for screen lag during fast scrolls
set lazyredraw
" tab spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" display tabs as chars
set list listchars=tab:»·,trail:·
" go to line where we were the last time we opened the file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

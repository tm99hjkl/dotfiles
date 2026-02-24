highlight VertSplit ctermfg=231 ctermbg=16
highlight StatusLine ctermfg=231 ctermbg=16
highlight StatusLineNC ctermfg=231 ctermbg=16
highlight Normal ctermfg=16
highlight Comment ctermfg=248
highlight clear Constant
highlight clear Identifier
highlight clear Statement
highlight clear PreProc
highlight clear Type
highlight clear Special
highlight clear Underlined
highlight clear Todo

set autoindent
set expandtab
set fillchars=vert:\│
set hlsearch
set nowrap
set shiftwidth=4
set tabstop=4

inoremap jk <ESC>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <Esc>a :bp<CR>
noremap <Esc>s :bn<CR>
noremap <Esc>c :bd<CR>

autocmd FileType make setlocal noexpandtab

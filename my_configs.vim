nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set nu
set nowrap

let g:neocomplcache_enable_at_startup = 1

" For latex
" let g:Tex_ViewRule_pdf = 'Skim'
" let g:Tex_MultipleCompileFormats = 'dvi,pdf'
" set iskeyword+=:
" set iskeyword+=-


" For latex
nmap <leader>ll :w <bar> !make silent<cr>
nmap <leader>ll :w <bar> !make<cr>
nmap <leader>lv :!make view<cr>
nmap <leader>la :w <bar> !make && make view<cr>
nmap <leader>lcd :lcd %:p:h<cr>
nmap <leader>ltw :se tw=80<cr>

" for vim-markdown-folding
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

nnoremap <Space> za
noremap <F9> zfa}

" For indent
set cindent
autocmd FileType python setlocal foldmethod=indent|:normal zR

autocmd FileType markdown setlocal wrap 

" For coding style
autocmd FileType python,c,cpp match ErrorMsg '\%>79v.\+'

" Press F5 in normal mode or in insert mode to insert the current datestamp: :help i_CTRL-R
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" for temporary textwidth. Useful for comments
:noremap <F8> :setlocal tw=79<CR> <bar> :normal gqap<CR> <bar> :setlocal tw=0<CR>






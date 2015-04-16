nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set nu

let g:neocomplcache_enable_at_startup = 1

" For latex
" let g:Tex_ViewRule_pdf = 'Skim'
" let g:Tex_MultipleCompileFormats = 'dvi,pdf'
" set iskeyword+=:
" set iskeyword+=-


" For latex
nmap <leader>ll :!make<cr>
nmap <leader>lv :!make view<cr>


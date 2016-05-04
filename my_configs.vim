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
" Latexmk will allow you to pinpoint error in file
nmap <leader>lm :w <bar> Latexmk<cr> 
nmap <leader>lv :!make view<cr>
nmap <leader>la :w <bar> !make && make view<cr>
nmap <leader>lcd :lcd %:p:h<cr>
nmap <leader>ltw :se tw=80<cr>
autocmd FileType tex setlocal tw=80
autocmd FileType tex setlocal nonumber

" re-format a paragraph
nnoremap <leader>r gq}

" For latex-box
" Toggle TOC
nmap <leader>lt :LatexTOCToggle<cr>



" for vim-markdown-folding
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

nnoremap <Space> za
noremap <F9> zfa}

" For indent
set cindent
autocmd FileType python,r setlocal foldmethod=indent|:normal zR

autocmd FileType markdown setlocal wrap 

" For coding style
autocmd FileType python,c,cpp match ErrorMsg '\%>79v.\+'

" Press F5 in normal mode or in insert mode to insert the current datestamp: :help i_CTRL-R
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" for temporary textwidth. Useful for comments
:noremap <F8> :setlocal tw=79<CR> <bar> :normal gqap<CR> <bar> :setlocal tw=0<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Ctags
" To use Ctags, in Ubuntu, you need to do :
" sudo apt-get install exuberant-ctags
" Useful tutorial
" http://amix.dk/blog/post/19329
" http://www.thegeekstuff.com/2009/04/ctags-taglist-vi-vim-editor-as-sourece-code-browser/
" We only have ctags, taglist is not working. So don't bother read taglist part of the articles
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c,*.py call UpdateTags()


" For taglist
nmap <leader>tl :TlistToggle<cr>

" For tagbar
" Use TagBar instead of TagList, it is better
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>to :TagbarOpen<cr>
nmap <leader>tp :TagbarTogglePause<cr>
nmap <leader>ttt :TagbarOpenAutoClose<cr>
" autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType python TagbarToggle
setlocal updatetime=800
let g:tagbar_sort = 0 " sort according to in-file order


syntax enable
set background=dark
let g:solarized_termcolors=16
set t_Co=16
colorscheme solarized



" For R
" https://github.com/majutsushi/tagbar/wiki#r
" Note that you also need to edit ~/.ctags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function Dirsub(target, replacement, files)
    let cmd0 = "args ".a:files
    echo cmd0
    exe cmd0

    let cmd1 = "vimgrep /".a:target."/g ".a:files
    echo cmd1
    exe cmd1

    Qargs

    let cmd2 = "argdo %s/".a:target."/".a:replacement."/g"
    echo cmd2
    exe cmd2
    argdo update
endfunction




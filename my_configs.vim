set nocompatible

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set nu
set nowrap
set textwidth=0
set colorcolumn=80
set cursorline


let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:neocomplcache_enable_at_startup = 1

" For latex
" let g:Tex_ViewRule_pdf = 'Skim'
" let g:Tex_MultipleCompileFormats = 'dvi,pdf'
" set iskeyword+=:
" set iskeyword+=-

" For latex-box
let g:LatexBox_split_width = 50
filetype plugin on
let g:LatexBox_Folding = 1

" For latex
"nmap <leader>ll :w <bar> !make silent<cr>
nmap <leader>ll :w <bar> !make<cr>
" Latexmk will allow you to pinpoint error in file
nmap <leader>lm :w <bar> Latexmk<cr> 
nmap <leader>lv :!make view<cr>
nmap <leader>la :w <bar> !make && make view<cr>
nmap <leader>lcd :lcd %:p:h<cr>
nmap <leader>ltw :se tw=70<cr>
nmap <leader>lcc :se tabstop=2 <bar> se shiftwidth=2 <cr>
" highlight the word under cursor
nmap <leader>h *N
" visually select lines of an enclosed area after cursor. For example, 
" Foo(xx, xx); // the whole line fill be selected.
nmap <leader>sp V%
" Select current line and the {} scope after it. This can select the whole
" function below.
" void Foo(xx) {
"   xxx {}
" }
" Or the whole scope here:
" {
"   ..Foo();
" }
nmap <leader>s{ V/{<CR>%:nohl<CR>


autocmd FileType tex setlocal tw=70
autocmd FileType tex setlocal nonumber
autocmd FileType tex setlocal noai nocin nosi inde=

" For day planning
"nmap <leader>ltw =70<cr>
nnoremap <leader>d i[DONE] <Esc>
inoremap <leader>d <C-R>[[DONE] 

nnoremap <leader>a i[PARTIAL] <Esc>
inoremap <leader>a <C-R>[[PARTIAL] 

nnoremap <leader>s i[SKIPPED] <Esc> 
inoremap <leader>s <C-R>[[SKIPPED] 

nnoremap <leader>n i[NOT STARTED] <Esc> 
inoremap <leader>n <C-R>[[NOT STARTED] 

nnoremap <leader>time "=strftime("%H:%M") <CR>P i <Esc> 
inoremap <leader>time <C-R>=strftime("%H:%M")<CR> 

:nnoremap <leader>date "=strftime("%a %x")<CR>P i <Esc> 
:inoremap <leader>date <C-R>=strftime("%a %x")<CR>

nnoremap <leader>sessions i- 08:00-08:30<CR>- 08:30-09:00<CR>- 09:00-09:30<CR>- 09:30-10:00<CR>- 10:00-10:30<CR>- 10:30-11:00<CR>- 11:00-11:30<CR>- 11:30-12:00<CR>- 12:00-12:30<CR>- 12:30-01:00<CR>- 01:00-01:30<CR>- 01:30-02:00<CR>- 02:00-02:30<CR>- 02:30-03:00<CR>- 03:00-03:30<CR>- 03:30-04:00<CR>- 04:00-04:30<CR>- 04:30-05:00<CR><Esc>
inoremap <leader>sessions - 08:00-08:30<CR>- 08:30-09:00<CR>- 09:00-09:30<CR>- 09:30-10:00<CR>- 10:00-10:30<CR>- 10:30-11:00<CR>- 11:00-11:30<CR>- 11:30-12:00<CR>- 12:00-12:30<CR>- 12:30-01:00<CR>- 01:00-01:30<CR>- 01:30-02:00<CR>- 02:00-02:30<CR>- 02:30-03:00<CR>- 03:00-03:30<CR>- 03:30-04:00<CR>- 04:00-04:30<CR>- 04:30-05:00<CR>




" Fot tab nav
nnoremap H gT
nnoremap L gt

" Exit to normal mode in terminal
tnoremap <ESC><ESC> <C-\><C-N>
nmap <leader>cl! :bd!<cr>:term<cr>

" For html
autocmd FileType htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" re-format a paragraph
"nnoremap <leader>r gq}
"nnoremap <leader>r :se tw=79 <Esc> gq} :se tw=0 <CR>

" For latex-box
" Toggle TOC
nmap <leader>lt :LatexTOCToggle<cr>




nnoremap <Space> za
noremap <F9> zfa}

" For indent
autocmd FileType python,r,htmldjango,html,javascript,c,cpp,cxx,cc setlocal foldmethod=indent|:normal zR
autocmd FileType c,cpp,cxx,cc setlocal cindent
autocmd FileType c,cpp,cxx,cc setlocal tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType markdown setlocal wrap 
autocmd FileType markdown setlocal tw=0

autocmd FileType makefile setlocal expandtab=0

" For coding style
"autocmd FileType python,c,cpp match ErrorMsg '\%>79v.\+'

" Press F5 in normal mode or in insert mode to insert the current datestamp: :help i_CTRL-R
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>


" for temporary textwidth. Useful for comments
":noremap <F8> :setlocal tw=79<CR> <bar> :normal gqap<CR> <bar> :setlocal tw=0<CR>
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

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
  "let resp2 = system('find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags')
endfunction
autocmd BufWritePost *.cc,*.cpp,*.h,*.c,*.py,*.js call UpdateTags()


" For taglist
nmap <leader>tl :TlistToggle<cr>

" For tagbar
" Use TagBar instead of TagList, it is better
nmap <leader>tt :TagbarToggle<cr>
nmap <leader>to :TagbarOpen fj<cr>
nmap <leader>tp :TagbarTogglePause<cr>
nmap <leader>ttt :TagbarOpenAutoClose<cr>
" autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType python TagbarToggle
setlocal updatetime=800
let g:tagbar_sort = 0 " sort according to in-file order


" For NERDTree
nmap <leader>nt :NERDTreeFocus<cr>


syntax enable
set background=dark
"let g:solarized_termcolors=256
"set t_Co=256
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
    " Note that target and replacement may need escape chars because
    " you are passing them around. 
    " For example, Dirsub("\<file01\>", "filefirst", "**/*.py") won't work
    " You should use Dirsub("\\<file01\\>", "filefirst", "**/*.py")
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

" Google VIM
source /usr/share/vim/google/google.vim
Glug youcompleteme-google
let g:ycm_key_detailed_diagnostics = '<leader>dd'

" Codefmt
Glug codefmt
Glug codefmt-google
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
  " Add more filetypes here
augroup END

nnoremap <leader>fc :FormatCode<CR>
vnoremap <leader>fc :FormatLines<CR>



" ultisnips
Glug ultisnips-google
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim_runtime/sources_non_forked/ultisnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" piper files
"Glug piper plugin[mappings]='pf'
nnoremap <leader>pf :PiperSelectActiveFiles<CR>
vnoremap <leader>pf :PiperSelectActiveFiles<CR>

" related files
Glug relatedfiles plugin[mappings]='r'

" blaze
Glug blaze plugin[mappings]


" for vim-markdown-folding
filetype plugin indent on
syntax on

let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=1
" Brown
highlight SyntasticErrorLine guibg=#550000
" Dark brown
highlight SyntasticWarningLine guibg=#331d1e
" Get color here https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
"           letter color  bg color
"           white              red
hi SpellBad ctermfg=015 ctermbg=009 guifg=#00875f guibg=#00875f
hi SpellBad cterm=NONE ctermfg=015 ctermbg=009 guifg=#00875f guibg=#00875f

hi SpellCap ctermfg=015 ctermbg=009 guifg=#00875f guibg=#00875f
hi SpellCap cterm=NONE ctermfg=015 ctermbg=009 guifg=#00875f guibg=#00875f






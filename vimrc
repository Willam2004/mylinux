"filetype off
"call pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
set cursorline
set nu
set hlsearch
set foldmethod=indent
colorscheme koehler

" encoding
set fencs=gbk,utf-8,gb2312
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" latex setting
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf='mupdf'
let g:Tex_ViewRule_dvi='xdvi'
let g:Tex_CompileRule_pdf='xelatex --interaction=nonstopmode $*'
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Editing .vimrc
:nmap <Leader>s :source $MYVIMRC
:nmap <Leader>vv :e $MYVIMRC

" Java Stuff
:nmap <Leader>cc :Javac<cr>
:nmap <Leader>jj :Java %<cr>
:nmap <Leader>r  :JavaCorrect<cr>
:nmap <Leader>i  :JavaImportMissing<cr>

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
":autocmd CursorMoved * exe printf('match Folded /\<%s\>/', expand('<cword>'))



":inoremap { {<esc>o}<esc>:let leavechar="}"<cr>i
set wildchar=<Tab> wildmenu wildmode=full
let g:SuperTabMappingTabLiteral = '<c-v-tab>'
au BufRead,BufNewFile *.gnu            set filetype=gnuplot
:noremap <Leader>gg :!gnuplot %<cr>

" highlight current position
:hi CursorLine cterm=none  ctermbg=4 guibg=#555555
set cursorcolumn
:hi CursorColumn cterm=none	ctermbg=242 guibg=#555555
:hi Pmenu  cterm=bold ctermbg=242 ctermfg=14


let g:EclimTaglistEnabled=1
let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeExpandPathOnOpen=1


"æ¾ç¤ºå½ååéçå®ä¹
nmap <silent> <F3>  [i
"æå¼tagçªå£
nmap <silent> <F4>  :ProjectTree<CR>
"å é¤è¡æ«å¤ä½ç©ºå­ç¬¦
nmap <silent> <F2>  :%s/\s\+$//<CR>
"æ ¼å¼åæ´ä¸ªæä»¶ï¼ä¸ºè¯¯ç¨ï¼ç¹æå shifté®
nmap <silent> <F5>  gg=G
"æ ¼å¼åå½å{}ä¹åçææ¬}
nmap <silent> <F6>  =a{

" Supertab settings
let g:SuperTabDefaultCompletionTypeDiscovery = [
			\ "&completefunc:<c-x><c-u>",
			\ "&omnifunc:<c-x><c-o>",
			\ ]
set completeopt=menu,longest



" last modified
 autocmd BufWritePre,FileWritePre *   ks|call LastMod()|'s
" autocmd BufWrite,FileWritePre * call LastMod() 
fun LastMod()
let l = line("$")
exe "1," . l . "g/[L]ast [Mm]odified: /s/[Ll]ast [Mm]odified:.*/Last modified:" .
		       	\ strftime(" %Y %b %d %X")
endfun

set autochdir

" comment and uncomment ,c comments out a region ,u uncomments a region
" au FileType haskell,vhdl,ada let b:comment_leader = '-- '
" au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java,javascript let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType vm set syntax=html
" au FileType tex let b:comment_leader = '% '
" noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
" noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>



" Last modified: 2012 Dec 14 09:25:19 AM
map #2 :wq!
set nocompatible

nmap <LEFT> <C-W><
nmap <RIGHT> <C-W>>
nmap <UP> <C-W>+
nmap <DOWN> <C-W>-



set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Jintian/vim-logfile'

filetype plugin indent on

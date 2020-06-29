"set runtimepath^=~/.vim runtimepath+=~/.vim/after let &packpath = &runtimepath
"    source ~/.vimrc

set nocompatible "set compatible 'don't use .vimrc'. If there is .vimrc in $HOME, that nocompatible by default. But, 'better save than sorry'
syntax on

"set encoding=utf-8



" copy to clipboard after selecting in visual mode
vnoremap <c-k> "+y
" visual block can be created using ctrl+a combination
nnoremap <c-a> <c-v>
" in normal mode paste from clipboard using ctrl+v
inoremap <c-v> <esc>"+pa
nnoremap <F3> :set hlsearch!<CR>

" save changes in nvim config file and reload it
nnoremap <Leader>nr 	:w<CR> :so $MYVIMRC<CR> 
nnoremap <Leader>ne	:e $MYVIMRC<CR>
nnoremap <Leader>u 	:UltiSnipsEdit<CR>

" autocave when ctrl+o (jumping through files 
nnoremap <c-o> 		:w<CR> <c-o>
nnoremap gf		:w<CR> gf
inoremap <c-[>		<c-[>:w<CR>

" for rst (with blank line in the end)
nnoremap <Leader>u*	yypVr*o<CR>
nnoremap <Leader>u=	yypVr=o<CR>
nnoremap <Leader>u-	yypVr-o<CR>
nnoremap <Leader>u.	yypVr.o<CR>
"no space line in the end
nnoremap <Leader>un*	yypVr*j
nnoremap <Leader>un=	yypVr=j
nnoremap <Leader>un-	yypVr-j
nnoremap <Leader>u.	yypVr.o<CR>

"common comands
nnoremap <Leader>ns	:set nospell<CR>

set lazyredraw " draw result only when operation is finished (macros,...)

set relativenumber
set nonumber

"set nospell
setlocal spell spelllang=en,ru,uk
setlocal spellfile=/home/prodper/.local/share/nvim/site/spell/ru.utf-8.add
setlocal spellfile+=/home/prodper/.local/share/nvim/site/spell/en.utf-8.add
setlocal spellfile+=/home/prodper/.local/share/nvim/site/spell/uk.utf-8.add

"don't 'select'
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=gray

hi clear SpellCap
hi SpellCap cterm=none

hi clear SpellRare
hi SpellRare cterm=underline ctermfg=blue

"hi clear SpellCap
"hi SpellRare cterm=underline ctermfg=blue

"spell correction
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u



"---------Plugins-----------

call plug#begin('~/.config/nvim/plugged')

Plug 'lyokha/vim-xkbswitch'	" to use nvim with Russian
Plug 'lervag/vimtex' 		"latex synchro
Plug 'SirVer/ultisnips' 	"snippets
Plug 'ap/vim-css-color' 	"highlight color code by it's own color
Plug 'Rykka/riv.vim' 		"rst
Plug 'dhruvasagar/vim-table-mode' 
"Plug 'Rykka/InstantRst' 	"rst preview
"Plug 'preservim/nerdtree'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}



call plug#end()


" ---------Settings for plugins---------
"plugin 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1 " DO I NEED THIS LINE? enable xkbswitch 

""set ttimeoutlen=0 "for powerline to remove delay after switching to normal move after typing in russian
let g:xkbswitchNLayout = 'us'


"map <C-n> :NERDTreeToggle<CR>

"Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=3
let g:tex_conceal='abdmg'
let g:tex_no_error=1

"Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

"RST to remove strange indent like that:
" * first row <Enter>
"   * second row <Enter>
"     * third row
let g:riv_disable_indent = 1

"let g:instant_rst_browser = 'surf'
"
"" in insert mode tap ctrl+r to launch InstantRst
"inoremap <c-r> <esc>:InstantRst<Enter>i









" -------------- Didn't work -----------
" WTF? Lines below causes me problems with unicode!
"augroup remember_folds  "save Folds and coursore position on exit
"  autocmd!
"  autocmd BufWinLeave * mkview
"  autocmd BufWinEnter * silent! loadview
"augroup END
"
" Tried to fix:
"if has("multi_byte")
"  if &termencoding == ""
"    let &termencoding = &encoding
"  endif
"  set encoding=utf-8
"  setglobal fileencoding=utf-8
"  " Uncomment to have 'bomb' on by default for new files.
"  " Note, this will not apply to the first, empty buffer created at Vim startup.
"  setglobal bomb
"  set fileencodings=ucs-bom,utf-8,latin1
"endif

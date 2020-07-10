"set runtimepath^=~/.vim runtimepath+=~/.vim/after let &packpath = &runtimepath
"    source ~/.vimrc
"    for rst: * = - .

let tab=4
execute "set tabstop=".tab
"when indenting with '>'
execute "set shiftwidth=".tab	   
"4 spaces after tab pressed
set expandtab



" copy to clipboard after selecting in visual mode
vnoremap <c-k>       "+y
" visual block can be created using ctrl+a combination
nmap <c-a> 		<c-v>
" in normal mode paste from clipboard using ctrl+v
inoremap <c-v> 		<esc>"+pa
nmap <F3> 		   :set hlsearch!<CR>
ino <F3>		         <esc>:set hlsearch!<CR>a

" save changes in nvim config file and reload it
nmap <Leader>nr 	:w<CR> :so $MYVIMRC<CR> 
nmap <Leader>ne	:e $MYVIMRC<CR>
nmap <Leader>ue 	:UltiSnipsEdit<CR>

" autocave when ctrl+o (jumping through files 
nnoremap <c-o> 		        :w<CR><c-o>
nmap gf		            :w<CR> gf
inoremap <c-[>		    <c-[>:w<CR>


" for rst (with blank line in the end)
nmap <Leader>u*	yypVr*o<CR>
nmap <Leader>u=	yypVr=o<CR>
nmap <Leader>u-	yypVr-o<CR>
nmap <Leader>u.	yypVr.o<CR>
"no space line in the end
nmap <Leader>un*	yypVr*j
nmap <Leader>un=	yypVr=j
nmap <Leader>un-	yypVr-j
nmap <Leader>un.	yypVr.j

"replace chars
nmap <Leader>#	:%s/№/#/g<CR>

"common comands
nmap <Leader>ns	:set nospell<CR>
nmap <Leader>ss	:set spell spelllang=en,ru<CR>

"split to the right
"cnoremap vsr		:set splitright<CR>vs  "it didn't work this way
nmap <Leader>ntr		:set splitright<CR>:vsp 
nmap <Leader>ntl		:set nosplitright<CR>:vsp 


"some examples of highlightning
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>h :set cursorline! cursorcolumn!<CR>
nmap <Leader>h :set cursorline!<CR> 

"run python script
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

set lazyredraw " draw result only when operation is finished (macros,...)

set relativenumber
set nonumber

"set nospell
setlocal spell spelllang=en,ru
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
Plug 'plasticboy/vim-markdown'	" advanced markdown
Plug 'neoclide/coc.nvim', {'branch': 'release'} "for markmap installation
Plug 'dhruvasagar/vim-table-mode' 
"Plug 'majutsushi/tagbar'    " tagbar
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
set conceallevel=2
let g:vim_markdown_conceall_code_blocks=1
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

"vim-markdown (installed advanced plugin)
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = tab
let g:vim_markdown_strikethrough = 0

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
map <Leader>ge <Plug>Markdown_EditUrlUnderCursor

"table of contents
nmap <Leader>toc      :set splitright<CR>:Toc<CR>
nmap <Leader>itoc     :InsertToc<CR>


"generate mindmap
nmap <Leader>m <Plug>(coc-markmap-create)
" Create markmap from the selected lines
vmap <Leader>m <Plug>(coc-markmap-create-v)





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
"
"doesn't necessary?
"set encoding=utf-8

"didn't help to open files with no written extension with gf
"set isfname-=:
"
"in nvim this by default
"set nocompatible "set compatible 'don't use .vimrc'. If there is .vimrc in $HOME, that nocompatible by default. But, 'better save than sorry'
"syntax on

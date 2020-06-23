"set runtimepath^=~/.vim runtimepath+=~/.vim/after let &packpath = &runtimepath
"    source ~/.vimrc

set nocompatible "set compatible 'don't use .vimrc'. If there is .vimrc in $HOME, that nocompatible by default. But, 'better save than sorry'


" copy to clipboard after selecting in visual mode
vnoremap <c-k> "+y
" visual block can be created using ctrl+a combination
nnoremap <c-a> <c-v>
" in normal mode paste from clipboard using ctrl+v
inoremap <c-v> <esc>"+pa
nnoremap <F3> :set hlsearch!<CR>

set lazyredraw " draw only when finished operation (macros,...)

set relativenumber
set nonumber

"set nospell
setlocal spell
set spelllang=en,ru,uk
setlocal spellfile=/home/prodper/.vim/spell/ru.utf-8.add
setlocal spellfile+=/home/prodper/.vim/spell/en.utf-8.add
setlocal spellfile+=/home/prodper/.vim/spell/uk.utf-8.add


augroup remember_folds  "save Folds and coursore position on exit
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


"---------Plugins-----------

call plug#begin('~/.vim/plugged')

Plug 'lyokha/vim-xkbswitch' " to use nvim with Russian
Plug 'lervag/vimtex' "latex synchro
Plug 'SirVer/ultisnips' "snippets
Plug 'ap/vim-css-color' "highlight color code by it's own color
"Plug 'Rykka/riv.vim'
"Plug 'Rykka/InstantRst' "rst preview
"Plug 'preservim/nerdtree'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}


call plug#end()




"map <C-n> :NERDTreeToggle<CR>

"Vimtex
let g:XkbSwitchEnabled = 1 " DO I NEED THIS LINE? enable xkbswitch 
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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"RST to remove strange indent like that:
"" * first row <Enter>
""   * second row <Enter>
""     * third row
"let g:riv_disable_indent = 1
"
"let g:instant_rst_browser = 'surf'
"
"" in insert mode tap ctrl+r to launch InstantRst
"inoremap <c-r> <esc>:InstantRst<Enter>i


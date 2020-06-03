"set nocompatible              " be iMproved, required
"filetype off                  " required
set nocompatible
filetype plugin indent on
set autoindent
set nosmartindent
set encoding=utf-8
autocmd FileType lisp setlocal nolisp

" copy to clipboard after selecting in visual mode
vnoremap <C-c> "+y
" visual block can be created using ctrl+a combination
nnoremap <c-a> <c-v>
" in normal mode paste from clipboard using ctrl+v
inoremap <c-v> <esc>"+pa
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"

" open nerdtree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
:syntax on
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

let g:tex_no_error=1

Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" colorscheme for LaTeX
Plugin 'dylanaraps/wal.vim'

colorscheme wal

" Fix conceal
hi Conceal ctermbg=none 


" spelling

setlocal spell
set spelllang=en,ru,uk
setlocal spellfile=/home/prodper/.vim/spell/ru.utf-8.add
setlocal spellfile+=/home/prodper/.vim/spell/en.utf-8.add
setlocal spellfile+=/home/prodper/.vim/spell/uk.utf-8.add
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" disable spell check for comments
let g:tex_comment_nospell=1

" line numbers and relative numbers (for fast navigation)
:set number
:set relativenumber

" Command mode with Russian layout
"
Plugin 'vim-airline/vim-airline' "В список плагинов


"Не в список плагинов
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

Plugin 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1

set ttimeoutlen=0 " to remove delay after switching to normal move after typing in russian
"let g:XkbSwitchNLayout = 'us'

" disable errors highlighting in quote blocks
syntax match quoteblock /"[^"]\+/ contains=@NoSpell


" to disable auto indent 
"let nocindent nosmartindent noautoindent
" but line above didn't help

" below also didn't help
let g:tex_indent_items=0
let g:tex_indent_brace=0
let g:tex_items=0
let g:tex_itemize_env=0
let g:tex_noindent_env=0
let g:tex_indent_and=0
"
let g:vimtex_indent_enabled = 0

" To change ESC key and no lag (for RUSSIAN DIDN'T work)
"Plugin 'zhou13/vim-easyescape'
"let g:easyescape_chars = { "j": 2}
"let g:easyescape_timeout = 100
"cnoremap jj <ESC>

" turn off indent
filetype indent off

" change cursore
"
" lines below produces an error in zsh shell :\
"au InsertEnter * silent execute "!echo -en \<esc>[6 q"
"au InsertLeave * silent execute "!echo -en \<esc>[2 q"
" set guicursor=i:ver25-iCursor -- this didn't help
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

inoremap <C-s> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-s> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"Plugin 'neoclide/coc.nvim', {'pinned': 1}

" If I'm planning to use coc, than configure it (see at github README, for
" exaple) 




call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system
call plug#end()



" fold markdown
let g:markdown_folding = 1
"set foldcolumn=1
set nofoldenable  " not fold after quit


" for RST support
Bundle 'Rykka/riv.vim'
" to remove strange indent like that:
" * first row <Enter>
"   * second row <Enter>
"     * third row
let g:riv_disable_indent = 1

"vim:foldmethod=marker:syn=vim:

"setl foldmethod=expr                                                             
"setl foldexpr=riv#fold#expr(v:lnum)                                              
"setl foldtext=riv#fold#text()    
" didn't help for remove * symbols
"let g:riv_fold_level = 0
"let g:riv_fold_auto_update = 0
"filetype plugin indent on
":syntax on
" for running server and fast preview


Bundle 'Rykka/InstantRst'
let g:instant_rst_browser = 'surf'
inoremap <c-r> <esc>:InstantRst<Enter>
"let g:instant_rst_forever = 1 " Preview all the buffer, but not launch
"preview automatically

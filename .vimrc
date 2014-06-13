""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set wildignore+=*/cache/*,

set nu
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set t_Co=256 "256 Colours
"<Ctrl-l> redraws the screen and removes any search highlighting.
noremap <silent> <C-l> :nohl<CR><C-l>
noremap <C-n> :tabn<CR>
noremap <C-p> :tabp<CR>
cnoremap help vert help

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen.vim
execute pathogen#infect()

" ctrlp.vim - not needed but some rebindings.
noremap <leader>p :CtrlP<CR>
noremap <leader>vp :vsp<CR>:CtrlP<CR>

" jinja.vim
au BufRead,BufNewFile *.twig set filetype=jinja

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEP8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I REALLY NEED TO STOP USING THE ARROW KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "STOP PRESSING LEFT"<Enter>
map <Right> :echo "STOP PRESSING RIGHT"<Enter>
map <Up> :echo "STOP PRESSING UP"<Enter>
map <Down> :echo "STOP PRESSING DOWN"<Enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
"set background=dark
"color ir_black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC HIGHLIGHTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi CursorLine     guifg=NONE        guibg=#121212     gui=BOLD  ctermfg=NONE        ctermbg=234        cterm=BOLD
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=NONE ctermbg=NONE        cterm=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape to line when in Insert Mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gnome Terminal
"if has("autocmd")
"    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif
" iTerm
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
noremap <s-tab> <c-n>

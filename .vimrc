""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen.vim
execute pathogen#infect()
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
set textwidth=79

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


"<Ctrl-l> redraws the screen and removes any search highlighting.
noremap <silent> <C-l> :nohl<CR><C-l>
noremap <C-n> :tabn<CR>
noremap <C-p> :tabp<CR>
cnoremap help vert help

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlp.vim - not needed but some rebindings.
noremap <leader>p :CtrlP<CR>
noremap <leader>vp :vsp<CR>:CtrlP<CR>
noremap <leader>c :CtrlPTag<CR>

" jinja.vim
au BufRead,BufNewFile *.twig set filetype=jinja

" vim-coffee-script
autocmd FileType litcoffee runtime ftplugin/coffee.vim
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" nerdtree
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I REALLY NEED TO STOP USING THE ARROW KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "STOP PRESSING LEFT"<Enter>
map <Right> :echo "STOP PRESSING RIGHT"<Enter>
map <Up> :echo "STOP PRESSING UP"<Enter>
map <Down> :echo "STOP PRESSING DOWN"<Enter>

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

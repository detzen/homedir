set nocompatible
filetype off

" ---------------------- "
"    plugin manager      "
" ---------------------- "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sainnhe/sonokai'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'frazrepo/vim-rainbow'
Plugin 'scrooloose/nerdtree'

call vundle#end()

" ---------------------- "
"    global settings     "
" ---------------------- "

set encoding=utf-8                         " use UTF-8 encoding
set softtabstop=4                          " indent 4 spaces when hitting tab
set shiftwidth=4                           " indent by 4 spaces when auto-indenting / When indenting with >, use 4 spaces width.
set tabstop=4                              " show existing tab with 4 spaces width
set expandtab                              " insert spaces on pressing tab
syntax on                                  " enable syntax highlighting
filetype plugin indent on                  " turns on detection, ft-plugin and indent at once
set autoindent                             " enable auto indenting
" set number                               " enable line numbers
set nobackup                               " disable backup files
set laststatus=2                           " show status line
set wildmenu                               " display command line's tab complete options as a menu.
set hidden                                 " allow buffer switch without saving
set history=2000                           " set bigger history of executed commands
syntax on                                  " enable syntax processing
set laststatus=2                           " always display the status bar
set hlsearch                               " highlight searches by default
set linebreak                              " avoid line wrapping in the middle of a word
set pastetoggle=<F2>                       " toggle paste mode
set backspace=indent,eol,start

" colorscheme
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
set background=dark                        " dark background
colorscheme sonokai                        " set colorscheme

" !!! not necessary when using vim-airline !!!
" set showtabline=2              " always display tabline
" customize statusline
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\


" ---------------------- "
"      key mappings      "
" ---------------------- "

" set <Space> as leader key
" let mapleader = "\<Space>"
let mapleader = ","

" visually select whole file
map <Leader>a <esc>ggVG<CR>

" too lazy for typing :norm
vnoremap <leader>n :norm<space>
vnoremap <A-#> :norm<space>

" write file with sudo
cmap wsu w !sudo tee %
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!     " don't prompt for reload

" add semikolon/comma at end of line
vnoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '' : ':norm A;<esc>'
nnoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '' : '<End>A;<esc>'
inoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '' : '<End>;'

vnoremap <expr> ,<cr> getline('.')[-1:] == ',' ? '' : ':norm A,<esc>'
nnoremap <expr> ,<cr> getline('.')[-1:] == ',' ? '' : '<End>A,<esc>'
inoremap <expr> ,<cr> getline('.')[-1:] == ',' ? '' : '<End>,'

" only works in GUI ???
vnoremap <expr> <A-;> getline('.')[-1:] == ';' ? '' : ':norm A;<esc>'
nnoremap <expr> <A-;> getline('.')[-1:] == ';' ? '' : '<End>A;<esc>'
inoremap <expr> <A-;> getline('.')[-1:] == ';' ? '' : '<End>;'

" scroll through buffers with ALT + <direction>
nnoremap <A-Left> :bp<CR>
inoremap <A-Left> <esc>:bp<CR>
nnoremap <A-Right> :bn<CR>
inoremap <A-Right> <esc>:bn<CR>

nnoremap <A-h> :bp<CR>
inoremap <A-h> <esc>:bp<CR>
nnoremap <A-l> :bn<CR>
inoremap <A-l> <esc>:bn<CR>

" unhighlight search results
nnoremap <C-L> :nohlsearch<CR><C-L>

" show next match at the center of the screen
nnoremap n nzz
nnoremap N Nzz
" nnoremap n nzzzv
" nnoremap N Nzzzv

" highlight trailing whitespace
match ErrorMsg '\s\+$'

" automatically remove trailing whitespaces after save
" autocmd BufWritePre * :%s/\s\+$//e

" manually remove trailing whitespaces
nnoremap <F12> :%s/\s\+$//e<CR>

" move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make . to work with visually selected lines
vnoremap . :normal.<CR>


" ---------------------- "
"  plugin configuration  "
" ---------------------- "

" Airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
" let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'  # default

" delimitMate plugin
let delimitMate_expand_space=1
" au FileType perl let b:delimitMate_expand_space = 1
let delimitMate_expand_cr = 2
let delimitMateBackspace = 1
let delimitMate_smart_quotes = 1

" vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey

" vim-rainbow / activate with 'RainbowToggle'
let g:rainbow_active = 0

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeShowHidden=1


" ---------------------- "
"    helper functions    "
" ---------------------- "

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Commenting blocks of code.
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "javascript": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "perl": '#',
    \   "yaml": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap ,cc :call ToggleComment()<cr>
vnoremap ,cc :call ToggleComment()<cr>


" ---------------------- "
"     miscellaneous      "
" ---------------------- "

if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set lines=60 columns=200
    set guioptions-=R "remove right scrollbar
    set guioptions-=L "remove left scrollbar
    if has('gui_win32')
        " set guifont=Hack:h9:cANSI:qDRAFT
        " set guifont=Consolas:h10:cANSI:qDRAFT
        set guifont=Ubuntu_Mono:h10:cANSI:qDRAFT
        " Make shift-insert work like in Xterm
        map <S-Insert> <MiddleMouse>
        map! <S-Insert> <MiddleMouse>
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

" ensures that vim looks the same everywhere
" no matter wich terminal emulator is used
if &term =~ "xterm"
    " 256 colors
    let &t_Co = 256
    " restore screen after quitting
    let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l\<Esc>8"
    if has("terminfo")
        let &t_Sf = "\<Esc>[3%p1%dm"
        let &t_Sb = "\<Esc>[4%p1%dm"
    else
        let &t_Sf = "\<Esc>[3%dm"
        let &t_Sb = "\<Esc>[4%dm"
    endif
endif

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'bundle/vundle'
Plugin 'auto-pairs/auto-pairs'
Plugin 'nerdtree/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'taglist/taglist'
Plugin 'vim-airline/vim-airline'
Plugin 'python/python'
Plugin 'jedi-vim/jedi-vim'
call vundle#end()            " required

filetype plugin indent on    " required

syntax enable
"set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set background=dark
let g:solarized_termtrans = 1
set runtimepath+=~/.vim
set background=dark
syntax enable
colorscheme molokai_dark
"colorscheme solarized
set hls
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nocompatible
set smartcase
set laststatus=2 "始终显示状态栏
set expandtab "使用空格替代制表符
set smarttab "智能制表符
"set autoindent "自动缩进
set ruler "显示位置指示器
set ignorecase "检索时忽略大小写
set helplang=cn "帮助系统设置为中文
set nocp
set backspace=indent,eol,start

" taglist settings
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
map <silent> <F9> :TlistToggle <CR>

" nerdtree settings
map <silent> <F2> :NERDTreeToggle<CR>

" airline settings
let g:airline_powerline_fonts = 1

let g:SuperTabDefaultCompletionType="context"

"let g:pydiction_location = '/Users/anduo/.vim/bundle/pydiction/complete-dict'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 2
""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
"        :time host -t a test bash %
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "go get github.com/joushou/sshmuxd build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"代码格式优化化

map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

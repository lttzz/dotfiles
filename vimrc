syntax enable				" 语法高亮
syntax on					" 允许指定语法高亮配色方案替换默认方案
colorscheme evening			" 配色模式
set showmatch				" 括号匹配
set ignorecase				" 大小写不敏感
set smartcase				" 只有小写时不敏感否则敏感，搭配上一条一起使用
set incsearch				" 实时搜索模式
set number					" Show line number
set ruler					" 状态栏显示光标当前位置
set cursorline				" 高亮当前行
" set cursorcolumn			" 高亮当前列
set shiftwidth=4			" << 和 >> 命令移动的宽度为4
set softtabstop=4			" 退格键一次可以删掉4个空格
set tabstop=4				" tab 宽度为4
set expandtab				" 使用空格而不是tab
set hlsearch				" 高亮显示被搜索到的文本
set smartindent				" 智能缩进
set cmdheight=1				" 命令行高度为1
set laststatus=2			" 显示状态栏
" 设置状态栏信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)
set foldenable				" 开启折叠
" set foldmethod=indent		" 设置基于缩进折叠
set foldmethod=syntax		" 设置基于语法折叠
set nofoldenable            " 启动 vim 时关闭折叠
set foldcolumn=0			" 设置折叠区域的宽度
set foldlevel=1				" 设置折叠的层数
set nrformats=              " 将所有的数字都当成十进制，如007等，否则会被当作八进制解释
" 使用空格键打开/关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
filetype on					" 开启文件类型检测
filetype plugin on			" 依据检测到的文件类型动态加载插件
filetype indent on			" 自适应语言进行只能缩进
autocmd BufWritePost $MYVIMRC source $MYVIMRC		" 修改.vimrc后立即生效
" set gcr=a:blinkon0			" 禁止光标闪烁，似乎未生效
" 下面几条和gui有关的是Windows下的，linux用户可忽略
" 不显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" set guioptions-=m				" 关闭菜单显示
" set guioptions-=T				" 关闭工具条显示

" 解决tmux下vim背景色过深
set background=dark
set t_Co=256

" ctags
set tags=tags;
set autochdir				    " 自动切换当前目录为当前文件所在的目录

" vim-plug https://github.com/junegunn/vim-plug
" call plug#begin('~/.vim/plugged')
" tagbar
" Plug 'preservim/tagbar'
" call plug#end()

" tagbar
" let tagbar_left=1               " 居左显示
" let tagbar_width=32             " 设置tagbar子窗口宽度
" let g:tagbar_compact=1          " 设置tagbar子窗口中不显示冗余信息
" 设置ctags对哪些代码标识符生成标签
" let g:tagbar_type_cpp = {
"     \ 'kinds' : [
"          \ 'c:classes:0:1',
"          \ 'd:macros:0:1',
"          \ 'e:enumerators:0:0', 
"          \ 'f:functions:0:1',
"          \ 'g:enumeration:0:1',
"          \ 'l:local:0:1',
"          \ 'm:members:0:1',
"          \ 'n:namespaces:0:1',
"          \ 'p:functions_prototypes:0:1',
"          \ 's:structs:0:1',
"          \ 't:typedefs:0:1',
"          \ 'u:unions:0:1',
"          \ 'v:global:0:1',
"          \ 'x:external:0:1'
"      \ ],
"      \ 'sro'        : '::',
"      \ 'kind2scope' : {
"          \ 'g' : 'enum',
"          \ 'n' : 'namespace',
"          \ 'c' : 'class',
"          \ 's' : 'struct',
"          \ 'u' : 'union'
"      \ },
"      \ 'scope2kind' : {
"          \ 'enum'      : 'g',
"          \ 'namespace' : 'n',
"          \ 'class'     : 'c',
"          \ 'struct'    : 's',
"          \ 'union'     : 'u'
"      \ }
" \ }

" compile
map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        if !isdirectory('build')
            execute "!mkdir build"
        endif
        exec "!gcc % -std=c17 -o ./build/%<.out"
        exec "!time ./build/%<.out"
    elseif &filetype == 'cpp'
        if !isdirectory('build')
            execute "!mkdir build"
        endif
        exec "!g++ % -std=c++17 -o ./build/%<.out"
        exec "!time ./build/%<.out"
    elseif &filetype == 'java'
        exec "!java %"
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunc

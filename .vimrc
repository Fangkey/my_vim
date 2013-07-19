"Pathogen
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
syntax enable
set background=light
colorscheme desert_my

set nocompatible		    " 去掉vi兼容
set nu				        " 开启行号
set showcmd         		" 在Vim窗口右下角，标尺的右边显示未完成的命令
set whichwrap+=<,>,h,l   	" 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3     		" 光标移动到buffer的顶部和底部时保持3行距离  
"set novisualbell    		" 不要闪烁(不明白) 

"状态行显示内容  
"set statusline=%F%m%r%h%w\ %y\ %0(%{&fileformat}\ %{&encoding}i%)\ %=\ %c:%l/%L\ [%p%%]\ 
set laststatus=2
set foldenable              " 允许折叠  
set foldmethod=manual       " 手动折叠 

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
	    call append(line(".")+1, "\# Author: wangfang09") 
	    call append(line(".")+2, "\# mail: wangfang09@baidu.com")
	    call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
	    call append(line(".")+4, "\#########################################################################") 
	    call append(line(".")+5, "\#!/bin/bash") 
	    call append(line(".")+6, "")
    else
	    call setline(1, "/*************************************************************************") 
	    call append(line("."), "    * File Name: ".expand("%")) 
	    call append(line(".")+1, "    * Author: wangfang09") 
	    call append(line(".")+2, "    * Mail: wangfang09@baidu.com") 
	    call append(line(".")+3, "    * Created Time: ".strftime("%c")) 
	    call append(line(".")+4, " ************************************************************************/") 
	    call append(line(".")+5, "")
    endif
"    if &filetype == 'cpp'
"	    call append(line(".")+6, "#include<iostream>")
"	    call append(line(".")+7, "using namespace std;")
"	    call append(line(".")+8, "")
"    endif
"    if &filetype == 'c'
"	    call append(line(".")+6, "#include<stdio.h>")
"	    call append(line(".")+7, "")
 "   endif
     "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
 endfunc

 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "键盘命令
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 nmap <leader>w :w!<cr>
 nmap <leader>f :find<cr>

 " 映射全选+复制 ctrl+a
 map <C-A> ggVGY
 map! <C-A> <Esc>ggVGY
 map <F12> gg=G
 " 选中状态下 Ctrl+c 复制
 vmap <C-c> "+y
 "去空行  
 nnoremap <F5> :g/^\s*$/d<CR> 
 "比较文件  
 nnoremap <C-F5> :vert diffsplit 
 "新建标签  
 map <M-F2> :tabnew<CR>  
 "列出当前目录文件  
 map <F3> :tabnew .<CR>  
 "打开树状文件目录  
 map <C-F3> \be 

 "导航
 map <C-p> :<C-tab>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
set noswapfile
"自动保存
set autowrite

set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术

syntax on
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set expandtab
" 历史记录数
set history=1000
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 为C程序提供自动缩进
set smartindent

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"taglist{
""let Tlist_Auto_Open=1 
""let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
""let Tlist_Sort_Type = "name"    " 按照名称排序  
""let Tlist_Use_Right_Window = 0  " 在右侧显示窗口  
""let Tlist_Compart_Format = 1    " 压缩方式  
""let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
""let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"设置tags  
""set tags=tags  
"set autochdir 
"}

"tagbar{
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_left = 1
let g:tagbar_width = 30
"}

"minibufexpl{
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
"}

"NERDTree{
map <C-T> :NERDTree<CR>
"}

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

"NeoComplete{
let g:neocomplcache_enable_at_startup = 1
"}

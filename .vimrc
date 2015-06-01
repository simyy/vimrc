""""""""""""""""""""
" display 
""""""""""""""""""""

set nu!                        "显示行号
"set ai!                        "设置自动缩进
set tabstop=4                  "设置tab宽度
"set cindent shiftwidth=4      "自动缩进4空格
"set smartindent               "智能自动缩进
set showmatch                  "显示括号匹配
"set mouse=a                   "启动鼠标
set ruler                      "右下角状态行
set hlsearch                   "搜索高亮显示
set matchtime=1                "搜索不区分大小写
"set cursorline                "当前行增加横线
set list                       "显示Tab符
set listchars=tab:\|\ ,

syntax enable                  "语法高亮
syntax on                      "打开文件类型检测

"set cursorcolumn  
"hi CursorColumn guibg=Grey40 guifg=red term=BOLD 
autocmd InsertLeave * se nocul "编辑加横线"
autocmd InsertEnter * se cul

set fenc=utf-8                 "设置编码
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1"

set foldenable                 "打开折叠
set foldmethod=manual          "手动折叠

set completeopt=preview,menu   "auto complate

set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn

""""""""""""""
" usefull set
""""""""""""""

" 符号自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
"":inoremap { {<CR>}<ESC>O
"":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i

" 自动增加文件头
autocmd BufNewFile *.sh,*.cpp,*.py exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh' 
        call append(0, "\#!/bin/bash") 
    endif
    if &filetype == 'cpp'
        call append(0, "#include <iostream>")
        call append(line("."), "using namespace std;")
        call append(line(".")+1, "")
        call append(line(".")+2, "int main(int argc, char** argv)")
        call append(line(".")+3, "\{")
        call append(line(".")+4, "    return 0;")
        call append(line(".")+5, "\}")
    endif
    if &filetype == 'py'
        call append(0, "\#!/usr/bin/env python")
    endif
    " move to end line 
    autocmd BufNewFile * normal G
endfunc 

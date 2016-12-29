syntax enable

"let g:solarized_termtrans = 1
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid

"colorscheme molokai
"let g:rehash256 = 1

"set background=light
"colorscheme PaperColor
"

"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" 按键映射
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>

set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符

"""""""
" 缩进
"""""""
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 空格代替制表符
set expandtab

"""""""
" 显示
""""""
" 显示行号
set number
" 查找高亮
set hlsearch
" 高亮显示匹配的括号
set showmatch
" 显示位置指示器
set ruler
" 显示竖线 和 横线
set cursorcolumn
set cursorline


" 插件管理器
execute pathogen#infect()
syntax on
filetype plugin indent on

" 目录结构NERDTREE
map <F2> :NERDTreeToggle<CR>
"let NERDTreeWinPos="right"
"autocmd vimenter * NERDTree

" TAGBAR
nmap <F3> :TagbarToggle<CR>
autocmd VimEnter * Tagbar

" 宽度限制
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

" 记录上次位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif

set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


" next or pre page
map <tab> :tabp<CR>
map <SPACE> :

" ag文件内容搜索
set runtimepath^=~/.vim/bundle/ag.vim
nnoremap \ :Ag<SPACE>

" ctrlp最近使用的文件
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }

" 自动补全
" https://github.com/Valloric/YouCompleteMe
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 括号自动补全
" https://github.com/Raimondi/delimitMate.git

" air-line状态栏
let g:airline_powerline_fonts = 1
"let g:airline_theme = "papercolor"

set mouse=a

" 括号高亮
" https://github.com/kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" tagbar for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
        \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
            \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \},
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \}

" godef go跳转
let g:godef_split=0

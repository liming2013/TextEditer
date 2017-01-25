source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


set fencs=ucs-bom,gb18030,gbk,gb2312,cp936,utf-8
"set fileencoding=utf-8
"set encoding=utf-8
"set fileencodings=utf-8,ucs-bom,chinese

set encoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8


" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible

" history文件中需要记录的行数 
set history=100

" 在处理未保存或只读文件的时候，弹出确认 
set confirm

" 侦测文件类型 
filetype on

" 语法高亮 
syntax on

" 启动的时候不显示那个援助索马里儿童的提示 
"set shortmess=atI

" 高亮显示匹配的括号 
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch

" 总是显示状态行 
set laststatus=2

" 制表符为4 
set tabstop=4 

" 统一缩进为4 
set softtabstop=4
set shiftwidth=4

"显示行号
set nu

"鼠标可用
set mouse=a

"显示标尺，就是在右下角显示光标位置
set ruler

"设置字体和字号
set guifont=Source\ Code\ Pro:h14
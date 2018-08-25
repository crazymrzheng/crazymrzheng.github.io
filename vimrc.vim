" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
"" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"--------------------------------------------------------------------------------
" => General
"--------------------------------------------------------------------------------

syntax enable

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.git,*.swp

" Height of the command bar
set cmdheight=1

" Ignore case when searching
" set ignorecase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

 set autoindent
 set cindent
 set tabstop=4       " 设置tab键的宽度
 set expandtab       " 设置tab->spaces
 set backspace=2     " 设置退格键可用
 set nu              " 显示行号
 set cursorline
 "set colorcolumn=80  " Red line
 "set cursorline cursorcolumn
 
 "--------------------------------------------------------------------------------
 " 查找/替换相关的设置
 "--------------------------------------------------------------------------------
 set hlsearch        " 高亮显示搜索结果
 set incsearch       " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                     " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                     " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                     " 找要匹配的单词时，别忘记回车
 set gdefault        " 替换时所有的行内匹配都被替换，而不是只有第一个
 
 "--------------------------------------------------------------------------------
 " 状态栏相关的设置
 "--------------------------------------------------------------------------------
 set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
 set laststatus=2    " Always show the status line
 set ruler           " Always show current position
 
 "--------------------------------------------------------------------------------
 " 编程相关的设置
 "--------------------------------------------------------------------------------
 "set completeopt=longest,menu    " 关掉智能补全时的预览窗口
 filetype plugin indent on       " 加了这句才可以用智能补全
 syn on              " 打开语法高亮
 set showmatch       " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
 set smartindent     " 智能对齐方式
 set shiftwidth=4    " 换行时行间交错使用4个空格
 set autoindent      " 自动对齐
 set ai              " 设置自动缩进
 set si              "Smart indent
 set wrap            "Wrap lines
 " colorscheme desert" Set scheme
 " set background=dark
 
 " Use Unix as the standard file type
 set ffs=unix,dos,mac

 " Set utf8 as standard encoding and en_US as the standard language
 " set encoding=utf8

 "--------------------------------------------------------------------------------
 " 代码折叠
 "--------------------------------------------------------------------------------
 "set foldmarker={,}
 "set foldmethod=marker
 set foldmethod=syntax
 set foldlevel=100       " Don't autofold anything (but I can still fold manually)
 "set foldopen-=search   " don't open folds when you search into them
 "set foldopen-=undo     " don't open folds when you undo stuff
 "set foldcolumn=4
 
 "--------------------------------------------------------------------------------
 " => Moving around, tabs, windows and buffers 
 "--------------------------------------------------------------------------------
 " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
 map <space> /
 map <c-space> ?

 " Disable highlight when <leader><cr> is pressed
 map <silent> <leader><cr> :noh<cr>

 " Return to last edit position when opening files (You want this!)
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

 "--------------------------------------------------------------------------------
 "  => Spell checking
 "--------------------------------------------------------------------------------
 " Pressing ,ss will toggle and untoggle spell checking
 map <leader>ss :setlocal spell!<cr>

 " Shortcuts using <leader>
 map <leader>sn ]s
 map <leader>sp [s
 map <leader>sa zg
 map <leader>s? z=
 
 "--------------------------------------------------------------------------------
 "  => Misc 
 "--------------------------------------------------------------------------------
 " Remove the Windows ^M - when the encodings gets messed up
 noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


 "--------------------------------------------------------------------------------
 " 窗口操作的快捷键
 "--------------------------------------------------------------------------------
 nmap wv     <C-w>v     " 垂直分割当前窗口
 nmap wc     <C-w>c     " 关闭当前窗口
 nmap ws     <C-w>s     " 水平分割当前窗口

 " Smart way to move between windows
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l

 "###############################################################################
 " The following is the Plugins' setting
 "###############################################################################
 
 "--------------------------------------------------------------------------------
 " TagList :Tlist
 "--------------------------------------------------------------------------------
 let Tlist_Show_One_File=1
 let Tlist_Exit_OnlyWindow=1
 let Tlist_Use_Right_Window=1
 let Tlist_WinWidth=50        "set taglist width
 let Tlist_Ctags_Cmd="/usr/bin/ctags"
 let g:Tlist_Inc_Winwidth = 0
 let g:Tlist_Show_One_File = 0
 let g:Tlist_File_Fold_Auto_Close = 1
 let g:Tlist_Sort_Type = "name"
 let g:Tlist_Show_Menu = 1
 let g:Tlist_Use_SingleClick = 1
 "let g:Tlist_Auto_Open = 1
 
 "--------------------------------------------------------------------------------
 " netrw 文件浏览器 :e <PATH>
 "--------------------------------------------------------------------------------
 "let g:netrw_winsize = 30       " 浏览器宽度
 
 "--------------------------------------------------------------------------------
 " QuickFix
 "--------------------------------------------------------------------------------
 nmap <F6> :cn<cr>   " 切换到下一个结果
 nmap <F7> :cp<cr>   " 切换到上一个结果
 
 "--------------------------------------------------------------------------------
 " WinManager :WMToggle
 "--------------------------------------------------------------------------------
 let g:winManagerWindowLayout='FileExplorer|TagList'
 let g:AutoOpenWinManager = 1
 let g:winManagerWidth = 40 
 "let g:defaultExplorer = 0
 "nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
 "nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
 nmap wm :WMToggle<cr> " 是nomal模式的命令，不是Ex模式的
 
 "--------------------------------------------------------------------------------
 " MiniBufExp
 "--------------------------------------------------------------------------------
 "let g:miniBufExplMapWindowNavVim = 1
 let g:miniBufExplMapWindowNavArrows = 1
 let g:miniBufExplMapCTabSwitchBufs = 1
 "let g:miniBufExplModSelTarget = 1
 "set tags= tags
 
 "--------------------------------------------------------------------------------
 " cscope
 "--------------------------------------------------------------------------------
 :set cscopequickfix=s-,c-,d-,i-,t-,e-
 :set cscopetag
 " 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕一闪
 " 就回到nomal状态了
 " <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
 nmap <C-_>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 nmap <C-_>g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 nmap <C-_>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 nmap <C-_>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 nmap <C-_>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
 nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
 nmap <C-_>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>
 
 "--------------------------------------------------------------------------------
 " Grep
 "--------------------------------------------------------------------------------
 "直接按下<F3>键来查找光标所在的字符串
 nnoremap <silent> <F3> :Rgrep<CR>
 
 "--------------------------------------------------------------------------------
 " A
 "--------------------------------------------------------------------------------
 nnoremap <silent> <F12> :A<CR>
 
 "--------------------------------------------------------------------------------
 " NERD_commenter
 "--------------------------------------------------------------------------------
 let NERD_c_alt_style = 1    " 将C语言的注释符号改为//, 默认是/**/
 "nmap <F5> ,cc
 
 "--------------------------------------------------------------------------------
 " SuperTab :SuperTabHelp
 "--------------------------------------------------------------------------------
 let g:SuperTabRetainCompletionType = 2
 let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
 
 "--------------------------------------------------------------------------------
 " CVim :help csupport
 "--------------------------------------------------------------------------------
 let g:C_Comments = "no"         " 用C++的注释风格
 let g:C_BraceOnNewLine = "no"   " '{'是否独自一行
 let g:C_AuthorName = "Zheng"
 let g:C_Project="F9"
 let g:Cpp_Template_Function = "c-function-description-wuyin"
 let g:C_TypeOfH = "c"           " *.h文件的文件类型是C还是C++


" =====================================================================================================================
" "  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
" Author C.K


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $XDG_CONFIG_HOME/nvim/_machine_specific.vim



" ====================
" === Editor Setup ===
" ====================
" =====================================================================================================================
" =================================================键位设置============================================================

" ===
" === Editor behavior
" ===

let mapleader=" "
" 代码高亮
syntax on

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" 设置字体和字符编码
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13
set enc=utf-8
set number  					"显示行号"
set norelativenumber  			"显示行号，当前行为第一行 当前取消"
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
set nowrap                      "设置换行 不超出窗口 当前取消"
set showcmd
set wildmenu 					"输入命令时显示备选"
" 设置外观
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条" 
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set langmenu=zh_CN.UTF-8        "显示中文菜单
set fileformat=unix             "设置以unix的格式保存文件:
set cindent                     "设置C样式的缩进格式"
set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=4                "每一级缩进是多少个空格
set softtabstop=4
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set scrolloff=5                 "距离顶部和底部5行"
set laststatus=2                "命令行为两行"
set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
set incsearch					"搜索中高亮"
exec "nohlsearch"
set noexpandtab                 "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" 重置按键
noremap h i
noremap H I
noremap i k
noremap k j 
noremap j h
noremap = nzz
noremap - Nzz
noremap I 5i
noremap K 5k


" 空格+会车 取消搜索
noremap <LEADER><CR> :nohlsearch<CR> 

map s <nop> 
map S :w<CR>
map Q :q<CR>
map R :source $HOME/.vimrc<CR>
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>
" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>k
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" 分屏：左右上下切换
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" 标签页
map tu :tabe<CR>
map t+ :-tabenext<CR>
map t- :+tabenext<CR>


" ===
" === Other useful stuff
" ===
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4h

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" =================================================新建CPP文件=========================================================
autocmd BufNewFile *.cpp,*.sh,*.py exec ":call SetTitle()"
    func SetTitle()
		" 对于Cpp文件 “
    	if &filetype == 'cpp'
			call setline(1,"/**") 
        	call append(line("."), " *   Copyright (C) ".strftime("%Y")." All rights reserved.")
        	call append(line(".")+1, " *") 
        	call append(line(".")+2, " *   FileName      ：".expand("%:t")) 
        	call append(line(".")+3, " *   Author        ：C.K")
        	call append(line(".")+4, " *   Email         ：wkh19960317@163.com")
        	call append(line(".")+5, " *   DateTime      ：".strftime("%Y-%m-%d %H:%M:%S")) 
        	call append(line(".")+6, " *   Description   ：") 
        	call append(line(".")+7, " */") 
        	call append(line(".")+8, "#include <algorithm>　　　 //STL 通用算法") 
        	call append(line(".")+9, "#include <bitset>　　　　　//STL 位集容器") 
        	call append(line(".")+10, "#include <cctype>         //字符处理") 
        	call append(line(".")+11, "#include <cerrno> 　　　　 //定义错误码 ") 
        	call append(line(".")+12, "#include <cfloat>　　　　 //浮点数处理 ") 
       		call append(line(".")+13, "#include <ciso646>         //对应各种运算符的宏") 
        	call append(line(".")+14, "#include <climits> 　　　　//定义各种数据类型最值的常量") 
        	call append(line(".")+15, "#include <clocale> 　　　　//定义本地化函数") 
        	call append(line(".")+16, "#include <cmath> 　　　　　//定义数学函数 ") 
        	call append(line(".")+17, "#include <complex>　　　　 //复数类 ") 
        	call append(line(".")+18, "#include <csignal>         //信号机制支持 ") 
        	call append(line(".")+19, "#include <csetjmp>         //异常处理支持 ") 
        	call append(line(".")+20, "#include <cstdarg>         //不定参数列表支持") 
        	call append(line(".")+21, "#include <cstddef>         //常用常量") 
        	call append(line(".")+22, "#include <cstdio> 　　　　 //定义输入／输出函数") 
        	call append(line(".")+23, "#include <cstdlib> 　　　　//定义杂项函数及内存分配函数") 
        	call append(line(".")+24, "#include <cstring> 　　　　//字符串处理") 
        	call append(line(".")+25, "#include <cwchar> 　　　　 //宽字符处理及输入／输出") 
        	call append(line(".")+26, "#include <cwctype> 　　　　//宽字符分类") 
        	call append(line(".")+27, "#include <deque>　　　　　 //STL 双端队列容器") 
        	call append(line(".")+28, "#include <exception>　　　 //异常处理类") 
        	call append(line(".")+29, "#include <fstream> 　　　 //文件输入／输出") 
        	call append(line(".")+30, "#include <functional>　　　//STL 定义运算函数（代替运算符）") 
        	call append(line(".")+31, "#include <limits> 　　　　 //定义各种数据类型最值常量") 
        	call append(line(".")+32, "#include <list>　　　　　　//STL 线性列表容器") 
        	call append(line(".")+33, "#include <map>　　　　　　 //STL 映射容器") 
        	call append(line(".")+34, "#include <locale>         //本地化特定信息") 
        	call append(line(".")+35, "#include <memory>         //STL通过分配器进行的内存分配") 
        	call append(line(".")+36, "#include <new>            //动态内存分配") 
        	call append(line(".")+37, "#include <numeric>         //STL常用的数字操作") 
        	call append(line(".")+38, "#include <iostream> 　　　//数据流输入／输出") 
        	call append(line(".")+39, "#include <istream>　　　　 //基本输入流") 
        	call append(line(".")+40, "#include <iterator>        //STL迭代器") 
        	call append(line(".")+41, "#include <ostream>　　　　 //基本输出流") 
        	call append(line(".")+42, "#include <queue>　　　　　 //STL 队列容器") 
        	call append(line(".")+43, "#include <set>　　　　　　 //STL 集合容器") 
        	call append(line(".")+44, "#include <sstream>　　　　 //基于字符串的流") 
        	call append(line(".")+45, "#include <stack>　　　　　 //STL 堆栈容器") 
        	call append(line(".")+46, "#include <stdexcept>　　　 //标准异常类") 
        	call append(line(".")+47, "#include <streambuf>　　　 //底层输入／输出支持") 
        	call append(line(".")+48, "#include <string>　　　　　//字符串类") 
        	call append(line(".")+49, "#include <vector>　　　　　//STL 动态数组容器") 
       		call append(line(".")+50, "#include <valarray>        //对包含值的数组的操作") 
        	call append(line(".")+51, "#include <ctime> 　　　　　//定义关于时间的函数") 
        	call append(line(".")+52, "using namespace std:") 
        	call append(line(".")+53, "") 
        	call append(line(".")+54, "") 
        	call append(line(".")+55, "") 
        	call append(line(".")+56, "") 
        	call append(line(".")+57, "") 
        	call append(line(".")+58, "") 
			call append(line(".")+59, "int main(){") 
        	call append(line(".")+60, "    return 0;") 
			call append(line(".")+61, "}") 
		endif

		"对于 .sh 文件 "
    	if &filetype == 'sh'
        	call setline(1, "#!/bin/bash")
    	endif

    	"对于 python3 文件 "
    	if &filetype == 'python'
        	call setline(1, "# !/usr/bin/env python3")
        	call append(1, "# Author: C.K")
        	call append(2, "# Email: wkh19960317@163.com")
        	call append(3, "# DateTime:".strftime("%Y-%m-%d %H:%M:%S")) 
        	call append(4, "# Description: ") 
        	call append(5, "") 
        	call append(6, "") 
        	call append(7, "") 
        	call append(8, "") 
        	call append(9, "") 
        	call append(10, "") 
        	call append(11, "if __name__ == __\"main\":") 
        	call append(12, "	pass") 
        	call append(13, "") 
    	endif
	
    endfunc
"自动将光标定位到末尾"
autocmd BufNewFile * normal G

" =================================================F5执行python文件===================================================
filetype plugin on
" 按 F5 执行当前 Python 代码"
map <F5> :call PRUN()<CR>
func! PRUN()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    endif
endfunc

" Compile function
map r :call CompileRunGcc()<CR>
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
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc


" plug插件管理器
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'

" Undo Tree
Plug 'mbbill/undotree/'

" Snippits
" Plug 'SirVer/ultisnips'  , { 'for': ['vim-plug', 'python'] }  
" Plug 'honza/vim-snippets', { 'for': ['vim-plug', 'python'] }


" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

" Initialize plugin system
call plug#end()


let g:SnazzyTransparent = 1
"color snazzy

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "usr/bin/python3"
let g:ycm_python_binary_path = "usr/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>




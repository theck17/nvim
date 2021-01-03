" =====================================================================================================================
" "  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
" Author The C.K


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
source ~/.config/nvim/_machine_specific.vim



" ====================
" === Editor Setup ===
" ====================
" =====================================================================================================================
" =================================================键位设置============================================================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir
syntax on

" ===
" === Editor behavior
" ===
set exrc
set secure
set number  					"显示行号"
set norelativenumber  			"显示行号，当前行为第一行 当前取消"
set cursorline                  "突出显示当前行"
set hidden
set noexpandtab                 "不允许扩展table"
set tabstop=2                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=2                "每一级缩进是多少个空格
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5                 "距离顶部和底部5行"
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu 					"输入命令时显示备选"
set ignorecase                  "忽略大小写"
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
set updatetime=100
set virtualedit=block
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13
set enc=utf-8
set cursorcolumn                "突出显示当前列"
set nowrap                      "设置换行 不超出窗口 当前取消"
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条" 
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set langmenu=zh_CN.UTF-8        "显示中文菜单
" set fileformat=unix             "设置以unix的格式保存文件:
set cindent                     "设置C样式的缩进格式"
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set laststatus=2                "命令行为两行"
set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set incsearch
set hlsearch                    "高亮搜索项"
set incsearch					"搜索中高亮"
exec "nohlsearch"
set whichwrap+=<,>,h,l
set autoread
set mouse=a
set encoding=utf-8

let &t_ut=''
set expandtab
set backspace=indent,eol,start
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set autochdir
let mapleader=" "

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Terminal Behaviors
" ===
" let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
" let g:terminal_color_0  = '#000000'
" let g:terminal_color_1  = '#FF5555'
" let g:terminal_color_2  = '#50FA7B'
" let g:terminal_color_3  = '#F1FA8C'
" let g:terminal_color_4  = '#BD93F9'
" let g:terminal_color_5  = '#FF79C6'
" let g:terminal_color_6  = '#8BE9FD'
" let g:terminal_color_7  = '#BFBFBF'
" let g:terminal_color_8  = '#4D4D4D'
" let g:terminal_color_9  = '#FF6E67'
" let g:terminal_color_10 = '#5AF78E'
" let g:terminal_color_11 = '#F4F99D'
" let g:terminal_color_12 = '#CAA9FA'
" let g:terminal_color_13 = '#FF92D0'
" let g:terminal_color_14 = '#9AEDFE'
"
"
"===
" === Basic Mappings
" ===
" 重置按键
noremap h i
noremap H I
noremap i k
noremap k j 
noremap j h
noremap = nzz
noremap - Nzz
noremap I 5k
noremap K 5j

" 空格+会车 取消搜索
noremap <LEADER><CR> :nohlsearch<CR> 

map s <nop> 
map S :w<CR>
map Q :q<CR>
map R :source $HOME/.config/nvim/init.vim<CR>
" map R :source $HOME/.vimrc<CR>
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>

" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
" 切屏
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>k
" 方向键改变大小
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
" Open a new instance of st with the cwd
" nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
" inoremap <C-u> <ESC>lx$p

" Opening a terminal window
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
" noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
" noremap ` ~

" noremap <C-c> zz

" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" noremap tx :r !figlet 

" find and replace
" noremap \s :%s//g<left><left>

" set wrap
" noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
" function! SynGroup()
"	let l:s = synID(line('.'), col('.'), 1)
"	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
" endfun
" map <F10> :call SynGroup()<CR>

" Duplicate words
" map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Compile function  编译函数
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" create new file
"新建文件时自动写入
autocmd BufNewFile *.cpp,*.sh,*.py exec ":call SetTitle()"
"新建文件后快捷键写入
nmap <leader>add :call SetTitle()<CR>
func SetTitle()
" 对于Cpp文件 
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



" ===
" === Install Plugins with Vim-Plug
" ===

" call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')


" 模糊查找器插件
" Plug 'LoricAndre/fzterm.nvim'

" Testing my own plugin Vim中的计算器
" Plug 'theniceboy/vim-calc'

" Treesitter 比默认高亮好一些
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/playground'

" Pretty Dress vim语法高亮显示
" neovim
" Plug 'bpietravalle/vim-bolt'
" Plug 'theniceboy/nvim-deus'
" Plug 'arzg/vim-colors-xcode'
" macvim
" Plug 'connorholyday/vim-snazzy'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'bling/vim-bufferline'

" Status line 状态栏
" Plug 'theniceboy/eleline.vim'
" Plug 'ojroques/vim-scrollstatus'
"Plug 'connorholyday/vim-snazzy'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'ayu-theme/ayu-vim'
"Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" General Highlighter 用于异步显示文件中的颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation 文件目录
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Taglist 标签
Plug 'liuchengxu/vista.vim'
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Debugger 多语言图形调试器
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'davidhalter/jedi-vim'

" Snippets 代码片段
Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'theniceboy/vim-snippets'

" Undo Tree 可视化撤消历史记录
Plug 'mbbill/undotree'

" Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
"Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'

" Autoformat 自动格式化
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Tex 适用于LaTeX文件
" Plug 'lervag/vimtex'

" CSharp 为C＃提供类似IDE的功能
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'leafgarland/typescript-vim'
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'mattn/emmet-vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter  提供文件类型检测，语法突出显示和缩进
Plug 'dart-lang/dart-vim-plugin'
Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }

" Swift
Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" markdown``
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
"Plug 'dkarter/bullets.vim'
"let g:mkdp_path_to_chrome = ""
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'vimwiki/vimwiki'

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement 编辑增强
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'    " 多光标
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
" Plug 'Konfekt/FastFold'
" Plug 'junegunn/vim-peekaboo'
" Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'machakann/vim-highlightedyank' " 高亮显示复制内容

" For general writing
" Plug 'junegunn/goyo.vim'
" Plug 'reedes/vim-wordy'
" Plug 'ron89/thesaurus_query.vim'

" Bookmarks 书签
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Other useful utilities
" Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
" Plug 'xolox/vim-session'
" Plug 'xolox/vim-misc' " vim-session dep
" Other useful utilities
" Plug 'terryma/vim-multiple-cursors'
" Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line


" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'
" Plug 'fadein/vim-FIGlet'

" Error checking 异常检查
"Plug 'w0rp/ale'

" Other visual enhancement
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'itchyny/vim-cursorword'
" Plug 'tmhedberg/SimpylFold'

" Initialize plugin system
call plug#end()
set re=0

" experimental
set lazyredraw
"set regexpengine=1

" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
" let ayucolor="mirage"
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:one_allow_italics = 1
" color dracula
" color one
" color deus
" color gruvbox
" let ayucolor="light"
" color ayu
" color xcodelighthc
" set background=light
" set cursorcolumn

" hi NonText ctermfg=gray guifg=grey10
" hi SpecialKey ctermfg=blue guifg=grey70

"let g:SnazzyTransparent = 1
"color snazzy

" ============================ Start of Plugin Settings =========================

" ===
" === eleline.vim 状态栏
" ===
let g:airline_powerline_fonts = 0
" let g:airline_theme='<theme>' " <theme> 代表某个主题的名称


" ===
" === markdown Settings
" ===
" Snippets
" source ~/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell
" ===
" === vim-markdown-toc
" ===
let g:vmt_auto_update_on_save = 0
let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ===
" === vim-instant-markdown
" ===
"let g:instant_markdown_slow = 0
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_browser = "chrome --new-window"
"let g:instant_markdown_autoscroll = 1
"
"filetype plugin on
"set shell=bash\
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_browser = "chrome --new-window"
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

" ===
" === mrakdown preview
" ===
"let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
""let g:mkdp_browserfunc = 'MKDP_browserfuNc_default'
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_open = 0
"let g:mkdp_auto_close = 1
"let g:mkdp_refresh_slow = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 1
"map <F8> <Plug>MarkdownPreview        " 普通模式
"map <C-F8> <Plug>StopMarkdownPreview        " 插入模式
nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <C-F8> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <C-F8> <Plug>StopMarkdownPreview    " 插入模式
"let g:markdown_preview_sync_chrome_path = ""

" 配置快捷键
"autocmd filetype markdown nnoremap <F9> :MarkSyncPreview<cr>
"autocmd filetype markdown nnoremap <S-F9> :MarkSyncClose<cr>



" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
" let g:gitgutter_sign_allow_clobber = 0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ===
" === coc.nvim
" ===
" let g:coc_global_extensions = [
"	\ 'coc-css',
"	\ 'coc-diagnostic',
"	\ 'coc-explorer',
"	\ 'coc-flutter-tools',
"	\ 'coc-gitignore',
"	\ 'coc-html',
"	\ 'coc-json',
"	\ 'coc-lists',
"	\ 'coc-prettier',
"	\ 'coc-pyright',
"	\ 'coc-python',
"	\ 'coc-snippets',
"	\ 'coc-sourcekit',
"	\ 'coc-stylelint',
"	\ 'coc-syntax',
"	\ 'coc-tasks',
"	\ 'coc-translator',
"	\ 'coc-tslint-plugin',
"	\ 'coc-tsserver',
"	\ 'coc-vetur',
"	\ 'coc-vimlsp',
"	\ 'coc-yaml',
"	\ 'coc-yank']
" inoremap <silent><expr> <TAB>
"	\ pumvisible() ? "\<C-n>" :
"	\ <SID>check_back_space() ? "\<TAB>" :
"	\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()
" function! Show_documentation()
"	call CocActionAsync('highlight')
"	if (index(['vim','help'], &filetype) >= 0)
"		execute 'h '.expand('<cword>')
"	else
"		call CocAction('doHover')
" 	endif
" endfunction
" nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '~/.config/nvim/log.txt'

" nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
" nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
" nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" nnoremap <c-c> :CocCommand<CR>
" Text Objects
" xmap kf <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap kf <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" xmap kc <Plug>(coc-classobj-i)
" omap kc <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" Useful commands
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" nmap tt :CocCommand explorer<CR>
" coc-translator
" nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-e> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-n>'
" imap <C-e> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'David Chen'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc





" ===
" === vim-table-mode
" ===
" noremap <LEADER>tm :TableModeToggle<CR>
" let g:table_mode_disable_mappings = 1
" let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === FZF 模糊查找
" ===
" set rtp+=/usr/local/opt/fzf
" set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
" set rtp+=/home/david/.linuxbrew/opt/fzf
" nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
" noremap <silent> <C-f> :Rg<CR>
" noremap <silent> <C-h> :History<CR>
" noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
" noremap <silent> <C-w> :Buffers<CR>
" noremap <leader>; :History:<CR>

"let g:fzf_preview_window = 'right:60%'
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"function! s:list_buffers()
"  redir => list
"  silent ls
"  redir END
"  return split(list, "\n")
"endfunction

"function! s:delete_buffers(lines)
"  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
"endfunction

"command! BD call fzf#run(fzf#wrap({
"  \ 'source': s:list_buffers(),
"  \ 'sink*': { lines -> s:delete_buffers(lines) },
"  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
"\ }))

" noremap <c-d> :BD<CR>

"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_PreviewCode = 1
" let g:Lf_ShowHidden = 1
" let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
" \   '<C-k>': ['<C-u>'],
" \   '<C-j>': ['<C-e>'],
" \   '<C-]>': ['<C-v>'],
" \   '<C-p>': ['<C-n>'],
" \}
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WildIgnore = {
"         \ 'dir': ['.git', 'vendor', 'node_modules'],
"         \ 'file': ['__vim_project_root']
"         \}
" let g:Lf_UseMemoryCache = 0
" let g:Lf_UseCache = 0


" ===
" === CTRLP (Dependency for omnisharp)
" ===
" let g:ctrlp_map = ''
" let g:ctrlp_cmd = 'CtrlP'


" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1


" ===
" === Undotree
" ===
" noremap L :UndotreeToggle<CR>
" let g:undotree_DiffAutoOpen = 1
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_ShortIndicators = 1
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 8
" let g:undotree_SplitWidth = 24
" function g:Undotree_CustomMap()
"	nmap <buffer> u <plug>UndotreeNextState
"	nmap <buffer> e <plug>UndotreePreviousState
"	nmap <buffer> U 5<plug>UndotreeNextState
"	nmap <buffer> E 5<plug>UndotreePreviousState
" endfunc


" ==
" == vim-multiple-cursor
" ==
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'


" ===
" === vim-visual-multi 多光标
" ===
" let g:VM_theme             = 'iceblue'
" let g:VM_default_mappings = 0
" let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
" let g:VM_maps                       = {}
" let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
" let g:VM_maps['i']                  = 'k'
" let g:VM_maps['I']                  = 'K'
" let g:VM_maps['Find Under']         = '<C-k>'
" let g:VM_maps['Find Subword Under'] = '<C-k>'
" let g:VM_maps['Find Next']          = ''
" let g:VM_maps['Find Prev']          = ''
" let g:VM_maps['Remove Region']      = 'q'
" let g:VM_maps['Skip Region']        = '<c-n>'
" let g:VM_maps["Undo"]               = 'l'
" let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Far.vim
" ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
"		\ "replace_undo" : ["l"],
"		\ }


" ===
" === vim-calc
" ===
" noremap <LEADER>a :call Calc()<CR>
" Testing
" if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
" source ~/Github/vim-calc/vim-calc.vim
" endif


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
" let g:bullets_enabled_file_types = [
"			\ 'markdown',
"			\ 'text',
"			\ 'gitcommit',
"			\ 'scratch'
"			\]


" ===
" === Vista.vim
" ===
" noremap <LEADER>v :Vista!!<CR>
" noremap <c-t> :silent! Vista finder coc<CR>
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_default_executive = 'coc'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
" noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END



" ===
" === vimtex
" ===
" let g:vimtex_view_method = ''
" let g:vimtex_view_general_viewer = 'llpp'
" let g:vimtex_mappings_enabled = 0
" let g:vimtex_text_obj_enabled = 0
" let g:vimtex_motion_enabled = 0
" let maplocalleader=' '


" ===
" === vim-calendar
" ===
" noremap \c :Calendar -position=here<CR>
" noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" augroup calendar-mappings
"	autocmd!
	" diamond cursor
"	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
"	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
"	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
"	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
"	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
"	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
"	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
"	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
"	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
"	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
"	" unmap <C-n>, <C-p> for other plugins
"	autocmd FileType calendar nunmap <buffer> <C-n>
"	autocmd FileType calendar nunmap <buffer> <C-p>
" augroup END


" ===
" === vim-go
" ===
" let g:go_echo_go_info = 0
" let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_template_autocreate = 0
" let g:go_textobj_enabled = 0
" let g:go_auto_type_info = 1
" let g:go_def_mapping_enabled = 0
" let g:go_highlight_array_whitespace_error = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_chan_whitespace_error = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_format_strings = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_space_tab_error = 1
" let g:go_highlight_string_spellcheck = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_trailing_whitespace_error = 1
" let g:go_highlight_types = 1
" let g:go_highlight_variable_assignments = 0
" let g:go_highlight_variable_declarations = 0
" let g:go_doc_keywordprg_enabled = 0


" ===
" === AutoFormat
" ===
" augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	" autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	" autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
" augroup END


" ===
" === OmniSharp
" ===
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1

" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'ctrlp'

" autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
" autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
" autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

" sign define OmniSharpCodeActions text=💡

" augroup OSCountCodeActions
"	autocmd!
"	autocmd FileType cs set signcolumn=yes
"	autocmd CursorHold *.cs call OSCountCodeActions()
" augroup END

" function! OSCountCodeActions() abort
"	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
"	if !OmniSharp#IsServerRunning() | return | endif
"	let opts = {
"				\ 'CallbackCount': function('s:CBReturnCount'),
"				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
"				\}
"	call OmniSharp#CountCodeActions(opts)
" endfunction

" function! s:CBReturnCount(count) abort
"	if a:count
"		let l = getpos('.')[1]
"		let f = expand('%:p')
" 		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
" 	endif
" endfunction


" ===
" === vim-easymotion
" ===
" let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_do_shade = 0
" let g:EasyMotion_smartcase = 1
" map ' <Plug>(easymotion-overwin-f2)
" nmap ' <Plug>(easymotion-overwin-f2)
" map E <Plug>(easymotion-j)
" map U <Plug>(easymotion-k)
" nmap f <Plug>(easymotion-overwin-f)
" map \; <Plug>(easymotion-prefix)
" nmap ' <Plug>(easymotion-overwin-f2)
" map 'l <Plug>(easymotion-bd-jk)
" nmap 'l <Plug>(easymotion-overwin-line)
" map  'w <Plug>(easymotion-bd-w)
" nmap 'w <Plug>(easymotion-overwin-w)


" ===
" === goyo
" ===
" map <LEADER>gy :Goyo<CR>


" ===
" === jsx
" ===
" let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
" vmap ga :Tabularize /


" ===
" === vim-after-object
" ===
" autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
" let g:rainbow_active = 1


" ===
" === xtabline
" ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
" noremap \p :echo expand('%:p')<CR>


" ===
" === vim-session
" ===
" let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
" let g:session_autosave = 'no'
" let g:session_autoload = 'no'
" let g:session_command_aliases = 1
" set sessionoptions-=buffers
" set sessionoptions-=options
" noremap sl :OpenSession<CR>
" noremap sS :SaveSession<CR>
" noremap ss :SaveSession 
" noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
" noremap so :OpenSession default<CR>
" noremap sD :DeleteSession<CR>
" noremap sA :AppendTabSession<CR>


" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
" cnoreabbrev sudowrite w suda://%
" cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
"			\   'sink': function('<sid>read_template_into_buffer')
"			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad


" ===
" === reply.vim
" ===
" noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
" noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
" noremap <LEADER>rt :ReplStop<CR>

" ===
" === rnvimr
" ===
" let g:rnvimr_ex_enable = 1
" let g:rnvimr_pick_enable = 1
" let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
" highlight link RnvimrNormal CursorLine
" nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
" let g:rnvimr_action = {
"             \ '<C-t>': 'NvimEdit tabedit',
"             \ '<C-x>': 'NvimEdit split',
"             \ '<C-v>': 'NvimEdit vsplit',
"             \ 'gw': 'JumpNvimCwd',
"             \ 'yw': 'EmitRangerCwd'
"             \ }
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': &columns,
"             \ 'height': &lines,
"             \ 'col': 0,
"             \ 'row': 0,
"            \ 'style': 'minimal' }
" let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ===
" === vim-subversive
" ===
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)


" ===
" === vim-illuminate
" ===
" let g:Illuminate_delay = 750
" hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
" let g:rooter_patterns = ['__vim_project_root', '.git/']
" let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
" noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
" let g:asyncrun_open = 6


" ===
" === dart-vim-plugin
" ===
" let g:dart_style_guide = 2
" let g:dart_format_on_save = 1
" let g:dartfmt_options = ["-l 100"]


" ===
" === tcomment_vim
" ===
" nnoremap ci cl
" let g:tcomment_textobject_inlinecomment = ''
" nmap <LEADER>cn g>c
" vmap <LEADER>cn g>
" nmap <LEADER>cu g<c
" vmap <LEADER>cu g<


" ===
" === NrrwRgn
" ===
" let g:nrrw_rgn_nomap_nr = 1
" let g:nrrw_rgn_nomap_Nr = 1
" noremap <c-y> :NR<CR>


" ===
" === any-jump
" ===
" nnoremap j :AnyJump<CR>
" let g:any_jump_window_width_ratio  = 0.8
" let g:any_jump_window_height_ratio = 0.9


" ===
" === typescript-vim
" ===
" let g:typescript_ignore_browserwords = 1


" ===
" === Agit
" ===
" nnoremap <LEADER>gl :Agit<CR>
" let g:agit_no_default_mappings = 1


" ===
" === nvim-treesitter
" ===
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"   },
" }
" EOF

" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
" exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
" if has_machine_specific_file == 0
" 	exec "e ~/.config/nvim/_machine_specific.vim"
" endif

" ====================
" === OLD SETTINGS ===
" ====================
" ===
" === NERDTree
" ===
" map tt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = ""
" let NERDTreeMapUpdirKeepOpen = "l"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeOpenVSplit = ""
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = "n"
" let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
" let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Unknown"   : "?"
"    \ }

" ===
" === ale 异常检查
" ===
" let b:ale_linters = ['pylint']
" let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Python-syntax
" ===
" let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === vim-indent-guide
" ===
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 1
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === vim-signiture
" ===
" let g:SignatureMap = {
"        \ 'Leader'             :  "m",
"        \ 'PlaceNextMark'      :  "m,",
"        \ 'ToggleMarkAtLine'   :  "m.",
"        \ 'PurgeMarksAtLine'   :  "dm-",
"        \ 'DeleteMark'         :  "dm",
"        \ 'PurgeMarks'         :  "dm/",
"        \ 'PurgeMarkers'       :  "dm?",
"        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
"        \ 'GotoPrevLineAlpha'  :  "",
"        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
"        \ 'GotoPrevSpotAlpha'  :  "",
"        \ 'GotoNextLineByPos'  :  "",
"        \ 'GotoPrevLineByPos'  :  "",
"        \ 'GotoNextSpotByPos'  :  "mn",
"        \ 'GotoPrevSpotByPos'  :  "mp",
"        \ 'GotoNextMarker'     :  "",
"        \ 'GotoPrevMarker'     :  "",
"        \ 'GotoNextMarkerAny'  :  "",
"        \ 'GotoPrevMarkerAny'  :  "",
"        \ 'ListLocalMarks'     :  "m/",
"        \ 'ListLocalMarkers'   :  "m?"
"        \ }


" ===
" === Undotree
" ===
" let g:undotree_DiffAutoOpen = 0
" map L :UndotreeToggle<CR>


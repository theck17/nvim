[TOC]
# nvim
### Reference from https://github.com/theniceboy/nvim
### debugging

## YOU NEED TO
* set default_configs/_machine_specific.vim
* Install pip, and do pip install debugpy
* Install pip, and do pip install --user pynvim
* Install pip3, and do pip3 install --user pynvim
* Install node.js, and do npm install -g neovim
* Install nerd-fonts (actually it's optional but it looks real good)
```bash
>>> git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
>>> cd nerd-fonts
>>> ./install.sh
```
## YOU WANT TO

* Do :checkhealth

* For Taglist: Install ctags for function/class/variable list
```bash
# 使用 Homebrew 安装 ctags:
brew install ctags
# 替换默认 ctags
$ echo 'alias ctags="`brew --prefix`/bin/ctags"' >> $HOME/.zshrc
$ exec $SHELL
# bash 用户加入 $HOME/.bashrc，测试：
$ ctags -R --exclude=.git --exclude=log *
```
* For FZF: Install fzf
```bash
# for Mac
# install fd & fzf
$ brew install fd fzf

# bind default key-binding
$ /usr/local/opt/fzf/install
$ source ~/.zshrc

# alter filefind to fd
$ vim ~/.zshrc
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd -t d . "

$ source ~/.zshrc

# Ctrl+R History command; Ctrl+R file catalog
# if you want to DIY key of like 'Atl + C'
# maybe line-num is not 66, but must nearby
$ vim /usr/local/opt/fzf/shell/key-bindings.zsh
- 66 bindkey '\ec' fzf-cd-widget
+ 66 bindkey '^\' fzf-cd-widget

$ source /usr/local/opt/fzf/shell/key-bindings.zsh

# for Ubuntu
# install fzf & bind default key-binding
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
$ source ~/.zshrc

# install fd, url from https://github.com/sharkdp/fd/releases
$ wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd_7.2.0_amd64.deb
$ sudo dpkg -i fd_7.2.0_amd64.deb

# alter filefind to fd
$ vim ~/.zshrc
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd -t d . "

$ source ~/.zshrc

# Ctrl+R History command; Ctrl+R file catalog
# if you want to DIY key of like 'Atl + C'
# maybe line-num is not 64, but must nearby
$ vim ~/.fzf/shell/key-bindings.zsh
- 64 bindkey '\ec' fzf-cd-widget
+ 64 bindkey '^\' fzf-cd-widget

$ source ~/.fzf/shell/key-bindings.zsh

# set alias
$ vim ~/.zshrc
alias pp='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"'"
$ source ~/.zshrc
```
* Install ag (the_silver_searcher)
```bash
brew install the_silver_searcher

# use in init.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
# or
let g:ackprg = 'ag --vimgrep'
```

* Install figlet for inputing text ASCII art
```hash
npm install figlet
```
* Install xclip for system clipboard access (Linux and xorg only)
```bash
sudo apt-get xclip
```
* Install instant-markdown-d
```bash
sudo npm -g install instant-markdown-d
```

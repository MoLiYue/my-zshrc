# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8.1
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes @molovo

zi load z-shell/H-S-MW


#zsh插件
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-autosuggestions


#导入OMZ
zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh
zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/termsupport.zsh

#安装theme的前置内容
zi snippet OMZL::git.zsh
zi snippet OMZP::git
zi cdclear -q

#设置theme
setopt promptsubst
zi light romkatv/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

#OMZ插件
zi snippet OMZP::dotenv
zi snippet OMZP::rake
zi snippet OMZP::rbenv
zi snippet OMZP::ruby
zi snippet OMZP::autojump
zi snippet OMZP::pip
zi snippet OMZP::sublime
zi snippet OMZP::sudo
zi snippet OMZP::rails
zi snippet OMZP::textmate
zi snippet OMZP::lighthouse

#zsh自动填充
setopt AUTO_PUSHD




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#----------------------------------------------------exa使用------------------------------------------------------------
zi light DarrinTisdale/zsh-aliases-exa

# general use
alias ls='exa'                                                         # ls
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# speciality views
alias lS='exa -1'                                                      # one column, just names
alias lt='exa --tree --level=2'                                        # tree
#-----------------------------------------------------------------------------------------------------------------------
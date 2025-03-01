# System Proxy
# export ALL_PROXY=127.0.0.1:7890
# export HTTP_PROXY=192.168.0.108:8899
# export HTTPS_PROXY=192.168.0.108:8899
# export SOCKS5_PROXY=192.168.0.108:9988

### Added by Zinit's installer
  if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
      print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
      command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
      command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
  fi

  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Load a few important annexes, without Turbo
  # (this is currently required for annexes)
  zinit light-mode for \
      zdharma-continuum/zinit-annex-as-monitor \
      zdharma-continuum/zinit-annex-bin-gem-node \
      zdharma-continuum/zinit-annex-patch-dl \
      zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

# Common Configuration

  zi load z-shell/H-S-MW

  # zsh plugins
  zi light zsh-users/zsh-completions
  zi light zdharma/fast-syntax-highlighting
  # zi light zsh-users/zsh-syntax-highlighting
  zi light zsh-users/zsh-autosuggestions

  # exa is not maintained and mv to eza
  # zi light DarrinTisdale/zsh-aliases-exa
  zi light z-shell/zsh-eza

  # zi light Aloxaf/fzf-tab

## Zinit Setting

# Must Load OMZ Git library
zi snippet OMZL::git.zsh

# Load Git plugin from OMZ
zi snippet OMZP::git
zi snippet OMZP::urltools
zi cdclear -q # <- forget completions provided up to this moment

zinit ice depth=1; zinit light romkatv/powerlevel10k

####### oh my zsh snippets #######
####################################
# zinit snippet <URL>        # Raw Syntax with URL
# zinit snippet OMZ::<PATH>  # Shorthand OMZ/ (https://github.com/ohmyzsh/ohmyzsh/raw/master/)
# zinit snippet OMZL::<PATH> # Shorthand OMZ/lib/
# zinit snippet OMZT::<PATH> # Shorthand OMZ/themes/
# zinit snippet OMZP::<PATH> # Shorthand OMZ/plugins/
####################################
  zi snippet OMZL::clipboard.zsh		    # without omz_urlencode
  zi snippet OMZL::completion.zsh
  zi snippet OMZL::history.zsh
  zi snippet OMZL::key-bindings.zsh	    # without omz_urlencode
  zi snippet OMZL::theme-and-appearance.zsh   # without omz_urlencode
  zi snippet OMZL::functions.zsh
  zi snippet OMZL::termsupport.zsh	    # with omz_urlencode

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
  zi snippet OMZP::gitignore
  zi snippet OMZP::colored-man-pages
  zi snippet OMZP::cp
  zi snippet OMZP::brew
  zi snippet OMZP::npm
  # zi snippet OMZP::tmux

#zsh自动填充
  setopt AUTO_PUSHD

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 一些指令重写
# alias egrep='egrep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias grep='grep --color=auto'
# alias l='ls -CF'
# alias la='ls -A'
# alias ll='ls -alF'
# alias ls='ls --color=auto'
# alias ls='eza'

alias ra='ranger'

# Spcific configuration
  os=$(uname)

  # MacOS
  if [[ $os == "Darwin" ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.jdk/Contents/Home
    # export PATH="/opt/homebrew/Cellar/node@16/bin:$PATH"
    export PATH="/opt/homebrew/Cellar/node/21.7.1/bin:$PATH"
    export EDITOR=/opt/homebrew/bin/nvim
  elif [ "$os" = "Linux" ]; then

  fi


eval $(thefuck --alias)



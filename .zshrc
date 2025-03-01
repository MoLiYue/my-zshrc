# ---------------------------
# Choose Plugin Manager:
# Set ZSH_PLUGIN_MANAGER to "ZI" for Zi or "ZINIT" for Zinit.
# ---------------------------
ZSH_PLUGIN_MANAGER="ZI"  # Change to "ZINIT" to use Zinit

if [[ "$ZSH_PLUGIN_MANAGER" == "ZI" ]]; then
  #############################
  # Initialize Zi Plugin Manager
  #############################
  typeset -A ZI
  ZI[BIN_DIR]="${HOME}/.zi/bin"
  source "${ZI[BIN_DIR]}/zi.zsh"

  # Enable Zi autocompletion
  autoload -Uz _zi
  (( ${+_comps} )) && _comps[zi]=_zi

  # Use PLUGIN_CMD to load plugins later
  PLUGIN_CMD="zi"

elif [[ "$ZSH_PLUGIN_MANAGER" == "ZINIT" ]]; then
  #############################
  # Initialize Zinit Plugin Manager
  #############################
  ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
  [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
  [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
  source "${ZINIT_HOME}/zinit.zsh"

  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Use PLUGIN_CMD to load plugins later
  PLUGIN_CMD="zinit"

else
  echo "Unknown ZSH_PLUGIN_MANAGER value: $ZSH_PLUGIN_MANAGER. Please set it to either 'ZI' or 'ZINIT'."
  return 1
fi

# ---------------------------
# System Proxy Settings (Uncomment if needed)
# export ALL_PROXY=127.0.0.1:7890
# export HTTP_PROXY=192.168.0.108:8899
# export HTTPS_PROXY=192.168.0.108:8899
# export SOCKS5_PROXY=192.168.0.108:9988
# ---------------------------

#############################
# Powerlevel10k Theme Setup
#############################
# Enable Powerlevel10k instant prompt for faster startup (keep near the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k with shallow clone for speed (depth=1)
$PLUGIN_CMD ice depth=1
$PLUGIN_CMD light romkatv/powerlevel10k

# Source user-specific Powerlevel10k configuration if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#############################
# Common Zsh Plugin Configuration
#############################
# Standard plugins for a better shell experience
$PLUGIN_CMD light z-shell/H-S-MW
$PLUGIN_CMD light zsh-users/zsh-completions
$PLUGIN_CMD light zdharma/fast-syntax-highlighting
# Alternatively, you can use the official syntax highlighting:
# $PLUGIN_CMD light zsh-users/zsh-syntax-highlighting
$PLUGIN_CMD light zsh-users/zsh-autosuggestions

# exa is no longer maintained; using eza as a replacement
# $PLUGIN_CMD light DarrinTisdale/zsh-aliases-exa  # Deprecated exa version
$PLUGIN_CMD light z-shell/zsh-eza

# Optional plugin (e.g., fzf-tab can be enabled if desired)
# $PLUGIN_CMD light Aloxaf/fzf-tab

#############################
# Oh My Zsh Snippets Loading
#############################
# Load useful snippets from Oh My Zsh repositories

# Load Git library snippet and then the Git plugin
$PLUGIN_CMD snippet OMZL::git.zsh
$PLUGIN_CMD snippet OMZP::git
$PLUGIN_CMD snippet OMZP::urltools

# Clear completions loaded so far to prevent conflicts
$PLUGIN_CMD cdclear -q

# Load additional common snippets
$PLUGIN_CMD snippet OMZL::clipboard.zsh         # Clipboard management
$PLUGIN_CMD snippet OMZL::completion.zsh          # Command completions
$PLUGIN_CMD snippet OMZL::history.zsh             # Command history
$PLUGIN_CMD snippet OMZL::key-bindings.zsh        # Key bindings
$PLUGIN_CMD snippet OMZL::theme-and-appearance.zsh  # Theme and appearance
$PLUGIN_CMD snippet OMZL::functions.zsh           # Common functions
$PLUGIN_CMD snippet OMZL::termsupport.zsh         # Terminal support

# Load Oh My Zsh plugin snippets
$PLUGIN_CMD snippet OMZP::dotenv
$PLUGIN_CMD snippet OMZP::rake
$PLUGIN_CMD snippet OMZP::rbenv
$PLUGIN_CMD snippet OMZP::ruby
$PLUGIN_CMD snippet OMZP::autojump
$PLUGIN_CMD snippet OMZP::pip
$PLUGIN_CMD snippet OMZP::sublime
$PLUGIN_CMD snippet OMZP::sudo
$PLUGIN_CMD snippet OMZP::rails
$PLUGIN_CMD snippet OMZP::textmate
$PLUGIN_CMD snippet OMZP::lighthouse
$PLUGIN_CMD snippet OMZP::gitignore
$PLUGIN_CMD snippet OMZP::colored-man-pages
$PLUGIN_CMD snippet OMZP::cp
$PLUGIN_CMD snippet OMZP::brew
$PLUGIN_CMD snippet OMZP::npm
# If needed, you can enable a tmux-related snippet:
# $PLUGIN_CMD snippet OMZP::tmux

# Custom aliases and tools
alias ra='ranger'
eval "$(thefuck --alias)"

#############################
# OS Specific Configuration
#############################
os=$(uname)

if [[ $os == "Darwin" ]]; then
  # macOS specific settings
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-18.0.2.jdk/Contents/Home"
  # Uncomment the following line if using an older Node version:
  # export PATH="/opt/homebrew/Cellar/node@16/bin:$PATH"
  export PATH="/opt/homebrew/Cellar/node/21.7.1/bin:$PATH"
  export EDITOR="/opt/homebrew/bin/nvim"
elif [[ $os == "Linux" ]]; then
  # Linux specific settings (add your Linux configurations here)
  :
fi

# ────────────────────────────────────────────────
#  vanny's zsh setup — fast, clean, minimal
# ────────────────────────────────────────────────

fastfetch

# ─── Aliases ────────────────────────────────────
alias vim='nvim'
alias v='nvim'
alias chromium='chromium --disable-features=UseChromeOSDirectVideoDecoder'

# ─── Environment ────────────────────────────────
export EDITOR='nvim'
export BAT_THEME='gruvbox-dark'
export MANPAGER='nvim +Man!'
export TERM='xterm-256color'
export ZSH="$HOME/.oh-my-zsh"
[[ -d /usr/local/opt/fzf/bin ]] && PATH+="/usr/local/opt/fzf/bin"

# ─── Oh My Zsh ─────────────────────────────────
ZSH_THEME="minimal"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source "$ZSH/oh-my-zsh.sh"

# ─── Prompt (Custom vanny look) ────────────────
autoload -Uz promptinit && promptinit
PROMPT='%F{magenta}vanny%f %F{blue}❯%f '

# ─── Autosuggestions & Syntax Highlighting ────
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ─── FZF Integration ───────────────────────────
if command -v rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_DEFAULT_OPTS='--height 50% --border --info=inline'
fi

# ─── Performance Tweaks ────────────────────────
setopt no_nomatch
setopt prompt_subst
set +m

# ─── Completion ────────────────────────────────
autoload -Uz compinit && compinit -C

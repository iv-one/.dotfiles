export ZLE_RPROMPT_INDENT=0
export PATH="$HOME/.cargo/bin:$PATH:$HOME/bin"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

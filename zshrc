#
# Executes commands at the start of an interactive session.
# Executes Third
#

#
# Homebrew
#

if [[ -s "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#
# ASDF
#

if [[ -s "$HOME/.asdf/asdf.sh" ]]; then
  source "$HOME/.asdf/asdf.sh"

  fpath=(${ASDF_DIR}/completions $fpath)
fi

#
# Prezto
#

if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

# Allow History Substring Search With Up/Down nd UP and DOWN arrow keys
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

autoload -U compinit && compinit

autoload -Uz compinit && compinit
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "(%b)"
precmd () { vcs_info }

PROMPT='%F{cyan}%~ %F{magenta}${vcs_info_msg_0_}
%F{cyan}$%F{white} '

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
if [[ "$(uname)" == "Linux" ]]; then
    export PATH="$HOME/development/flutter/bin:$PATH"
fi
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

eval "$(zabrze init --bind-keys)"
eval "$(gh completion -s zsh)"
eval "$(uv generate-shell-completion zsh)"

export MENT_EDITOR="nvim"

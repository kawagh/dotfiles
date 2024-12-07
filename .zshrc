autoload -Uz compinit && compinit
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "(%b)"
precmd () { vcs_info }

PROMPT='%F{cyan}%~ %F{magenta}${vcs_info_msg_0_}
%F{cyan}$%F{white} '

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"

eval "$(zabrze init --bind-keys)"

export MENT_EDITOR="nvim"

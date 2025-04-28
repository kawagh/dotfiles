autoload -Uz compinit && compinit
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "(%b)"
precmd () { vcs_info }

PROMPT='%F{cyan}%~ %F{magenta}${vcs_info_msg_0_}
%F{cyan}$%F{white} '

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
fi
if [[ "$(uname)" == "Linux" ]]; then
    export PATH="$HOME/development/flutter/bin:$PATH"
    export SDKMAN_DIR="$HOME/.sdkman"
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

eval "$(zabrze init --bind-keys)"
eval "$(gh completion -s zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(task --completion zsh)"

export MENT_EDITOR="nvim"
export PATH="$HOME/go/bin:$PATH"
. "$HOME/.deno/env"

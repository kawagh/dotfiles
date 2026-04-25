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
    export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
    export MENT_DIR="$HOME/ghq/github.com/kawagh/ment_dir"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export GIT_EDITOR=nvim

eval "$(zabrze init --bind-keys)"
eval "$(gh completion -s zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(task --completion zsh)"

export MENT_EDITOR="nvim"

. "$HOME/.deno/env"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# opencode
export PATH=$HOME/.opencode/bin:$PATH

eval "$(register-python-argcomplete redi)"

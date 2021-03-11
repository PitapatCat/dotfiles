# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#1d2021,bg:#f9f5d7,hl:#7c6f64
 --color=fg+:#1d2021,bg+:#ebdbb2,hl+:#9d0006
 --color=info:#689d6a,prompt:#9d0006,pointer:#9d0006
 --color=marker:#9d0006,spinner:#9d0006,header:#689d6a'

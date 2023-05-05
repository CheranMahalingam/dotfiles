ZSH_THEME="darkblood"

plugins=(
  git
  zsh-autosuggestions
  virtualenv)

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--bind=ctrl-k:up,ctrl-j:down'

bindkey '^ ' autosuggest-accept

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cheranm/programming/install/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cheranm/programming/install/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cheranm/programming/install/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cheranm/programming/install/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

eval "$(register-python-argcomplete conda)"
# <<< conda initialize <<<

source <(kubectl completion zsh)

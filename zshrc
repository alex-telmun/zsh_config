# Key bindigs: Emacs mode
bindkey -e

# Remembering recent directories
setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS
## This reverts the +/- operators.
setopt PUSHD_MINUS

# Help command configuration
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help
# Commands history settings
setopt HIST_IGNORE_DUPS HIST_FIND_NO_DUPS INC_APPEND_HISTORY
HISTSIZE=100000
HISTFILE=~/.zhistfile
SAVEHIST=100000

# Autocomplete configuration
autoload -Uz compinit && compinit
setopt COMPLETEALIASES
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli
complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/packer packer

# $PATH configuration
typeset -U path
path=(~/bin $path[@])

# Unknown commands handler
source /usr/share/doc/pkgfile/command-not-found.zsh
# Load sytax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source included configs
ZSH_CONF_DIR=/etc/zsh/zshrc.d
typeset -a ZSH_CONF_FILES
ZSH_CONF_FILES=('aliases' 'functions' 'prompt')
for config in ${ZSH_CONF_FILES}
do
  [[ -f "${ZSH_CONF_DIR}/${config}" ]] && . ${ZSH_CONF_DIR}/${config}
done

# Nice system information above prompt
if [[ -f /usr/bin/alsi ]]; then
  alsi -n -t -u -c1=white -c2=blue
elif [[ -f /usr/bin/neofetch ]]; then
  neofetch --config /etc/neofetch/config
fi

# Load kubernetes configurations
if [ -f ~/.kube/config_list ]; then
  KUBECONFIG=$(paste -sd ':' ~/.kube/config_list)
  export KUBECONFIG
fi

# ENV settings
export TERM="xterm-256color"
export EDITOR="vim"
export ALTERNATE_EDITOR="nano"
export VISUAL="vim"
export PAGER="less"
export GPG_TTY=$(tty)

setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history

# aliases
alias g=git
alias d-c=docker-compose

# vcs_info
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -U vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '[%b]%m'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]%m'
precmd () {
    psvar=()
    vcs_info
    psvar[1]="$vcs_info_msg_0_"
}
PROMPT='[%T]%m%# '
RPROMPT='%~%F{5}%1v%f'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nsugimoto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

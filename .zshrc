autoload -Uz vcs_info
autoload -Uz add-zsh-hook
_precmd_1 () { vcs_info }
add-zsh-hook precmd _precmd_1
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'

case "${TERM}" in
kterm*|xterm*)
    _precmd_2() {
	
        echo -ne "\033]0;${PWD##/*/}\007"
    }
    add-zsh-hook precmd _precmd_2
    ;;
esac

PS1="[%~]"

#補完機能を使用する
autoload -U compinit promptinit
compinit

alias nez='java -jar ~/Documents/Github/nez-1/nez.jar'
alias relogin='exec $SHELL -l'
alias gits='git status'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

setopt hist_ignore_dups
setopt auto_cd

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

CLASSPATH=.:~/Documents/Mouse-1.6.1/Mouse-1.6.1.jar; export CLASSPATH

# Created by newuser for 5.0.7
export PATH=$HOME/.nodebrew/current/bin:$PATH
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi
export PGDATA=/usr/local/var/postgres

export PATH=$HOME/Library/Haskell/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PERL5LIB=/Users/tsunade/perl5/lib/perl5
PERL_MB_OPT="--install_base \"/Users/tsunade/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/tsunade/perl5"; export PERL_MM_OPT;

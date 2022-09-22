# If you come from bash you might have to change your $PATH.
source "${HOME}/.zsh.d/path.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export LANG=en_US.UTF-8
export EDITOR='vim'

source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

# Personal

source "${HOME}/.zsh.d/aliases.zsh"
source "${HOME}/.zsh.d/functions.zsh"

PATH="/home/ishtar/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ishtar/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ishtar/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ishtar/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ishtar/perl5"; export PERL_MM_OPT;

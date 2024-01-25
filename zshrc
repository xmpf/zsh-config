# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# --- THEME

ZSH_THEME="robbyrussell"

# --- PLUGINS

plugins=(git)

source $ZSH/oh-my-zsh.sh

# --- ENV

export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
# export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# --- CUSTOM ZSH

ZSH_CUSTOM="${XDG_CONFIG_HOME}/zsh/zsh.d"
for file in `ls -1 "${ZSH_CUSTOM}"`; do
	source "${ZSH_CUSTOM}/${file}"
done

# --- PATH

RUBY_BIN="$HOME/.local/share/gem/ruby/3.0.0/bin"
LOCAL_BIN="${HOME}/.local/bin"
CARGO_BIN="${HOME}/.cargo/bin"
CODEQL_BIN="${HOME}/tools/codeql/codeql"

export GOBIN="${HOME}/go/bin"

export PATH="${PATH}:${RUBY_BIN}:${LOCAL_BIN}:${CARGO_BIN}:${GOBIN}:${CODEQL_BIN}"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit 

# fix tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export PYENV_ROOT="${HOME}/.pyenv"
command -v pyenv >/dev/null || export PATH="${PATH}:${PYENV_ROOT}/bin"
eval "$(pyenv init -)" 

source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc # add autocomplete permanently to your zsh shell
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="skovhus" # simple, kennethreitz, agnoster, robbyrussell

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew docker git yarn)

source $ZSH/oh-my-zsh.sh

fpath=(/usr/local/share/zsh-completions $fpath)


# =========================================
# User configuration
# =========================================

alias ls='ls -lah'

alias proxy_db_bloom="cloud_sql_proxy -instances=tmrowapp:europe-west1:postgres-v13=tcp:5432"
alias proxy_db_emap="cloud_sql_proxy -instances=tmrow-152415:europe-west1:pgdb=tcp:5432"

export PATH=$HOME/bin:$HOME/.yarn/bin:/usr/local/bin:$PATH
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='nano'
fi

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * / =
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
bindkey -s "^[OX" "="

# sierra and ssh
ssh-add -A 2>/dev/null;

export ANDROID_HOME=/Users/kenneth/Library/Android/sdk
export ANDROID_HOME_SDK=$ANDROID_HOME
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="/Users/kenneth/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export CLOUDSDK_PYTHON=/usr/local/bin/python3
export PATH="/usr/local/opt/node@14/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kenneth/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kenneth/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kenneth/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kenneth/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"

# Pillow/psycopg2
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GPG_TTY=$(tty)

# nvm version
nvm use 16

export PNPM_HOME="/Users/kenneth/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Pleo stuff

export PATH="$PATH:/Users/kenneth/git/terraform/bin"

# bun completions
[ -s "/Users/kenneth/.bun/_bun" ] && source "/Users/kenneth/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/kenneth/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

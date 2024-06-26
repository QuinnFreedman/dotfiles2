# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/quinn/.oh-my-zsh"

DEFAULT_USER=`whoami`

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
PROMPT_EOL_MARK=$'\u23ce\u0338'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract docker zsh-syntax-highlighting copypath copyfile fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='gvim'
# fi
export EDITOR='hx'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

prompt_context() {}


# auto-load dotfile manager

include () {
    [[ -f "$1" ]] && source "$1"
}

if [[ ! -z "$WSL_DISTRO_NAME" && -t 1 && -z "$TMUX" ]]; then
    # running inside WSL terminal
    tmux new-session -A -s main
fi


# aliases

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias open="xdg-open"

if command -v lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='ls -lh'
  alias la='ls -a'
  alias lla='ls -lahF'
  alias lt='ls --tree'
fi

if command -v bat &> /dev/null; then
  alias cat='bat'
elif command -v batcat &> /dev/null; then
  alias cat='batcat'
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

alias path='echo $PATH | sed "s/:/\\n/g"'

fpath+=~/.zfunc

# PATH
 
export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.local/share/flatpak/exports/bin"

# export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
# export PATH="$PATH:$HOME/zig"
export PATH="$PATH:$HOME/.cargo/env"

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

if command -v yarn &>/dev/null; then
    # export PATH="$(yarn global bin):$PATH"
    export PATH="$PATH:$HOME/.yarn/bin"
fi

# set ANDROID_SDK_ROOT
# export ANDROID_SDK_ROOT="$HOME/.android/sdk"
# export ANDROID_HOME="$ANDROID_SDK_ROOT"
# export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# # bun completions
# [ -s "/home/quinn/.bun/_bun" ] && source "/home/quinn/.bun/_bun"

# # bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:$HOME/.cargo/bin"

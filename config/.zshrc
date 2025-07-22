# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="void"

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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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

# Skip verification of insecure directories
ZSH_DISABLE_COMPFIX=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################################################################
# ALIAS                                                                       #
###############################################################################
alias pip2="${HOME}/.asdf/installs/python/2.7.18/bin/pip2"
alias python2="${HOME}/.asdf/installs/python/2.7.18/bin/python2"

###############################################################################
# PATH                                                                        #
###############################################################################
ORIGINAL_PATH=/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
PATH="${ORIGINAL_PATH}"

# asdf,brew
HOMEBREW_PATH="/opt/homebrew/bin:/opt/homebrew/sbin"
ASDF_PATH="/opt/homebrew/bin/asdf"
PATH="${ASDF_PATH}:${HOMEBREW_PATH}:${PATH}";

# runtimes
DOTNET_PATH="$(asdf where dotnet)/bin"
GOLANG_PATH="$(asdf where golang)/bin"
JAVA_PATH="$(asdf where java)/bin"
LAZYDOCKER_PATH="$(asdf where lazydocker)/bin"
NODE_PATH="$(asdf where nodejs)/bin"
PYTHON_PATH="$(asdf where python)/bin"
RUBY_PATH="$(asdf where ruby)/bin"
TILT_PATH="$(asdf where tilt)/bin"
PATH="${DOTNET_PATH}:${GOLANT_PATH}:${JAVA_PATH}:${LAZYDOCKER_PATH}:${NODE_PATH}:${PYTHON_PATH}:${RUBY_PATH}:${TILT_PATH}:${PATH}"

# convenience
LOCAL_NODE_MODULES_PATH=node_modules/.bin
export PATH="${LOCAL_NODE_MODULES_PATH}:${PATH}"

###############################################################################
# Global Flags                                                                #
###############################################################################
export GPG_TTY=$(tty) #github gpg signing
export JAVA_HOME="${JAVA_PATH}"
export PYTHONHTTPSVERIFY=0 #speedtest-cli

###############################################################################
# Completions                                                                 #
###############################################################################
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit && compinit

fpath=(/Users/phillipsmith/.docker/completions $fpath)
autoload -Uz compinit && compinit

###############################################################################
# Misc                                                                        #
###############################################################################

# set terminal title to basename
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;$(basename $PWD)\a"}
    ;;
esac

# run `zellij` on `alacritty` start up
if [ -n "${ALACRITTY_WINDOW_ID}" ]; then
    if [ -z "$(pgrep zellij)" ]; then
        zellij
    fi;
fi

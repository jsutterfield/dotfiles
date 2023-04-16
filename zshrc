# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jsutterfield/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="dracula/dracula"

# Setup pure them
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure


# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	dirhistory
	copypath
	colored-man-pages
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(jump shell)"

eval "$(direnv hook zsh)"

# JDK
unset JAVA_HOME
export JAVA8_HOME="$(/usr/libexec/java_home -v1.8)"
export JAVA11_HOME="$(/usr/libexec/java_home -v11)"
alias jdk_11='export JAVA_HOME="$JAVA11_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
alias jdk_8='export JAVA_HOME="$JAVA8_HOME" && export PATH="$JAVA_HOME/bin:$PATH"'
jdk_11 # Use jdk 11 as the default jdk

unalias "..."
export EDITOR="nvim"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
bindkey \^U backward-kill-line

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/opt/postgresql@11/bin

# Enable bazel tab completion
if [ -d $(brew --prefix)/share/zsh/site-functions ]; then
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

# git aliases
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gg="git grep"
alias gs="git status"
alias gl="git log"
alias gam='git commit -am'
alias gama='git add -A && git commit --amend'
alias gclean='git branch -D $(git branch | grep "^[[:space:]]*arcpatch")'
gcm="git checkout main && git pull -r origin main"

# arc aliases
alias ad="arc diff"
alias adu="arc diff --update"
alias al="arc list"
alias af="arc flow"
alias ac="arc cascade"

# bazel aliases
alias bt="bazel test ..."
alias bb="bazel build ..."

# gazelle aliases
alias gz="gazelle"

# uber dir aliases
alias wp="cd /Users/jsutterfield/Uber/go-code/src/code.uber.internal/money/wallet-presentation"
alias wo="cd /Users/jsutterfield/Uber/go-code/src/code.uber.internal/money/wallet-onboarding"
alias mo="cd /Users/jsutterfield/Uber/go-code/src/code.uber.internal/money"
alias pop="cd /Users/jsutterfield/Uber/go-code/src/code.uber.internal/money/payments-onboarding-presentation"

# uber command aliases
alias c="cerberus"

# other aliases
alias ff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fixit='paste -s -d " " <(pbpaste) | pbcopy'
alias vim="nvim"
alias nv="nvim"

# fixes for Uber environment
export PATH=/usr/bin:"$PATH"

# fzf settigs
FZF_DEFAULT_COMMAND=fd

# Great commands to have on your system
# rg (ripgrep)
# tldr
# fzf
# fd (improved find)

# find all files containing the word "interface" and sort the results by modification time
# rg -l interface | xargs ls -lt

# Do this homie
# https://www.atlassian.com/git/tutorials/dotfiles

source /Users/jsutterfield/.config/broot/launcher/bash/br

# alias to manage dotfiles
alias config='/usr/bin/git --git-dir=/Users/jsutterfield/.cfg/ --work-tree=/Users/jsutterfield'

# connect to go devpod
alias dev="ssh jsutterfield.devpod-nld"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kardan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery brew catimg colored-man colorize command-not-found common-aliases emoji-clock extract osx sublime themes zsh_reload virtualenv pj wd web-search z mandlebrot)
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim'
  fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
  export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias plssubl='subl'
alias nano='vim'
alias subl='vim'

bindkey -v

if [[ $(hostname) == "Maxwell.local" || $(hostname) == "vps.johnwiseheart.me" ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/github
  source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH=$PATH:/Users/john/adt-bundle-mac/sdk/platform-tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:/Users/john/Documents/uni/cs3231/os161-osx/bin
export PATH=$PATH:/Users/john/.llvm/bin
export PATH=$PATH:/Users/john/bin
export MAKESYSPATH=/Users/john/Documents/uni/cs3231/os161-osx/share/mk/
bindkey -v
bindkey '^R' history-incremental-search-backward
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Some stuff should only happen on my personal computer:
if [[ $(uname) == "Darwin" ]] ; then
  alias vim='mvim -v'
  alias nano='mvim -v'
  source /Users/john/.iterm2_shell_integration.zsh
  OSXey -c
fi

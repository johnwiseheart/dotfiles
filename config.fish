# Path to your oh-my-fish.
set fish_path $HOME/.dotfiles/oh-my-fish
set -gx  LC_ALL en_US.UTF-8
# Theme
set fish_theme bobthefish

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme brew localhost jump osx tab msg tmux

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

eval (python -m virtualfish)

alias cp 'cp -i'
alias rm 'rm -i'
alias mv 'mv -i'
alias cls 'clear'

# colors ls
if test (uname) = "Linux"
  alias ls     'ls --color=auto'
  alias dir    'dir --color=auto'
  alias vdir   'vdir --color=auto'
else if which brew > /dev/null ; and brew info coreutils | grep -v 'Not installed' > /dev/null
  alias ls     'gls --color=auto'
  alias dir    'gdir --color=auto'
  alias vdir   'gvdir --color=auto'
end

# colors other
alias grep     'grep --color=auto'
alias gfrep    'fgrep --color=auto'
alias egrep    'egrep --color=auto'

# more ls
alias ll       'ls -l'
alias la       'ls -A'
alias l        'ls -CF'

alias pls 'sudo'
alias finer 'open .'

# LS_COLORS
if not [ -r ~/.dircolors ]
  touch ~/.dircolors
end

if which gdircolors > /dev/null
  eval (gdircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')
else if which dircolors > /dev/null
  eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')
end

set -x TERM xterm-256color




if test -n "$DISPLAY"
  if test -z "$VIM"
    if test -z "$TMUX"
      tmux attach; or tmux new
    end
  end
end



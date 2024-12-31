# Add deno completions to search path
# if [[ ":$FPATH:" != *":/home/mohan/.zsh/completions:"* ]]; then export FPATH="/home/mohan/.zsh/completions:$FPATH"; fi
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh/site-functions
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /opt/google-cloud-cli/path.zsh.inc
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export PATH="$PATH:$HOME/go/bin:$HOME/scripts:$HOME/Dev/greyhr-mark-attendence"
export EDITOR=nvim
export CHROME_EXECUTABLE=/usr/bin/chromium
# fzf theme [catppuccin]
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export MANPAGER='nvim +Man!'
export PASSWORD_STORE_DIR="$HOME/password-store"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"

# Enable persistent history
HISTFILE=~/.zsh_history  # Location of history file
HISTSIZE=10000           # Number of commands to keep in memory
SAVEHIST=10000           # Number of commands to save to the file
setopt appendhistory     # Append history to the file (don't overwrite)
setopt sharehistory      # Share history between Zsh sessions

# Use Emacs keybindings (disable Vim mode)
bindkey -e

# Enable Ctrl+X E for editing the current command
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Enable history search with arrow keys
bindkey '^[[A' history-search-backward  # Up arrow key
bindkey '^[[B' history-search-forward   # Down arrow key
bindkey '^R' history-incremental-search-backward

# Use Ctrl+P for previous command
bindkey '^P' up-line-or-history

# Use Ctrl+N for next command
bindkey '^N' down-line-or-history

# Bind Ctrl+F to accept the suggestion
bindkey '^F' autosuggest-accept

alias vim=nvim
alias v='nvim'
alias ls='eza'
alias l='eza -l'
alias gu='git pull'
alias gp='git push'
alias gc='git checkout'

eval "$(fnm env --use-on-cd)"

fpath+=~/.zfunc

# Enable Zsh's completion system
autoload -U compinit
compinit

# Enable Alt + Left Arrow for moving backward by word
bindkey '\e[1;3D' backward-word
# Enable Alt + Right Arrow for moving forward by word
bindkey '\e[1;3C' forward-word
# Ctrl + Left Arrow to move backward by word
bindkey '\e[1;5D' backward-word
# Ctrl + Right Arrow to move forward by word
bindkey '\e[1;5C' forward-word


# Enhanced completion options
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format '%B%F{yellow}%d%f%b'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' group-name ''
# Enable case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

eval "$(luarocks path --bin)"
eval "$(oh-my-posh init zsh --config $HOME/.posh_theme.json)"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$(npm config get prefix)/bin"
export PATH="$HOME/.gem/ruby/$(ruby -e 'puts RUBY_VERSION')/bin:$PATH"
. /opt/homebrew/etc/profile.d/z.sh

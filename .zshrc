export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/opt/google-cloud-cli/bin:/home/mohan/Android/Sdk/emulator/:/home/mohan/scripts:/home/mohan/.cargo/bin"

ZSH_THEME="eastwood"
#zstyle ':omz:plugins:nvm' lazy yes # lazy loading nvm

plugins=(
#  nvm
  git
  zsh-autosuggestions
  gcloud
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
source /opt/google-cloud-cli/path.zsh.inc
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

alias vim=nvim
alias v=nvim
alias startx-amd='XORGCONFIG=amd.conf startx'
alias startx-intel='XORGCONFIG=intel.conf startx'
export EDITOR=nvim

# fzf theme [catppuccin]
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

eval "$(fnm env --use-on-cd)"

fpath+=~/.zfunc
compinit


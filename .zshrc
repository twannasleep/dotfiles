# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# ===== Core Configuration =====
export TERM="xterm-256color"
export EDITOR='nvim'
export LANG=en_US.UTF-8

# ===== Path Configuration =====
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"

# ===== Oh My Zsh =====
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

# ===== Plugins =====
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    # Consider adding these useful plugins:
    # docker
    # npm
    # node
    # macos
)

source $ZSH/oh-my-zsh.sh

# ===== History =====
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# ===== Aliases =====
# File Navigation
alias ls='ls -G'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Config Files
alias zc="code ~/.zshrc"
alias tc="code ~/.tmux.conf"
alias sc="code ~/.config/starship.toml"
alias kc="code ~/.config/kitty/kitty.conf"
alias sz="source ~/.zshrc"

# Git Shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

# Development
alias dc='docker-compose'
alias k='kubectl'
alias py='python3'
alias pip='pip3'
alias npmls='npm list --depth=0'
alias npmlsg='npm list -g --depth=0'

# ===== Tmux Configuration =====
# Tmux Aliases
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias tkall="tmux kill-server"
alias tks="tmux kill-session"

# Auto Tmux (start or attach to 'main' session)
if [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ]; then
    tmux new-session -A -s main
fi

# Development Layout Function
function tdev() {
    session_name=${1:-dev}
    tmux new-session -d -s "$session_name"
    tmux split-window -h -t "$session_name"
    tmux split-window -v -t "$session_name:1.1"
    tmux select-pane -t "$session_name:1.0"
    tmux attach-session -t "$session_name"
}

# 3-pane horizontal layout
function th() {
    session_name=${1:-horizontal}
    tmux new-session -d -s "$session_name"
    tmux split-window -v -t "$session_name"
    tmux split-window -v -t "$session_name"
    tmux select-pane -t "$session_name:1.0"
    tmux attach-session -t "$session_name"
}

# 4-pane grid layout
function tg() {
    session_name=${1:-grid}
    tmux new-session -d -s "$session_name"
    tmux split-window -h -t "$session_name"
    tmux split-window -v -t "$session_name:1.0"
    tmux split-window -v -t "$session_name:1.1"
    tmux select-pane -t "$session_name:1.0"
    tmux attach-session -t "$session_name"
}

# ===== Node Version Manager =====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ===== Starship Prompt =====
eval "$(starship init zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Terminal Setup Guide

This guide covers the setup and usage of Zsh and Tmux configuration for macOS.

## Installation

### Prerequisites

```bash
Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Install required packages
brew install tmux zsh
Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Configuration Files

### Zsh Configuration (.zshrc)
The Zsh configuration provides:
- Oh My Zsh with robbyrussell theme
- Autosuggestions and syntax highlighting
- Tmux integration
- Useful aliases

### Tmux Configuration (.tmux.conf)
The Tmux configuration offers:
- Mouse support
- VS Code-like split commands
- Easy window/pane navigation
- Copy mode with vim keybindings

## Key Features

### Tmux Session Management
```bash
t # Start tmux
tn name # Create new session
ta name # Attach to session
tl # List sessions
tk name # Kill specific session
tka # Kill all sessions except current
tkall # Kill all sessions
tks # Kill current session
```


### Development Layout
```bash
tdev [name] # Create development layout with 3 panes
```


### Tmux Key Bindings
- **Window Navigation**:
  - `Option + 1-5`: Switch to window 1-5

- **Pane Management**:
  - `Option + \\`: Split vertically
  - `Option + -`: Split horizontally
  - `Option + Arrow`: Navigate panes
  - `Option + Shift + Arrow`: Resize panes

- **Copy Mode**:
  - `Option + c`: Enter copy mode
  - `v`: Start selection
  - `y`: Copy selection

### Core Aliases
```bash
ll # List files with details
zc # Edit zshrc in VS Code
```


## Customization

### Change Zsh Theme
Edit `.zshrc` and modify:
```bash
ZSH_THEME="robbyrussell" # Default theme
Available alternatives:
ZSH_THEME="eastwood" # Minimal with git info
ZSH_THEME="clean" # Clean and simple
ZSH_THEME="minimal" # Ultra minimal
```


### Add New Plugins
Edit `.zshrc` plugins section:
```bash
plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
# Add new plugins here
)
```


## Troubleshooting

### Tmux Plugin Installation
If plugins aren't working:
1. Open tmux
2. Press `Prefix` + `I` (capital I) to install plugins
3. Restart tmux

### Zsh Plugin Issues
If zsh plugins aren't working:
```bash
Verify plugin installation
ls ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
Reinstall if needed
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
Then reinstall using the installation commands above
```


## Updates and Maintenance

### Update Oh My Zsh
```bash
omz update
```


### Update Tmux Plugins
1. Press `Prefix` + `U` to update plugins
2. Press `Prefix` + `I` to install new plugins

### Reload Configurations
```bash
source ~/.zshrc # Reload zsh configuration
tmux source ~/.tmux.conf # Reload tmux configuration
```

This documentation provides a comprehensive guide for:
1. Installation steps
2. Key features and usage
3. Customization options
4. Troubleshooting common issues
5. Maintenance procedures
if status is-interactive
   starship init fish | source
end

# Set Editor
set EDITOR "emacsclient -c"

# HiDPI
set QT_AUTO_SCREEN_SCALE_FACTOR 1
# set GDK_SCALE 2
# set GDK_DPI_SCALE 0.5

# Create XDG_RUNTIME_DIR
set XDG_RUNTIME_DIR "/tmp/$USER-runtime-dir"
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR

# Start X on login
if status is-login
   startx
end

# Disable the greeting
set fish_greeting

# Zoxide
zoxide init fish | source

# Aliases
# General Aliases
alias ls 'exa -1l --sort=size'
alias l 'exa -1al --sort=size'
alias mkdir 'mkdir -p'

alias .1 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'

# XBPS Aliases
alias xbps-i 'sudo xbps-install'
alias xbps-isyu 'sudo xbps-install -Syu'
alias xbps-is 'sudo xbps-install -S'
alias xbps-r 'sudo xbps-remove'
alias xbps-roo 'sudo xbps-remove -oO'
alias xbps-q 'xbps-query'
alias xbps-qrs 'xbps-query -Rs'
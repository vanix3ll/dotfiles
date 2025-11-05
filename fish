# Fish Shell Configuration for Fedora
# Place this in ~/.config/fish/config.fish

# Disable greeting
set -g fish_greeting


set -x LD_LIBRARY_PATH "/usr/local/lib64:/usr/local/lib" $LD_LIBRARY_PATH

set -x DRI_PRIME 0
set -x LIBVA_DRIVER_NAME iHD
# Enable vi key bindings (optional, comment out if you prefer default)
# fish_vi_key_bindings

# Set default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Path additions
fish_add_path ~/.local/bin
fish_add_path ~/bin

# Import colorscheme from 'wal' asynchronously
if type -q wal
    cat ~/.cache/wal/sequences &
end

#set -Ux ELECTRON_OZONE_PLATFORM_HINT wayland
#set -Ux NOBLE_GPU true
#set -Ux MOZ_ENABLE_WAYLAND 1
#set -Ux QT_QPA_PLATFORM wayland
#set -Ux GDK_BACKEND wayland,x11
# Aliases - Common shortcuts
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# DNF/Package management aliases
alias update='sudo dnf update'
alias install='sudo dnf install'
alias search='dnf search'
alias remove='sudo dnf remove'

fish_add_path ~/.cargo/bin
# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# System shortcuts
alias ports='sudo ss -tulpn'
alias mem='free -h'
alias disk='df -h'




# Enable autocompletion for common tools
if type -q dnf
    complete -c dnf -w dnf
end

# Fast directory jumping with 'z' (if installed)
if type -q zoxide
    zoxide init fish | source
end

# Starship prompt (install with: dnf install starship)
if type -q starship
    starship init fish | source
else
    # Simple fallback prompt if starship not installed
    function fish_prompt
        set_color cyan
        echo -n (prompt_pwd)
        set_color normal
        echo -n ' > '
    end
end

# Auto-suggestions color (make it less intrusive)
set -g fish_color_autosuggestion 555 brblack

# Syntax highlighting colors (minimal, clean look)
set -g fish_color_command blue
set -g fish_color_param normal
set -g fish_color_error red
set -g fish_color_quote yellow

# Enable fzf integration (if installed: dnf install fzf)
if type -q fzf
    fzf --fish | source
end

# Fast command-not-found handler for Fedora
if test -f /usr/libexec/pk-command-not-found
    function fish_command_not_found
        /usr/libexec/pk-command-not-found $argv[1]
    end
end

# Performance: Reduce history size for speed
set -g fish_history_max 5000

# Auto-update completions on first run
if not test -f ~/.config/fish/completions_updated
    fish_update_completions
    touch ~/.config/fish/completions_updated
end

fish_add_path /home/vanny/.spicetify

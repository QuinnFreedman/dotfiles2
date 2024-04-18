fish_add_path "~/.local/bin"
fish_add_path "~/.cargo/bin"
fish_add_path "~/.scripts"
fish_add_path "~/.local/share/flatpak/exports/bin"

if status is-interactive
    rps --init fish | source

    if type -q hx
        set -Ux EDITOR (which hx)
        set -Ux SUDO_EDITOR $EDITOR
    end

    bind -k up history-prefix-search-backward
    bind \e\[A history-prefix-search-backward
    bind -k down history-prefix-search-forward
    bind \e\[B history-prefix-search-forward

    if type -q lsd
        alias ls="lsd"
        alias ll="lsd -lh"
        alias lla="lsd -lah"
        alias la="lsd -a"
        alias lt="lsd --tree"
    end

    function fish_greeting
    end

    alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    zoxide init fish | source
end

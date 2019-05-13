local PLUG_FILE=~/.config/nvim/autoload/plug.vim
# PLUG_URL = "https://raw.githubusercontent.com/junegunn/vim-plug/518a3566c32cec35c68749c765127ef6f7703630/plug.vim"
if [ ! -f "$PLUG_FILE" ]; then
    echo "Vim Plug is not installed; Downloading..."
    curl -fLso "$PLUG_FILE" --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

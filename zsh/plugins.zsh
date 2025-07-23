export PLUGIN_DIR=$HOME/.zim

if [[ ! -d $PLUGIN_DIR ]]; then
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	rm ~/.zimrc
	ln -s ~/oh-my-dotfiles/zsh/zimrc ~/.zimrc
fi

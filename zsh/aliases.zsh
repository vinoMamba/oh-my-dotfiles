alias n='nvim'
alias la='lazygit'
alias cc='claude'
alias S='fastfetch'
alias ta='tmux attach'
alias tm='tmux'


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
alias jo='y'

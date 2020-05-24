_fzf_complete_git() {
	ARGS="$@"
	local branches
	branches=$(git branch --all --sort=-committerdate --format="%(refname:short)")
	if [[ $ARGS == 'git co'* || $ARGS == 'git checkout'* || $ARGS == 'git merge'* ]]; then
		_fzf_complete -- "$@" < <(
			echo $branches
		)
	else
		eval "zle ${fzf_default_compeltion:-expand-or-complete}"
	fi
}

_fzf_complete_git_post() {
	sed "s/^origin\///"
}

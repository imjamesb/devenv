export ZSH="$HOME/.oh-my-zsh"
HIST_STAMPS="dd/mm/yyyy"
PLUGINS=(
	git
	docker
	docker-compose
	zsh-syntax-highlighting
	zsh-autosuggestions
)
ZSH_AUTOSUGGEST_STRATEGY=completion
source $ZSH/oh-my-zsh.sh

alias l="exa -la"
alias ll="exa -l"
alias la="exa -a"

alias gi="git init"
alias gclone="git clone"
alias gpull="git pull"
alias gc="git commit"
alias gcm="gc -m"
alias gp="git push"
alias gpuo="git push -u"
alias gpu="gpuo origin"
alias gt="git tag"
alias ga="git add"
alias grm="git rm"
alias gr="git remote"
alias gb="git branch"

alias D="D"
alias dps="D ps"
alias dpsa="dps -a"
alias did="dps -q"
alias dida="did -a"
alias ds="D stop"
alias dr="D run"
alias drm="D rm"
alias dl="D logs"

alias dc="docker-compose"
alias dcua="dc up"
alias dcu="dcua -d"
alias dcd="dc down"
alias dcs="dc stop"
alias dcr="dc restart"
alias dcl="dc logs"
alias dclf="dcl -f"

alias python="python3"
alias py="python"
alias p3="py"
alias py2="python2"

function mc () {
	mkdir $1
	cd $1
}

function dsa () {
	did | xargs docker stop
}

function dsrm () {
	dsa
	dida | xargs docker rm
}

alias mkdir="mkdir -p"
alias rm="rm -rf"
alias c="printf '\x1bc\x1b[3J'"
alias batcat="batcat --theme TwoDark --style full -P"
alias bat="batcat"

eval "$(starship init zsh)"

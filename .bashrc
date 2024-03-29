# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='[\A] ${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$ '
else
	PS1='[\A] ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;[\A] ${debian_chroot:+$debian_chroot}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# Always TMUX
if [[ ! -v TMUX && $TERM_PROGRAM != "vscode" ]]; then
	tmux-chooser.bash && exit
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#Python Virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_VIRTUALENV=/home/chris/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

# Discord
export PATH="$PATH:/usr/bin/discord"
# Dotnet
export DOTNET_ROOT=/usr/share/dotnet
export DOTNET_TOOLS=$HOME/.dotnet/tools
export PATH="$PATH:$DOTNET_TOOLS"
export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$DOTNET_ROOT"

#NVIM
export CUSTOM_NVIM_PATH=/usr/local/bin/nvim.appimage
#Extending path with custom scripts
export PATH=$PATH:~/.scripts/

export SSH_AUTH_SOCK=~/.1password/agent.sock

## ENVIRONMENT VARIABLES
export LOCAL_SCRIPTS=$HOME/.local/bin/
export PROJECTS_HOME=$HOME/coding/projects
export CODING_HOME=$HOME/coding
export CURRENT_PROJECT=$PROJECTS_HOME/portfolio-site/
export TEST_VAR="Test Variable"

## ALIASES
#
#MONGO ALIASES
alias mongostart='sudo systemctl start mongod'
alias mongostop='sudo systemctl stop mongod'
alias mongorestart='sudo systemctl restart mongod'
alias mongostatus='sudo systemctl status mongod'

#USER ALIASES
alias nvim=$CUSTOM_NVIM_PATH
alias snvim='sudo -E -s nvim'
alias vimdiff='nvim -d'
alias startproj='cd $CURRENT_PROJECT && tmux split-window -v npm run dev && tmux split-window -h && tmux select-pane -U && nvim .'
alias setproj='export CURRENT_PROJECT=$PROJECTS_HOME/$1'
#SYSTEM ALIASES
alias bootlin='cd / && cp /boot/grub.lin /boot.cfg && shutdown -r now'
alias bootwin='cd / && cp /boot/grub.win /boot.cfg && shutdown -r now'

alias compcppprof="g++ main.cpp -o a.out"
alias exccpp="./a.out && echo $?"
alias compexccpp="g++ main.cpp -o a.out && ./a.out && echo $?"
alias compexccppwprof="g++ main.cpp -o a.out -pg && ./a.out && echo $?"

#MISC ALIASES
alias factorio='bash ~/.config/factorio/factorio.sh'

#PATH Extensions
export PATH=$PATH:/usr/local/go/bin

#Dotfiles git alias
export DOTFILES=$HOME/.cfg
alias config-args='--git-dir=$DOTFILES --work-tree=$HOME'
#alias config='/usr/bin/git --git-dir=/home/chris/.cfg/ --work-tree=/home/chris'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias config-lazygit='lazygit --git-dir=$DOTFILES --work-tree=$HOME'

## USER DEFINED FUNCTIONS
calc() {
	echo "$*" | bc -l
}
export -f calc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chris/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/chris/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/home/chris/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/chris/anaconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
source /home/chris/Builds/alacritty/extra/completions/alacritty.bash

cdnvm() {
	command cd "$@" || return $?
	nvm_path=$(nvm_find_up .nvmrc | tr -d '\n')

	# If there are no .nvmrc file, use the default nvm version
	if [[ ! $nvm_path = *[^[:space:]]* ]]; then

		declare default_version
		default_version=$(nvm version default)

		# If there is no default version, set it to `node`
		# This will use the latest version on your machine
		if [[ $default_version == "N/A" ]]; then
			nvm alias default node
			default_version=$(nvm version default)
		fi

		# If the current version is not the default version, set it to use the default version
		if [[ $(nvm current) != "$default_version" ]]; then
			nvm use default
		fi

	elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
		declare nvm_version
		nvm_version=$(<"$nvm_path"/.nvmrc)

		declare locally_resolved_nvm_version
		# `nvm ls` will check all locally-available versions
		# If there are multiple matching versions, take the latest one
		# Remove the `->` and `*` characters and spaces
		# `locally_resolved_nvm_version` will be `N/A` if no local versions are found
		locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

		# If it is not already installed, install it
		# `nvm install` will implicitly use the newly-installed version
		if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
			nvm install "$nvm_version"
		elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
			nvm use "$nvm_version"
		fi
	fi
}

alias cd='cdnvm'
cdnvm "$PWD" || exit

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$PATH:/opt/mssql-tools18/bin"

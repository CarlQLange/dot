workspace=/Users/carllange/Desktop/workspace
ws=/Users/carllange/Desktop/workspace

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export TERM=screen-256color

alias ,="ls -la"
alias l="ls -qgh"
alias ll="tree -CL 1"
alias lll="tree -CL 2"
alias llll="tree -CL 3"
alias lllll="tree -CL 4"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias rmr="rm -r"

alias serve="echo http://127.0.0.1:24601 && python3 -m http.server 24601"

#even more git shortcuts (use the oh-my-zsh git plugin for more)
alias gsu="git submodule update"
alias gsui="git submodule update --init"
alias gsuir="git submodule update --init --recursive"
alias gt="git tag"
alias gst="git status -sb"
alias gf="git fetch"
alias gft="git fetch --tags"
alias gbc="git checkout -b"
alias gcl="git clone"
alias gs="git stash"
alias gsp="git stash pop"
alias gsh="git stash show"

#colourised cat via pygmentized
alias c="pygmentize -O style=monokai -f console256 -g"

#quicklook
ql () { qlmanage -xp $@ &> /dev/null &! }
alias q=ql

export OSXROOT="/"
export OSXHOME="~"
export WINROOT="/Volumes/BOOTCAMP"
export WINHOME="/Volumes/BOOTCAMP/Users/Carl"

alias w/="cd $WINROOT"
alias w~="cd $WINHOME"
alias m/="cd $OSXROOT"
alias m~="cd $OSXHOME"
alias o/=m/
alias o~=m~

#get a summary from wikipedia via DNS
function wiki () { blah=`echo $@ | sed -e 's/ /_/g'`; dig +short txt $blah.wp.dg.cx; }

#approximate size of anything (you need to make this nice, it looks awful)
function howbig () { 
	FULLSIZE=$(du -c $@ | ack "^\d*\s+total$" | ack -o "\d+");
	FULLSIZE=$(expr $FULLSIZE \* 512)
	SIZE=$FULLSIZE
	TYPE="B"

	if [ "$SIZE" -gt 1024 ] 
		then
			SIZE=$(expr $SIZE / 1024)
			TYPE="KB"
	fi
	
	if [ "$SIZE" -gt 1024 ] 
		then
			SIZE=$(expr $SIZE / 1024)
			TYPE="MB"
	fi

	if [ "$SIZE" -gt 1024 ] 
		then
			SIZE=$(expr $SIZE / 1024)
			TYPE="GB"
	fi

	if [ "$SIZE" -gt 1024 ] 
		then
			SIZE=$(expr $SIZE / 1024)
			TYPE="TB"
	fi
		
	echo "Roughly $SIZE $TYPE";
}
alias big=howbig
alias s=howbig

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload zmv
alias mmv='noglob zmv -W'

# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'

export PATH=$PATH:/opt/android-sdk-update-manager/platform-tools:/opt/repo
export TERM=xterm-256color

createbranch() {
	git checkout -b dev_dbudyak_ANDROID-$1
}
checkoutbranch() {
	git checkout dev_dbudyak_ANDROID-$1
}

DEF_BRANCH=release_6.1
TEMP_BRANCH=undef

alias gs='git status'
alias gn='git rev-parse --abbrev-ref HEAD'
alias gj='`gn` | sed "s/dev_dbudyak_//g"'
alias ga='git add .'
alias gc='git commit -m "fix `gj`"'
alias gpush='git push origin `gn`'
alias gpull='git pull origin `gn`'

alias gacp='`ga` && `gc` && `gp`'
alias greset='git reset --hard HEAD'
alias ggr='export TEMP_BRANCH=`gn` && git checkout $DEF_BRANCH'
alias ggb='git checkout $TEMP_BRANCH'

alias gcreate=createbranch
alias gcheckout=checkoutbranch

alias grmerge='git merge $DEF_BRANCH'
alias gbmerge='git merge $TEMP_BRANCH'

alias ghelp='cat ~/.bashrc | grep "alias g"'


alias lsdev='adb devices -l | tail -n +2'

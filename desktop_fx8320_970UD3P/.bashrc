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

alias wgetpaste='wgetpaste -s gists'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'

alias lsdev='adb devices -l | tail -n +2'
alias lsdevn=lsdevnfunc
alias logcat='adb logcat'


alias adb1='adb -s `lsdevn 1`'
alias adb2='adb -s `lsdevn 2`'
alias adb3='adb -s `lsdevn 3`'
alias adb4='adb -s `lsdevn 4`'
alias adb5='adb -s `lsdevn 5`'

alias logcat1='adb -s `lsdevn 1` logcat -v tag'
alias logcat2='adb -s `lsdevn 2` logcat -v tag'
alias logcat3='adb -s `lsdevn 3` logcat -v tag'
alias logcat4='adb -s `lsdevn 4` logcat -v tag'
alias logcat5='adb -s `lsdevn 5` logcat -v tag'
alias logcat6='adb -s `lsdevn 6` logcat -v tag'
alias logcat7='adb -s `lsdevn 7` logcat -v tag'
alias logcat8='adb -s `lsdevn 8` logcat -v tag'
alias logcat9='adb -s `lsdevn 9` logcat -v tag'

export PATH=$PATH:/opt/android-sdk-update-manager/platform-tools:/opt/repo:/opt/android-sdk-update-manager/tools/bin
export TERM=xterm-256color
export OKKO=~/dev/okkodroid
#export ANDROID_LOG_TAGS="ActivityManager:I TheApplication:D *:S"

createbranch() {
	git checkout -b dev_dbudyak_ANDROID-$1
}
checkoutbranch() {
	git checkout dev_dbudyak_ANDROID-$1
}

lsdevnfunc() {
	lsdev | awk '{print $1}' | sed "$1q;d"
}

DEF_BRANCH=master
TEMP_BRANCH=undef

alias gs='git status'
alias gn='git rev-parse --abbrev-ref HEAD'
alias gj='`gn` | sed "s/dev_dbudyak_//g"'
alias ga='git add .'
#alias gc='git commit -m "fix $(gn | sed '')"'
alias gpush='git push origin `gn`'
alias gpull='git pull origin `gn`'
alias glastbranch='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'

alias gacp='`ga` && `gc` && `gp`'
alias greset='git reset --hard HEAD'
alias ggr='export TEMP_BRANCH=`gn` && git checkout $DEF_BRANCH && echo "switched from $TEMP_BRANCH to $DEF_BRANCH"'
alias ggb='git checkout $TEMP_BRANCH && echo "switched from $DEF_BRANCH to $TEMP_BRANCH"'

alias ghard='git reset --hard HEAD'
alias gcreate=createbranch
alias gcheckout=checkoutbranch

alias grmerge='git merge $DEF_BRANCH'
alias gbmerge='git merge $TEMP_BRANCH'

alias ghelp='cat ~/.bashrc | grep "alias g"'


alias dpu='adb -s $TV_EMU shell input keyevent 19'
alias dpd='adb -s $TV_EMU shell input keyevent 20'
alias dpl='adb -s $TV_EMU shell input keyevent 21'
alias dpr='adb -s $TV_EMU shell input keyevent 22'
alias dpc='adb -s $TV_EMU shell input keyevent 23'
alias dpb='adb -s $TV_EMU shell input keyevent 4'


alias assembleTv='./gradlew :tv:clean :tv:assembleDebug :tv:assembleRelease'
alias assembleTvDebug='./gradlew :tv:clean :tv:assembleDebug'
alias assembleTvRelease='./gradlew :tv:clean :tv:assembleRelease'

alias assembleMobile='./gradlew :mobile:clean :mobile:assembleDebug :mobile:assembleRelease'
alias assembleMobileDebug='./gradlew :mobile:clean :mobile:assembleDebug'
alias assembleMobileRelease='./gradlew :mobile:clean :mobile:assembleRelease'

alias assembleAll='./gradlew :tv:clean :mobile:clean :mobile:assembleDebug :mobile:assembleRelease :tv:assembleDebug :tv:assembleRelease'

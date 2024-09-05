# Uncomment if using MacOS
MACOS=false

# Set your Thunderbird build Directory
if [[ -v MACOS ]];
then
  BUILD_DIR="$HOME/Developer/Thunderbird"
  PROFILE_DIR="\"$HOME/Developer/Thunderbird/profile\""
else
  BUILD_DIR="$HOME/Projects/Thunderbird"
  PROFILE_DIR="\"$HOME/Projects/Thunderbird/profile\""
fi

TRY_FLAGS="\"try: -b o -p all -u all --artifact\""

# Set the Thunderbird build dist path for running with custom profile
# depending on if using MacOS or Linux
if [[ -v MACOS ]];
then
  DIST_PATH="obj-*/dist/Thunderbird\ Daily.app/Contents/MacOS/thunderbird"
else
  DIST_PATH="obj-*/dist/thunderbird"
fi

alias bmks="hg bookmarks"
alias delbmk="hg bookmark -d"
alias mkbmk="hg bookmark"
alias mach="$BUILD_DIR/source/mach"
alias clobber="mach clobber"
alias buildtb="mach build"
alias runtb="$BUILD_DIR/source/$DIST_PATH -no-remote -wait-for-browser -profile $PROFILE_DIR -attach-console"
alias trytb="hg push-to-try -s ssh://hg.mozilla.org/try-comm-central -m $TRY_FLAGS"
alias try-comm="hg push-to-try -s ssh://hg.mozilla.org/try-comm-central"
alias up-comm="hg up main && hg pull comm -u"
alias up-src="hg up main && hg pull central -u"
